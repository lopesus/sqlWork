
select fi."SegmentFlightIdentifier" , fi."SegmentBoardingPoint",fi."SegmentDeplaningPoint"  ,fi."SegmentDepartureDateTime" , fi."SegmentArrivalDateTime" from "FlightIntegrations" as fi
join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"

order by fi."SegmentDepartureDateTime";


--

select fi.*, fl.* from "FlightIntegrations" as fi
join public."Flights" fl on fi."Id" = fl."FlightIntegrationId"

order by fi."SegmentDepartureDateTime";

--
