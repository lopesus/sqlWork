--
select count(*) over () as TotalCount, FI."SegmentFlightIdentifier", FI."SegmentDepartureDateTime", c."Code", "Taxes".*
from "Taxes"
         inner join public."Series" S on S."Id" = "Taxes"."SeriesId"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Requests" R on R."Id" = P."RequestId"
         inner join public."OriginDestinations" OD on S."Id" = OD."SeriesId"
         inner join public."Flights" F on OD."Id" = F."OriginDestinationId"
         inner join public."FlightIntegrations" FI on F."FlightIntegrationId" = FI."Id"
         inner join public."Companies" C on C."Id" = P."CustomerId"

where FI."SegmentDepartureDateTime" between '2025-12-01' and '2026-01-01'

-- where R."DateFrom" != "Taxes"."FlightDateFrom"

--
select *
from "Taxes"
where "SeriesId" = 29
  and "Code" = 'EX'

-- from flight
select count(*) over () as TotalCount, FI."SegmentFlightIdentifier", FI."SegmentDepartureDateTime", c."Code", T."Id", t."Code"
from "Flights" F
         inner join public."OriginDestinations" OD on OD."Id" = F."OriginDestinationId"
         inner JOIN public."Series" S on OD."SeriesId" = S."Id"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Requests" R on R."Id" = P."RequestId"
         inner join public."FlightIntegrations" FI on FI."Id" = F."FlightIntegrationId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Taxes" T on S."Id" = T."SeriesId"
where FI."SegmentDepartureDateTime" between '2025-12-01' and '2026-01-01'
  and s."Status" = 3;

-- from flight3
select distinct s."Id", c."Code"--, T."Id", t."Code"
from "Flights" F
         inner join public."OriginDestinations" OD on OD."Id" = F."OriginDestinationId"
         inner JOIN public."Series" S on OD."SeriesId" = S."Id"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Requests" R on R."Id" = P."RequestId"
         inner join public."FlightIntegrations" FI on FI."Id" = F."FlightIntegrationId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
--inner join public."Taxes" T on S."Id" = T."SeriesId"
where FI."SegmentDepartureDateTime" between '2025-12-01' and '2026-12-01'
  and s."Status" = 3;

-- from flight2
select distinct S."Id" "seriesID", c."Code", R."DateFrom", r."DateTo", ABP."IataCode" as "BoardingPointCode", ADP."IataCode" as "DeplaningPointCode"--, T."Id"--,t."Code",t."Ptc",t."Nation"
from "Flights" F
         inner join public."OriginDestinations" OD on OD."Id" = F."OriginDestinationId"
         inner JOIN public."Series" S on OD."SeriesId" = S."Id"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Requests" R on R."Id" = P."RequestId"
         inner join public."FlightIntegrations" FI on FI."Id" = F."FlightIntegrationId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Taxes" T on S."Id" = T."SeriesId"
         inner join public."Airports" ABP on ABP."Id" = OD."BoardingPointId"
         inner join public."Airports" ADP on ADP."Id" = OD."DeplaningPointId"
where s."Status" = 3
  and FI."SegmentDepartureDateTime" between '2025-12-01' and '2026-12-01'
--and ABP."IataCode" = 'VRN'
;

--check
select s."Id", *
from "Series" s
         inner join public."Proposals" P on P."Id" = "s"."ProposalId"
         inner join public."OriginDestinations" OD on "s"."Id" = OD."SeriesId"

where p."OdFromId" != OD."BoardingPointId"

----check2
select s."Id", OD."Id", OD."BoardingPointId", od."DeplaningPointId", p."OdFromId", p."OdToId"
from "Series" s
         inner join public."Proposals" P on P."Id" = "s"."ProposalId"
         inner join public."OriginDestinations" OD on "s"."Id" = OD."SeriesId"


-- where p."OdFromId" !=OD."BoardingPointId"

--
select distinct t."Id",
                t."AirportId",
                t."Code",
                t."Direction", --inbound=0   outbound=1
                t."TaxPoint",  -- D=0, A=1
                t."AirportId",
                od."DeplaningPointId" as "odDeplaningPointId",
                od."BoardingPointId"  as "odBoardingPointId"
from "Taxes" t
         inner join public."Series" S on S."Id" = t."SeriesId"
         inner join public."OriginDestinations" OD on S."Id" = OD."SeriesId"
