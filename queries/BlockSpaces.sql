--
select *
from "BlockSpaces"
-- where "ProposalId"=168 and "FlightId"=3190
where "ProposalId"=184
;

select *
from "BlockSpaces"
where "MemberBlockIdentifier" = 'I44YB0Q3Z'
-- where "MemberBlockIdentifier" = 'I44YB0Q3Z'
;
select *
from "BlockSpaces"
where "FlightId" = '3189'
;



select *
from "BlockSpaces"
where "ProposalId" = 137
  and "FlightId" = 2691
;

select *
from "BlockSpaces"
where "MemberBlockIdentifier" = 'I33HOCUOD'
;
delete
from "BlockSpaces"
where "ProposalId"=184
;
--
--
select *
from "Flights"
where "Id" = 3190
;
--
select *
from "FlightIntegrations"
where "Id" = 50273
;
--
select *
from "Flights"
where "FlightIntegrationId" = 50273;

--flights for integrations
select fl."Id"  as "FlightId",
       p."Id"   as "ProposalId",
       s."Id"   as "SeriesId",
       c."Code" as "CustomerCode",
       od."Id"  as "OriginDestinationId"
from "FlightIntegrations" fi
         inner join public."Flights" Fl on "fi"."Id" = Fl."FlightIntegrationId"
         INNER JOIN public."OriginDestinations" od ON fl."OriginDestinationId" = od."Id"
         INNER JOIN public."Series" s ON od."SeriesId" = s."Id"
         INNER JOIN public."Proposals" p ON s."ProposalId" = p."Id"
         INNER JOIN public."Companies" c ON p."CustomerId" = c."Id"
where fi."Id" = 48716
;
--
select *
from "BlockSpaces"
where "FlightId" = 3068;

--
--set Proposals as Rejected
update "Proposals"
set "Status" = 1
;

--set Proposals as Done
update "Proposals"
set "Status" = 5
where "Id" in (168, 184);

-- Done proposals
select *
from "Proposals"
where "Status" = 5;


--NO0510MXPMLE16JAN26
--
-- proposal with flights
select fi."SegmentFlightIdentifier",
       concat(d."Name", '-', d."Id") as "Destination",
       P."Id"                        as "ProposalId",
       c."Code",
       s."Id"                        as SeriesId,
       fl."Id"                       as FlightId,
       OD."Id"                       as OriginDestinationId,
       fi."SegmentBoardingPoint"     as "BoardingPoint",
       fi."SegmentDeplaningPoint"    as "DeplaningPoint",
       fi."SegmentDepartureDateTime",
       fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Destinations" D on P."DestinationId" = D."Id"

-- where fi."SegmentFlightIdentifier" = '1234567890'  and c."Code" = 'AL'
-- where  c."Code" = 'AL'
where P."Status" = 5
  and fl."Id" = 3190
order by fi."SegmentDepartureDateTime";


-- fligths with AL and VR
WITH TargetIntegrations AS (SELECT fi."Id"
                            FROM public."FlightIntegrations" fi
                                     INNER JOIN public."Flights" fl ON fi."Id" = fl."FlightIntegrationId"
                                     INNER JOIN public."OriginDestinations" od ON fl."OriginDestinationId" = od."Id"
                                     INNER JOIN public."Series" s ON od."SeriesId" = s."Id"
                                     INNER JOIN public."Proposals" p ON s."ProposalId" = p."Id"
                                     INNER JOIN public."Companies" c ON p."CustomerId" = c."Id"
                            WHERE c."Code" IN ('AL', 'VR')
                              and p."Status" = 5
                            GROUP BY fi."Id"
                            HAVING COUNT(DISTINCT c."Code") = 2)
SELECT fi."Id"                    AS "FlightIntegrationId",
       fi."SegmentFlightNumber"   AS "SegmentFlightNumber",
       fi."SegmentBoardingPoint"  AS "SegmentBoardingPoint",
       fi."SegmentDeplaningPoint" AS "SegmentDeplaningPoint",
       fl."Id"                    AS "FlightId",
       c."Code"                   AS "CustomerCode",
       p."Id"                     AS "ProposalId"
