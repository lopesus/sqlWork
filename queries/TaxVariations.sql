
--
select C."Code", *
from "Taxes"
inner join public."Series" S on "Taxes"."SeriesId" = S."Id"
inner join public."Proposals" P on S."ProposalId" = P."Id"
inner join public."Companies" C on C."Id" = P."CustomerId";