BEGIN TRANSACTION;
delete
from "FlightIntegrations";
delete
from "Proposals";
delete
from "SeatTransfert";
COMMIT;


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
order by fi."SegmentDepartureDateTime";
;
--
-- proposal with flights2
select distinct concat(d."Name", '-', d."Id") as "Destination",
                P."Id"                        as "ProposalId",
                c."Code",
                fi."SegmentBoardingPoint"     as "BoardingPoint",
                fi."SegmentDeplaningPoint"    as "DeplaningPoint"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Destinations" D on P."DestinationId" = D."Id"

where P."Status" != 5
;
-- order by fi."SegmentDepartureDateTime";
--
update "Proposals"
set "Status" = 5
where "Id" in (115, 116);


-- flightForSegment
select fi."SegmentFlightIdentifier", P."Id" as "ProposalId", s."Id" as SeriesId, c."Code", "Flights".*
from "Flights"
         inner join public."FlightIntegrations" FI on "Flights"."FlightIntegrationId" = FI."Id"
         join public."OriginDestinations" OD on OD."Id" = "Flights"."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"
where FI."SegmentFlightIdentifier" = 'NO1351TFSVRN22DEC25';
--where FI."SegmentFlightIdentifier" = 'NO1350VRNTFS22DEC25';

--BlockSpaces
select *
from "BlockSpaces"
where "ProposalId" in (11, 13)
  and "FlightId" in (62, 150);

-- flight
select *
from "Flights"
where "Id" in (62);
-- where "Id" in (63, 151);
--NO1350TFSVRN02FEB26;10;NO;16;47;VRN;2026-02-02 00:00:00.000000;2026-02-02 05:00:00.000000
--

select *
from "BlockSpaces"
where "FlightId" = 47;

--
select fi."SegmentFlightIdentifier",
       P."Id"   as "Proposal_Id",
       c."Code" as To_Code,
       s."Id"   as Series_Id,
       fl."Id"  as FlightId,
       fi."SegmentDeplaningPoint",
       fi."SegmentDepartureDateTime",
       fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"

where fi."SegmentFlightIdentifier" = 'ZZ0123MXPJFK20OCT25'
  and c."Code" = 'AL'


order by fi."SegmentDepartureDateTime";


select fi."SegmentFlightIdentifier",
       P."Id"   as "Proposal_Id",
       c."Code" as To_Code,
       s."Id"   as Series_Id,
       fl."Id"  as FlightId,
       fi."SegmentDeplaningPoint",
       fi."SegmentDepartureDateTime",
       fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"

where c."Code" = 'AL'


order by fi."SegmentDepartureDateTime";

--
select *
from "Prices"
where "FlightId" = 57;

--
select fi."SegmentFlightIdentifier", fi."SegmentBoardingPoint", fi."SegmentDeplaningPoint", fi."SegmentDepartureDateTime", fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"

order by fi."SegmentDepartureDateTime";

--
select fi."SegmentFlightIdentifier", fi."SegmentBoardingPoint", fi."SegmentDeplaningPoint", fi."SegmentDepartureDateTime", fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi

order by fi."SegmentDepartureDateTime";



update "BlockSpaces"
set "MemberBlockIdentifier" = 'xxx'
where "ProposalId" = xxx
  and "FlightId" = xxx
  and "Compartment" = 'xxx';

--
select fl."Id",
       "SegmentFlightIdentifier",
       "SegmentFlightNumber",
       "SegmentDepartureDateTime",
       "SegmentArrivalDateTime",
       "SegmentBoardingPoint",
       "SegmentDeplaningPoint",
       a."IataCode" as "BoardingPoint",
       b."IataCode" as "DeplaningPoint",
       "Routing",
       "DestinationTag"
from "FlightIntegrations" fl
         inner join "Flights" on "Flights"."FlightIntegrationId" = "fl"."Id"
         inner join "OriginDestinations" on "OriginDestinations"."Id" = "Flights"."OriginDestinationId"
         inner join public."Airports" A on A."Id" = "OriginDestinations"."BoardingPointId"
         inner join public."Airports" B on B."Id" = "OriginDestinations"."DeplaningPointId"

-- where "SegmentBoardingPoint"!=a."IataCode"
;
-- seek direction
SELECT
    --fi."Id" AS "FlightIntegrationId",
    --fi."SegmentFlightIdentifier",
    --fi."SegmentFlightNumber",
    fi."SegmentBoardingPoint"               AS "SegmentFrom",
    fi."SegmentDeplaningPoint"              AS "SegmentTo",
    od."Id"                                 AS "OriginDestinationId",
    concat(odBp."IataCode", '-', odBp."Id") AS "OdFrom",
    concat(odDp."IataCode", '-', odDp."Id") AS "OdTo",
    p."Id"                                  AS "ProposalId",
    pBp."IataCode"                          AS "ProposalFrom",
    pDp."IataCode"                          AS "ProposalTo"
FROM "FlightIntegrations" fi
         INNER JOIN "Flights" f ON f."FlightIntegrationId" = fi."Id"
         INNER JOIN "OriginDestinations" od ON f."OriginDestinationId" = od."Id"
         INNER JOIN "Airports" odBp ON od."BoardingPointId" = odBp."Id"
         INNER JOIN "Airports" odDp ON od."DeplaningPointId" = odDp."Id"
         INNER JOIN "Series" s ON od."SeriesId" = s."Id"
         INNER JOIN "Proposals" p ON s."ProposalId" = p."Id"
         INNER JOIN "Airports" pBp ON p."OdFromId" = pBp."Id"
         INNER JOIN "Airports" pDp ON p."OdToId" = pDp."Id"