FROM public."FlightIntegrations" fi
         INNER JOIN public."Flights" fl ON fi."Id" = fl."FlightIntegrationId"
         INNER JOIN public."OriginDestinations" od ON fl."OriginDestinationId" = od."Id"
         INNER JOIN public."Series" s ON od."SeriesId" = s."Id"
         INNER JOIN public."Proposals" p ON s."ProposalId" = p."Id"
         INNER JOIN public."Companies" c ON p."CustomerId" = c."Id"
WHERE fi."Id" IN (SELECT "Id" FROM TargetIntegrations)
  AND c."Code" IN ('AL', 'VR')
ORDER BY fi."Id", c."Code";

-- in 2 proposals
SELECT fi."Id"  AS FlightIntegrationId,
       fi."SegmentFlightIdentifier",
       fi."SegmentFlightNumber",
       fi."SegmentBoardingPoint",
       fi."SegmentDeplaningPoint",
       f."Id"   AS FlightId,
       s."Id"   AS SeriesId,
       p."Id"   AS ProposalId,
       c."Code" AS CustomerCode,
       fi."SegmentDepartureDateTime"
FROM public."FlightIntegrations" fi
         INNER JOIN public."Flights" f ON f."FlightIntegrationId" = fi."Id"
         INNER JOIN public."OriginDestinations" od ON f."OriginDestinationId" = od."Id"
         INNER JOIN public."Series" s ON od."SeriesId" = s."Id"
         INNER JOIN public."Proposals" p ON s."ProposalId" = p."Id"
         INNER JOIN public."Companies" c ON p."CustomerId" = c."Id"
WHERE fi."IsDeleted" = false
  AND f."IsDeleted" = false
  AND od."IsDeleted" = false
  AND s."IsDeleted" = false
  AND p."IsDeleted" = false
  AND c."IsDeleted" = false
  and p."Status" = 5
  AND fi."Id" IN (SELECT f2."FlightIntegrationId"
                  FROM public."Flights" f2
                  WHERE f2."IsDeleted" = false
                  GROUP BY f2."FlightIntegrationId"
                  HAVING COUNT(*) >= 2)
ORDER BY fi."Id", f."Id";

-- not in 2 proposals
SELECT f."Id" AS FlightId, f."BusinessFareBasisId", fi."Id" AS FlightIntegrationId
FROM public."Flights" f
INNER JOIN public."FlightIntegrations" fi ON f."FlightIntegrationId" = fi."Id"
WHERE f."IsDeleted" = false
  AND fi."IsDeleted" = false
  AND f."FlightIntegrationId" IN (
      SELECT f2."FlightIntegrationId"
      FROM public."Flights" f2
      WHERE f2."IsDeleted" = false
      GROUP BY f2."FlightIntegrationId"
      HAVING COUNT(*) = 1
  );

--
UPDATE public."Flights"
SET "FirstSeats" = 1177 , "IsDeleted" = true
WHERE "Id" IN (
    SELECT f."Id"
    FROM public."Flights" f
    INNER JOIN public."FlightIntegrations" fi ON f."FlightIntegrationId" = fi."Id"
    WHERE f."IsDeleted" = false
      AND fi."IsDeleted" = false
      AND f."FlightIntegrationId" IN (
          SELECT f2."FlightIntegrationId"
          FROM public."Flights" f2
          WHERE f2."IsDeleted" = false
          GROUP BY f2."FlightIntegrationId"
          HAVING COUNT(*) = 1
      )
);

--
UPDATE public."Flights"
SET  "IsDeleted" = false
WHERE "FirstSeats" = 1177
;
--
UPDATE public."Flights"
SET  "IsDeleted" = true
WHERE "Id" not  in (3188,3557,3208,3558)
;
--
select  *
from "Flights"
where "Id"  in (3069)
-- where "Id"  in (2526,2153)
-- where "Id"  in (2153,3349)
-- where "Id"  in (3349)
-- where "Id"  in (3209,3190,2153,2154,2155)
;

select   "Id" from "Proposals"
-- "GZS3H3RAH"

;
--
select * from "BlockSpaces"
where "MemberBlockIdentifier"='GZS3H3RAH'