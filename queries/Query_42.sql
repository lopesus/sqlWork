-- find To for Variations
select distinct c."Code" as "Customer", s."Id" as "seriesId", t."Id"--t."Code"
from "Flights" fl
         inner join "FlightIntegrations" fi on fl."FlightIntegrationId" = fi."Id"
         inner join public."OriginDestinations" OD on fl."OriginDestinationId" = OD."Id"
         inner join public."Series" S on OD."SeriesId" = S."Id"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Taxes" T on S."Id" = T."SeriesId"

where s."Status" = 3
  and fi."SegmentDepartureDateTime" >= '2025-10-01';
--and c."Code" = 'VR';

select distinct c."Code"      as "Customer",
       s."Id"        as "seriesId",
       count(t."Id") as "TaxCount"
from "Flights" fl
         inner join "FlightIntegrations" fi on fl."FlightIntegrationId" = fi."Id"
         inner join public."OriginDestinations" OD on fl."OriginDestinationId" = OD."Id"
         inner join public."Series" S on OD."SeriesId" = S."Id"
         inner join public."Proposals" P on P."Id" = S."ProposalId"
         inner join public."Companies" C on C."Id" = P."CustomerId"
         inner join public."Taxes" T on S."Id" = T."SeriesId"
where s."Status" = 3
  and fi."SegmentDepartureDateTime" >= '2025-10-01'
group by c."Code",
         s."Id",
         t."Id";