
select *
from "Fares"
join "FareApplicabilities" FA on "Fares"."Id" = FA."FareId"
where "FareBasis" = 'AALPITOURDK' --and "Fares"."Id"=16

-- fares
select *
from "Fares"