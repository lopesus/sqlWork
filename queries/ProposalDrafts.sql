--
select *
from "ProposalDrafts"

--( Requested = 0, Rejected = 1, InProgress = 2, Quoted = 3, PartiallyConfirmed = 4, Confirmed = 5, Draft = 6 )';
;

--Requests
SELECT r."Id",
       a1."IataCode" AS "OdFrom",
       a2."IataCode" AS "OdTo"
FROM public."Requests" r
         INNER JOIN public."Airports" a1 ON r."OdFromId" = a1."Id"
         INNER JOIN public."Airports" a2 ON r."OdToId" = a2."Id"
where "Status" in (0);

-- set status to Draft
update "Requests"
set "Status"=6
where "Id" = 1288;


-- InProgress
select *
from "Requests"
where "Status" = 2
;

--deleted
select *
from "Requests"
where "Status" = 1
;

-- reset status form  InProgress to Requested
update "Requests"
set "Status"=0
where "Status" = 2
;

-- reset status form  draft to Requested
update "Requests"
set "Status"=0
where "Status" = 6


;
--
-- "Companies"."Role" is 'EnmCompanyRole flags ( None = 0, Customer = 1, Broker = 2, Provider = 4, Airline = 8 )';
--
select * from "Companies"
where "Role"=8

--
select * from "Companies"
where "Code"='NO'

;
--
SELECT * FROM "Companies"
WHERE ("Role" & 8) = 8