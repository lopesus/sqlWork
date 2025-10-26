
-- get
select fi."SegmentFlightIdentifier", P."Id" as  "ProposalId", c."Code", s."Id" as SeriesId, fl."Id" as  FlightId, fi."SegmentDeplaningPoint", fi."SegmentDepartureDateTime", fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"

-- where fi."SegmentFlightIdentifier" = '1234567890'  and c."Code" = 'AL'
-- where  c."Code" = 'AL'


order by fi."SegmentDepartureDateTime";
--
select fi."SegmentFlightIdentifier", P."Id" as  "ProposalId", c."Code", s."Id" as SeriesId, fl."Id" as  FlightId, fi."SegmentDeplaningPoint", fi."SegmentDepartureDateTime", fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"

 where fi."SegmentFlightIdentifier" = 'NO1350VRNTFS22DEC25'
-- where  c."Code" = 'AL'


order by fi."SegmentDepartureDateTime";