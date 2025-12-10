--
select fi."SegmentFlightIdentifier", fi."Id",* from "Flights" f
         inner join public."FlightIntegrations" FI on FI."Id" = "f"."FlightIntegrationId"

where f."Id" in (267,268,265,270);

select * from "Flights";


--

select * from "FlightIntegrations"
where "IsDeleted"=true
;
select * from "FlightIntegrations"
where "SegmentFlightIdentifier"='SM2804MXPLXR30DEC24'
;

--
update "FlightIntegrations"
set "IsDeleted"=false


;

delete from
           "FlightIntegrations" where "IsDeleted"=true

--where "Id" in (267,268,265,270)
;