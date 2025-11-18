--reset
BEGIN TRANSACTION;
delete
from "MasterContracts"
where "Notes" = 'Test';
delete
from "Proposals"
where "Notes" = 'Test';
delete
from "TaxVariation";
COMMIT;

--
select C."Code", *
from "Taxes"
         inner join public."Series" S on "Taxes"."SeriesId" = S."Id"
         inner join public."Proposals" P on S."ProposalId" = P."Id"
         inner join public."Companies" C on C."Id" = P."CustomerId";


-- from FI
select fi."SegmentFlightIdentifier", fi."SegmentDepartureDateTime", s."Id" as "seriesId" --t."Code"
from "FlightIntegrations" fi
         inner join "Flights" F on F."FlightIntegrationId" = fi."Id"
         inner join public."OriginDestinations" OD on F."OriginDestinationId" = OD."Id"
         inner join public."Series" S on OD."SeriesId" = S."Id"
--          inner join public."Taxes" T on S."Id" = T."SeriesId"

where s."Status" = 3
  and fi."SegmentDepartureDateTime" >= '2025-10-01';

-- from flight
select fi."SegmentFlightIdentifier", fi."SegmentDepartureDateTime", c."Code" as "Customer", s."Id" as "seriesId" --t."Code"
from "Flights" fl
         inner join "FlightIntegrations" fi on fl."FlightIntegrationId" = fi."Id"
         inner join public."OriginDestinations" OD on fl."OriginDestinationId" = OD."Id"
         inner join public."Series" S on OD."SeriesId" = S."Id"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Taxes" T on S."Id" = T."SeriesId"

where s."Status" = 3
  and fi."SegmentDepartureDateTime" >= '2025-10-01'
  and c."Code" = 'VR';

--seriesWithTaxes
select *
from "Series" s
         inner join public."Taxes" T on s."Id" = T."SeriesId"
where s."Status" = 3;


--taxes
select "SeriesId",
       "Code",
       "AirportId",
       a."IataCode",
       "Ptc",
       CASE "Ptc"
           WHEN 0 THEN 'ADT'
           WHEN 1 THEN 'CHD'
           WHEN 2 THEN 'INF'
           ELSE 'Unknown'
           END AS "PaxType",
       "FlightDateFrom",
       "Nation"
from "Taxes"
inner join public."Airports" A on A."Id" = "Taxes"."AirportId"
where "SeriesId" = 19;

-- from Series
select *
from "Taxes" t
         inner join public."Series" S on "t"."SeriesId" = S."Id"
         inner join public."OriginDestinations" OD on S."Id" = OD."SeriesId"
--inner join public."Flights" F on OD."Id" = F."OriginDestinationId"


where s."Status" = 3
  and t."Included" = false
  and od."DateFrom" >= '2025-11-01'