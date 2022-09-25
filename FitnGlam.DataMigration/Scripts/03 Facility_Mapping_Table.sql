use membership
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id =   
   OBJECT_ID(N'[dbo].[TBL_ETL_FACILITIES_MAPPING]') AND type in (N'U'))  
BEGIN 

	CREATE TABLE [dbo].[TBL_ETL_FACILITIES_MAPPING](ID INT PRIMARY KEY IDENTITY(1,1),HOMECLUBNAME VARCHAR(200),FACILITYID INT)
END
GO
IF OBJECT_ID('tempdb..#tempFacilities') IS NOT NULL 
DROP TABLE #tempFacilities

select  distinct HomeClubName into #tempFacilities from tblEtlMembers
insert into tbl_Etl_Facilities_Mapping(HomeClubName,FacilityId)
select HomeClubName,
case when HomeClubName='FitnGlam Ladies Gym LLC – AL Quoz Branch' then (select FacilityId from tblFacilities where Name='FitnGlam - Al Quoz')
	 when HomeClubName='Fit n Glam Ladies Gym LLC - Sport Society' then (select FacilityId from tblFacilities where Name='FitnGlam - Sports Society') 
	 end
from #tempFacilities t
where not exists(select 1 from tbl_Etl_Facilities_Mapping f where t.HomeClubName=f.HomeClubName)