order by fi."SegmentDepartureDateTime";

-- To with proposals
select p."Id", C."Code"
from "Proposals" p
         inner join public."Companies" C on C."Id" = "p"."CustomerId"
-- where "Status" = 5;

-- od
SELECT distinct
    --fi."Id" AS "FlightIntegrationId",
    --fi."SegmentFlightIdentifier",
    --fi."SegmentFlightNumber",
    fi."SegmentBoardingPoint"               AS "SegmentFrom",
    fi."SegmentDeplaningPoint"              AS "SegmentTo",
    fi."Routing"                            as fiRouting,
    od."Id"                                 AS "ODId",
    concat(odBp."IataCode", '-', odBp."Id") AS "OdFrom",
    concat(odDp."IataCode", '-', odDp."Id") AS "OdTo",
    p."Id"                                  AS "ProposalId",
    pBp."IataCode"                          AS "ProposalFrom",
    pDp."IataCode"                          AS "ProposalTo"
FROM "FlightIntegrations" fi
         INNER JOIN "Flights" f ON f."FlightIntegrationId" = fi."Id"
         INNER JOIN "OriginDestinations" od ON f."OriginDestinationId" = od."Id"
         INNER JOIN "Airports" odBp ON od."BoardingPointId" = odBp."Id"
         INNER JOIN "Airports" odDp ON od."DeplaningPointId" = odDp."Id"
         INNER JOIN "Series" s ON od."SeriesId" = s."Id"
         INNER JOIN "Proposals" p ON s."ProposalId" = p."Id"
         INNER JOIN "Airports" pBp ON p."OdFromId" = pBp."Id"
         INNER JOIN "Airports" pDp ON p."OdToId" = pDp."Id"

where od."Id" in (208, 210, 217, 216);
-- order by fi."SegmentDepartureDateTime";

-- od2
SELECT distinct
    --fi."Id" AS "FlightIntegrationId",
    --fi."SegmentFlightIdentifier",
    --fi."SegmentFlightNumber",
    fi."SegmentBoardingPoint"               AS "SegmentFrom",
    fi."SegmentDeplaningPoint"              AS "SegmentTo",
    fi."Routing"                            as fiRouting,
    f."Id"                                  as "FlightId",
    od."Id"                                 AS "ODId",
    concat(odBp."IataCode", '-', odBp."Id") AS "OdFrom",
    concat(odDp."IataCode", '-', odDp."Id") AS "OdTo",
    p."Id"                                  AS "ProposalId",
    pBp."IataCode"                          AS "ProposalFrom",
    pDp."IataCode"                          AS "ProposalTo"
FROM "FlightIntegrations" fi
         INNER JOIN "Flights" f ON f."FlightIntegrationId" = fi."Id"
         INNER JOIN "OriginDestinations" od ON f."OriginDestinationId" = od."Id"
         INNER JOIN "Airports" odBp ON od."BoardingPointId" = odBp."Id"
         INNER JOIN "Airports" odDp ON od."DeplaningPointId" = odDp."Id"
         INNER JOIN "Series" s ON od."SeriesId" = s."Id"
         INNER JOIN "Proposals" p ON s."ProposalId" = p."Id"
         INNER JOIN "Airports" pBp ON p."OdFromId" = pBp."Id"
         INNER JOIN "Airports" pDp ON p."OdToId" = pDp."Id"


where P."Status" = 5
  and odBp."IataCode" = 'MXP'
--and odDp."IataCode" ='ZNZ'
;
--
select *
from "OriginDestinations"
where "Id" = 217;

--
select *
from "FlightIntegrations"
where "Routing" = 'routing'
;

select *
from "FlightIntegrations"
where "Id" = 22806
;

-- SegmentFlightIdentifier proposal with flights
select distinct fi."SegmentFlightIdentifier"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Destinations" D on P."DestinationId" = D."Id"

-- where fi."SegmentFlightIdentifier" = '1234567890'  and c."Code" = 'AL'
where c."Code" = 'AL'
  and P."Status" = 5;

-- SegmentFlightIdentifier proposal with flights
select distinct fi."SegmentFlightIdentifier", c."Code"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Destinations" D on P."DestinationId" = D."Id"

-- where fi."SegmentFlightIdentifier" = 'NO1350VRNTFS29DEC25'

;
--
select *
from "Flights"

where "Id" in (64, 152)
;
-- search seat data
select distinct
    --fi."SegmentFlightIdentifier",
    concat(d."Name", '-', d."Id") as "Destination",
    P."Id"                        as "ProposalId",
    c."Code"
--        s."Id"                        as SeriesId,
   -- fl."Id"                       as FlightId
--        OD."Id"                       as OriginDestinationId,
--                 fi."SegmentBoardingPoint"     as "BoardingPoint",
--                 fi."SegmentDeplaningPoint"    as "DeplaningPoint",
--                 fi."SegmentDepartureDateTime",
--                 fi."SegmentArrivalDateTime"
from "Flights" fl
         inner join public."FlightIntegrations" FI on FI."Id" = fl."FlightIntegrationId"
         inner join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         inner join public."Series" S on S."Id" = OD."SeriesId"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Destinations" D on D."Id" = P."DestinationId"
where P."Status" = 5
  --and c."Code" = 'AL'
  and FI."SegmentDepartureDateTime" >= '2026-01-01'
  and FI."SegmentDepartureDateTime" <= '2026-12-23'
;