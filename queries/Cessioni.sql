BEGIN TRANSACTION;
delete
from "FlightIntegrations";
delete
from "Proposals";
delete
from "SeatTransfert";
COMMIT;


-- get
select fi."SegmentFlightIdentifier",
       P."Id"  as "ProposalId",
       c."Code",
       s."Id"  as SeriesId,
       fl."Id" as FlightId,
       fi."SegmentDeplaningPoint",
       fi."SegmentDepartureDateTime",
       fi."SegmentArrivalDateTime"
from "FlightIntegrations" as fi
         join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"
         join public."OriginDestinations" OD on OD."Id" = fl."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"

-- where fi."SegmentFlightIdentifier" = '1234567890'  and c."Code" = 'AL'
-- where  c."Code" = 'AL'
where P."Status" = 5


order by fi."SegmentDepartureDateTime";

-- flightForSegment
select fi."SegmentFlightIdentifier",  P."Id"  as "ProposalId", s."Id"  as SeriesId,  c."Code","Flights".*
from "Flights"
         inner join public."FlightIntegrations" FI on "Flights"."FlightIntegrationId" = FI."Id"
         join public."OriginDestinations" OD on OD."Id" = "Flights"."OriginDestinationId"
         join public."Series" S on OD."SeriesId" = S."Id"
         join public."Proposals" P on P."Id" = S."ProposalId"
         join public."Companies" C on C."Id" = P."CustomerId"
where FI."SegmentFlightIdentifier" = 'NO1350VRNTFS22DEC25';

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