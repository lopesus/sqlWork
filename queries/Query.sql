use  RMS_Sviluppo
go

begin
    declare  @p1 uniqueidentifier='E984C343-95C3-4A42-B736-B4E10A913AB3';

exec dbo.sp_Adopt_Iogp_Standard_Row @p1,@p1,'0001DF74-2F35-4D49-B3AB-60144CA8A360','userid'

end


--
select * from tbl_CS
select * from tbl_RowType


--

   SELECT COLUMN_NAME
   FROM tempdb.INFORMATION_SCHEMA.COLUMNS
   WHERE TABLE_NAME LIKE '#temp_iogp_2_rows%';