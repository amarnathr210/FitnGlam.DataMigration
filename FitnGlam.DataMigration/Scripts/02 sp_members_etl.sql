use membership
go
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'sp_members_etl')  
DROP PROCEDURE [dbo].[sp_members_etl] 
GO

CREATE PROCEDURE [dbo].[sp_members_etl]        
AS         
BEGIN
Declare @pPassword nvarchar(max)='$2a$12$9u20f0Aa3MjDdgC6Ukd91OaJx6u7Hp022Z691ucnz88uuXwfOK0bq',
		@pSalt nvarchar(max)='$2a$12$9u20f0Aa3MjDdgC6Ukd91O'

 insert into tblCustomer
 (
 FirstName,
 LastName,
 Username,
 Email,
 Password,
 Salt,
 DateOfBirth,
 GenderId,
 NationalityId,
 isActive,
 CountryId,
 AccessId,
 PhoneMobile,
 RegistrationDate,
 OldCustomerNo,
 CreatedOn,
 CreatedBy,
 isDeleted,
 isBlocked,
 VendorCode,
 isAccountBlocked,
 IsTCAccepted,
 Source,
 SendPushNotification,
 SendEmail,
 SendSMS,
 UserReferenceId,
 FacilityId)
 select em.FirstName,
		em.LastName,
		isnull(em.Email,''),
		isnull(em.Email,'') ,
		@pPassword as Password,
		@pSalt as Salt,
		isnull(em.DateOfBirth,GETDATE()),
		g.Id as GenderId,
		nm.NationalityID as NationalityId,
		1 as isActive,
		1 as CountryId,
		em.AccessCode1,
		convert(bigint,replace(em.MobileNo,'+','')),
		GETDATE() as RegistrationDate,
		em.MembershipNo,
		GETDATE() as CreatedOn,
		1 as CreatedBy,
		0 as isDeleted,
		0 as isBlocked,
		CAST(CAST(0 AS BINARY) AS UNIQUEIDENTIFIER) as VendorCode,
		0 as isAccountBlocked,
		0 as IsTCAccepted,
		'Kiosk' as Source,
		1 SendPushNotification,
		1 SendEmail,
		1 SendSMS,
		LOWER(REPLACE(CAST(NEWID() AS NVARCHAR(50)),'-','')) as UserReferenceId,
		fm.FacilityId
 from tblEtlMembers em 
	inner join tblGender g on case when em.Gender='F' then 'Female' else em.Gender end=g.Gender
	LEFT join TBL_ETL_Nationality_MAPPING NM on nm.ETLNationalityName=em.NationalityName
	inner join tbl_Etl_Facilities_Mapping fm on fm.HomeClubName=em.HomeClubName
	inner join tblFacilities f on f.FacilityId=fm.FacilityId
	where not exists(select * from tblCustomer c where c.OldCustomerNo=em.MembershipNo)
	--and em.Email is not null 
END