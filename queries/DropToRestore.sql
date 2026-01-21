-- Drop all tables in public schema
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO neos;
GRANT ALL ON SCHEMA public TO public;


--

select  "Data" from "ProposalDrafts"
where  "RequestId"==1247