--where t."Direction" = 0 ;-- "SeriesId"=28

--
select "Direction", "TaxPoint"
from "Taxes"
where "SeriesId" = 43;

--
select "Id",
       "SeriesId",
       "Direction",
       "FlightDateFrom",
       "Code",
       CASE "Ptc"
           WHEN 0 THEN 'ADT'
           WHEN 1 THEN 'CHD'
           WHEN 2 THEN 'INF'
           ELSE 'Unknown'
           END AS "PaxType",
       "TaxPoint",
       "Nation"

from "Taxes"
where "SeriesId" = 29
;

--


--
select *
from "Taxes"
where "TaxPoint" = 1
;

--
select count(*) over () as TotalCount, FI."SegmentFlightIdentifier", FI."SegmentDepartureDateTime", c."Code", "Taxes".*
from "Taxes"
         inner join public."Series" S on S."Id" = "Taxes"."SeriesId"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Requests" R on R."Id" = P."RequestId"
         inner join public."OriginDestinations" OD on S."Id" = OD."SeriesId"
         inner join public."Flights" F on OD."Id" = F."OriginDestinationId"
         inner join public."FlightIntegrations" FI on F."FlightIntegrationId" = FI."Id"
         inner join public."Companies" C on C."Id" = P."CustomerId"
--where FI."SegmentBoardingPoint" = 'MXP' and "SegmentDeplaningPoint" = 'JFK'
--and s."Status" = 3;

--

--
select distinct c."Code", c."Name", od."BoardingPointId", od."DeplaningPointId", s."Id"
from "Taxes"
         inner join public."Series" S on S."Id" = "Taxes"."SeriesId"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Requests" R on R."Id" = P."RequestId"
         inner join public."OriginDestinations" OD on S."Id" = OD."SeriesId"
         inner join public."Flights" F on OD."Id" = F."OriginDestinationId"
         inner join public."FlightIntegrations" FI on F."FlightIntegrationId" = FI."Id"
         inner join public."Companies" C on C."Id" = P."CustomerId"
where s."Status" = 3
--where FI."SegmentBoardingPoint" = 'MXP' and "SegmentDeplaningPoint" = 'JFK'

--

select distinct S."Id" "seriesID", c."Code", c."Name", R."DateFrom", r."DateTo", ABP."IataCode" as "BoardingPointCode", ADP."IataCode" as "DeplaningPointCode"--, T."Id"--,t."Code",t."Ptc",t."Nation"
from "Flights" F
         inner join public."OriginDestinations" OD on OD."Id" = F."OriginDestinationId"
         inner JOIN public."Series" S on OD."SeriesId" = S."Id"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Requests" R on R."Id" = P."RequestId"
         inner join public."FlightIntegrations" FI on FI."Id" = F."FlightIntegrationId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Taxes" T on S."Id" = T."SeriesId"
         inner join public."Airports" ABP on ABP."Id" = OD."BoardingPointId"
         inner join public."Airports" ADP on ADP."Id" = OD."DeplaningPointId"
where s."Status" = 3
;

--

delete
from "TaxVariationTaxes";

--
select "Users"."UserName", c."Id", c."Code"
from "Users"
         inner join public."Companies" C on C."Id" = "Users"."CompanyId"
;

--
select *
from "Series"
where "ProposalId" = 74
;
--
update "Series"
set "Status"=3
where "ProposalId" = 74
;
--
select "Id",
       "SeriesId",
       "Code",
       "Value",
       "AirportId",
       CASE "Ptc"
           WHEN 0 THEN 'ADT'
           WHEN 1 THEN 'CHD'
           WHEN 2 THEN 'INF'
           ELSE 'Unknown'
           END AS "PaxType",
       "TaxPoint",
--        "CurrencyId",
       "Direction",
       "FlightDateFrom",
       "FlightDateTo",
       "Included",
       "Nation",
       "Name",
       "SaleDateFrom",
--        "TaxCarrier",

       "SaleDateTo"
from "Taxes"
where "SeriesId" = 112
;
-- and "Nation"='US'

;--
delete
from "TaxVariationTaxes"

SELECT *
FROM "__EFMigrationsHistory";

SELECT conname
FROM pg_constraint
WHERE conrelid = '"TaxVariationTaxes"'::regclass
  AND contype = 'f';
