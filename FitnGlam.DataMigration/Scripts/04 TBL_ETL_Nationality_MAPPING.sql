use membership
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id =   
   OBJECT_ID(N'[dbo].[TBL_ETL_Nationality_MAPPING]') AND type in (N'U'))  
BEGIN 

	CREATE TABLE [dbo].[TBL_ETL_Nationality_MAPPING](ID INT PRIMARY KEY IDENTITY(1,1),ETLNationalityName varchar(200),Country VARCHAR(200),Nationality varchar(200),NationalityID INT)
END
GO
IF OBJECT_ID('tempdb..#tempNationality') IS NOT NULL 
DROP TABLE #tempNationality


select *,convert(varchar(200),'') as ETLNationalityName into #tempNationality from (
select '1' as id,'UNITED KINGDOM' as Country,'GB' as 'Country Code','British' as Nationality,'a Briton' as Person
union all select '2' as id,'ARGENTINA' as Country,'AR' as 'Country Code','Argentinian' as Nationality,'an Argentinian' as Person
union all select '3' as id,'AUSTRALIA' as Country,'AU' as 'Country Code','Australian' as Nationality,'an Australian' as Person
union all select '4' as id,'BAHAMAS' as Country,'BS' as 'Country Code','Bahamian' as Nationality,'a Bahamian' as Person
union all select '5' as id,'BELGIUM' as Country,'BE' as 'Country Code','Belgian' as Nationality,'a Belgian' as Person
union all select '6' as id,'BRAZIL' as Country,'BR' as 'Country Code','Brazilian' as Nationality,'a Brazilian' as Person
union all select '7' as id,'CANADA' as Country,'CA' as 'Country Code','Canadian' as Nationality,'a Canadian' as Person
union all select '8' as id,'CHINA' as Country,'CN' as 'Country Code','Chinese' as Nationality,'a Chinese' as Person
union all select '9' as id,'COLOMBIA' as Country,'CO' as 'Country Code','Colombian' as Nationality,'a Colombian' as Person
union all select '10' as id,'CUBA' as Country,'CU' as 'Country Code','Cuban' as Nationality,'a Cuban' as Person
union all select '11' as id,'DOMINICAN REPUBLIC' as Country,'DO' as 'Country Code','Dominican' as Nationality,'a Dominican' as Person
union all select '12' as id,'ECUADOR' as Country,'EC' as 'Country Code','Ecuadorean' as Nationality,'an Ecuadorean' as Person
union all select '13' as id,'EL SALVADOR' as Country,'SV' as 'Country Code','Salvadorean' as Nationality,'a Salvadorean' as Person
union all select '14' as id,'FRANCE' as Country,'FR' as 'Country Code','French' as Nationality,'a Frenchman' as Person
union all select '15' as id,'GERMANY' as Country,'DE' as 'Country Code','German' as Nationality,'a German' as Person
union all select '16' as id,'GUATEMALA' as Country,'GT' as 'Country Code','Guatemalan' as Nationality,'a Guatemalan' as Person
union all select '17' as id,'HAITI' as Country,'HT' as 'Country Code','Haitian' as Nationality,'a Haitian' as Person
union all select '18' as id,'HONDURAS' as Country,'HN' as 'Country Code','Honduran' as Nationality,'a Honduran' as Person
union all select '19' as id,'INDIA' as Country,'IN' as 'Country Code','Indian' as Nationality,'an Indian' as Person
union all select '20' as id,'IRELAND' as Country,'IE' as 'Country Code','Ireland' as Nationality,'an Irishman' as Person
union all select '21' as id,'ISRAEL' as Country,'IL' as 'Country Code','Israeli' as Nationality,'an Israeli' as Person
union all select '22' as id,'ITALY' as Country,'IT' as 'Country Code','Italian' as Nationality,'an Italian' as Person
union all select '23' as id,'JAPAN' as Country,'JP' as 'Country Code','Japanese' as Nationality,'a Japanese' as Person
union all select '24' as id,'KOREA' as Country,'KR' as 'Country Code','South Korean' as Nationality,'a South Korean' as Person
union all select '25' as id,'MEXICO' as Country,'MX' as 'Country Code','Mexican' as Nationality,'a Mexican' as Person
union all select '26' as id,'NETHERLANDS' as Country,'NL' as 'Country Code','Dutch' as Nationality,'a Dutchman,' as Person
union all select '27' as id,'PHILIPPINES' as Country,'PH' as 'Country Code','Philippine' as Nationality,'a Filipino' as Person
union all select '28' as id,'SPAIN' as Country,'ES' as 'Country Code','Spanish' as Nationality,'a Spaniard' as Person
union all select '29' as id,'SWEDEN' as Country,'SE' as 'Country Code','Swedish' as Nationality,'a Swede' as Person
union all select '30' as id,'SWITZERLAND' as Country,'CH' as 'Country Code','Swiss' as Nationality,'a Swiss' as Person
union all select '31' as id,'TAIWAN' as Country,'TW' as 'Country Code','Taiwanese' as Nationality,'a Taiwanese' as Person
union all select '32' as id,'VENEZUELA' as Country,'VE' as 'Country Code','Venezuelan' as Nationality,'a Venezuelan' as Person
union all select '33' as id,'VIET NAM' as Country,'VN' as 'Country Code','Vietnamese' as Nationality,'a Vietnamese' as Person
union all select '34' as id,'AFGHANISTAN' as Country,'AF' as 'Country Code','Afghan' as Nationality,'an Afghan' as Person
union all select '35' as id,'ALBANIA' as Country,'AL' as 'Country Code','Albanian' as Nationality,'an Albanian' as Person
union all select '36' as id,'ALGERIA' as Country,'DZ' as 'Country Code','Algerian' as Nationality,'an Algerian' as Person
union all select '37' as id,'AMERICAN SAMOA' as Country,'AS' as 'Country Code','Samoan' as Nationality,'a Samoan' as Person
union all select '38' as id,'ANDORRA' as Country,'AD' as 'Country Code','Andorran' as Nationality,'an Andorran' as Person
union all select '39' as id,'ANGOLA' as Country,'AO' as 'Country Code','Angolan' as Nationality,'an Angolan' as Person
union all select '40' as id,'ARMENIA' as Country,'AM' as 'Country Code','Armenian' as Nationality,'an Armenian' as Person
union all select '41' as id,'AUSTRIA' as Country,'AT' as 'Country Code','Austrian' as Nationality,'an Austrian' as Person
union all select '42' as id,'AZERBAIJAN' as Country,'AZ' as 'Country Code','Azerbaijani' as Nationality,'an Azerbaijani' as Person
union all select '43' as id,'BAHRAIN' as Country,'BH' as 'Country Code','Bahraini' as Nationality,'a Bahraini' as Person
union all select '44' as id,'BANGLADESH' as Country,'BD' as 'Country Code','Bangladeshi' as Nationality,'a Bangladeshi' as Person
union all select '45' as id,'BARBADOS' as Country,'BB' as 'Country Code','Barbadian' as Nationality,'a Barbadian' as Person
union all select '46' as id,'BELARUS' as Country,'BY' as 'Country Code','Belarusian' as Nationality,'a Belarusian ' as Person
union all select '47' as id,'BELIZE' as Country,'BZ' as 'Country Code','Belizean' as Nationality,'a Belizean' as Person
union all select '48' as id,'BENIN' as Country,'BJ' as 'Country Code','Beninese' as Nationality,'a Beninese' as Person
union all select '49' as id,'BERMUDA' as Country,'BM' as 'Country Code','Bermudian' as Nationality,'a Bermudian' as Person
union all select '50' as id,'BHUTAN' as Country,'BT' as 'Country Code','Bhutanese' as Nationality,'a Bhutanese' as Person
union all select '51' as id,'BOLIVIA' as Country,'BO' as 'Country Code','Bolivian' as Nationality,'a Bolivian' as Person
union all select '52' as id,'BOSNIA AND HERZEGOVINA' as Country,'BA' as 'Country Code','Bosnian' as Nationality,'a Bosnian' as Person
union all select '53' as id,'BOTSWANA' as Country,'BW' as 'Country Code','Botswanan' as Nationality,'a Tswana' as Person
union all select '54' as id,'BULGARIA' as Country,'BG' as 'Country Code','Bulgarian' as Nationality,'a Bulgarian' as Person
union all select '55' as id,'BURKINA FASO' as Country,'BF' as 'Country Code','Burkinese' as Nationality,'a Burkinese' as Person
union all select '56' as id,'BURUNDI' as Country,'BI' as 'Country Code','Burundian' as Nationality,'a Burundian' as Person
union all select '57' as id,'CAMBODIA' as Country,'KH' as 'Country Code','Cambodian' as Nationality,'a Cambodian' as Person
union all select '58' as id,'CAMEROON' as Country,'CM' as 'Country Code','Cameroonian' as Nationality,'a Cameroonian' as Person
union all select '59' as id,'CAPE VERDE ISLANDS' as Country,'CV' as 'Country Code','Cape Verdean' as Nationality,'a Cape Verdean' as Person
union all select '60' as id,'CHAD' as Country,'TD' as 'Country Code','Chadian' as Nationality,'a Chadian' as Person
union all select '61' as id,'CHILE' as Country,'CL' as 'Country Code','Chilean' as Nationality,'a Chilean' as Person
union all select '62' as id,'CONGO' as Country,'CG' as 'Country Code','Congolese' as Nationality,'a Congolese' as Person
union all select '63' as id,'COSTA RICA' as Country,'CR' as 'Country Code','Costa Rican' as Nationality,'a Costa Rican' as Person
union all select '64' as id,'CROATIA' as Country,'HR' as 'Country Code','Croat' as Nationality,'a Croat or a Croatian' as Person
union all select '65' as id,'CYPRUS' as Country,'CY' as 'Country Code','Cypriot' as Nationality,'a Cypriot' as Person
union all select '66' as id,'CZECH REPUBLIC' as Country,'CZ' as 'Country Code','Czech' as Nationality,'a Czech' as Person
union all select '67' as id,'DENMARK' as Country,'DK' as 'Country Code','Danish' as Nationality,'a Dane' as Person
union all select '68' as id,'DJIBOUTI' as Country,'DJ' as 'Country Code','Djiboutian' as Nationality,'a Djiboutian' as Person
union all select '69' as id,'DOMINICA' as Country,'DM' as 'Country Code','Dominican' as Nationality,'a Dominican' as Person
union all select '70' as id,'EGYPT' as Country,'EG' as 'Country Code','Egyptian' as Nationality,'an Egyptian' as Person
union all select '71' as id,'ERITREA' as Country,'ER' as 'Country Code','Eritrean' as Nationality,'an Eritrean' as Person
union all select '72' as id,'ESTONIA' as Country,'EE' as 'Country Code','Estonian' as Nationality,'an Estonian' as Person
union all select '73' as id,'ETHIOPIA' as Country,'ET' as 'Country Code','Ethiopian' as Nationality,'an Ethiopian' as Person
union all select '74' as id,'FIJI' as Country,'FJ' as 'Country Code','Fijian' as Nationality,'a Fijian' as Person
union all select '75' as id,'FINLAND' as Country,'FI' as 'Country Code','Finnish' as Nationality,'a Finn' as Person
union all select '76' as id,'FRENCH POLYNESIA' as Country,'PF' as 'Country Code','Polynesian' as Nationality,'a French Polynesian' as Person
union all select '77' as id,'GABON' as Country,'GA' as 'Country Code','Gabonese' as Nationality,'a Gabonese' as Person
union all select '78' as id,'GAMBIA' as Country,'GM' as 'Country Code','Gambian' as Nationality,'a Gambian' as Person
union all select '79' as id,'GEORGIA' as Country,'GE' as 'Country Code','Georgian' as Nationality,'a Georgian' as Person
union all select '80' as id,'GHANA' as Country,'GH' as 'Country Code','Ghanaian' as Nationality,'a Ghanaian' as Person
union all select '81' as id,'GREECE' as Country,'GR' as 'Country Code','Greek' as Nationality,'a Greek' as Person
union all select '82' as id,'GRENADA' as Country,'GD' as 'Country Code','Grenadian' as Nationality,'a Grenadian' as Person
union all select '83' as id,'GUINEA' as Country,'GN' as 'Country Code','Guinean' as Nationality,'a Guinean' as Person
union all select '84' as id,'GUYANA' as Country,'GY' as 'Country Code','Guyanese' as Nationality,'a Guyanese' as Person
union all select '85' as id,'HUNGARY' as Country,'HU' as 'Country Code','Hungarian' as Nationality,'a Hungarian' as Person
union all select '86' as id,'ICELAND' as Country,'IS' as 'Country Code','Icelandic' as Nationality,'an Icelander' as Person
union all select '87' as id,'INDONESIA' as Country,'ID' as 'Country Code','Indonesian' as Nationality,'an Indonesian' as Person
union all select '88' as id,'IRAN' as Country,'IR' as 'Country Code','Iranian' as Nationality,'an Iranian' as Person
union all select '89' as id,'IRAQ' as Country,'IQ' as 'Country Code','Iraqi' as Nationality,'an Iraqi' as Person
union all select '90' as id,'JAMAICA' as Country,'JM' as 'Country Code','Jamaican' as Nationality,'a Jamaican' as Person
union all select '91' as id,'JORDAN' as Country,'JO' as 'Country Code','Jordanian' as Nationality,'a Jordanian' as Person
union all select '92' as id,'KAZAKHSTAN' as Country,'KZ' as 'Country Code','Kazakh' as Nationality,'a Kazakh' as Person
union all select '93' as id,'KENYA' as Country,'KE' as 'Country Code','Kenyan' as Nationality,'a Kenyan' as Person
union all select '94' as id,'KOREA' as Country,'KP' as 'Country Code','North Korean' as Nationality,'a North Korean' as Person
union all select '95' as id,'KUWAIT' as Country,'KW' as 'Country Code','Kuwaiti' as Nationality,'a Kuwaiti' as Person
union all select '96' as id,'LATVIA' as Country,'LV' as 'Country Code','Latvian' as Nationality,'a Latvian' as Person
union all select '97' as id,'LEBANON' as Country,'LB' as 'Country Code','Lebanese' as Nationality,'a Lebanese' as Person
union all select '98' as id,'LIBERIA' as Country,'LR' as 'Country Code','Liberian' as Nationality,'a Liberian' as Person
union all select '99' as id,'LIBYA' as Country,'LY' as 'Country Code','Libyan' as Nationality,'a Libyan' as Person
union all select '100' as id,'LITHUANIA' as Country,'LT' as 'Country Code','Lithuanian' as Nationality,'a Lithuanian' as Person
union all select '101' as id,'LUXEMBOURG' as Country,'LU' as 'Country Code','LUXEMBOURG' as Nationality,'a Luxembourger' as Person
union all select '102' as id,'MADAGASCAR' as Country,'MG' as 'Country Code','Madagascan' as Nationality,'a Malagasy ' as Person
union all select '103' as id,'MALAWI' as Country,'MW' as 'Country Code','Malawian' as Nationality,'a Malawian' as Person
union all select '104' as id,'MALAYSIA' as Country,'MY' as 'Country Code','Malaysian' as Nationality,'a Malaysian' as Person
union all select '105' as id,'MALDIVES' as Country,'MV' as 'Country Code','Maldivian' as Nationality,'a Maldivian' as Person
union all select '106' as id,'MALI' as Country,'ML' as 'Country Code','Malian' as Nationality,'a Malian' as Person
union all select '107' as id,'MALTA' as Country,'MT' as 'Country Code','Maltese' as Nationality,'a Maltese' as Person
union all select '108' as id,'MAURITANIA' as Country,'MR' as 'Country Code','Mauritanian' as Nationality,'a Mauritanian' as Person
union all select '109' as id,'MAURITIUS' as Country,'MU' as 'Country Code','Mauritian' as Nationality,'a Mauritian' as Person
union all select '110' as id,'MONACO' as Country,'MC' as 'Country Code','Monacan' as Nationality,'a Monégasque ' as Person
union all select '111' as id,'MONGOLIA' as Country,'MN' as 'Country Code','Mongolian' as Nationality,'a Mongolian' as Person
union all select '112' as id,'MONTENEGRO' as Country,'ME' as 'Country Code','Montenegrin' as Nationality,'a Montenegrin' as Person
union all select '113' as id,'MOROCCO' as Country,'MA' as 'Country Code','Moroccan' as Nationality,'a Moroccan' as Person
union all select '114' as id,'MOZAMBIQUE' as Country,'MZ' as 'Country Code','Mozambican' as Nationality,'a Mozambican' as Person
union all select '115' as id,'NAMIBIA' as Country,'NA' as 'Country Code','Namibian' as Nationality,'a Namibian' as Person
union all select '116' as id,'NEPAL' as Country,'NP' as 'Country Code','Nepalese' as Nationality,'a Nepalese' as Person
union all select '117' as id,'NEW ZEALAND' as Country,'NZ' as 'Country Code','New Zealand ' as Nationality,'a New Zealander' as Person
union all select '118' as id,'NICARAGUA' as Country,'NI' as 'Country Code','Nicaraguan' as Nationality,'a Nicaraguan' as Person
union all select '119' as id,'NIGER' as Country,'NE' as 'Country Code','Nigerien' as Nationality,'a Nigerien' as Person
union all select '120' as id,'NIGERIA' as Country,'NG' as 'Country Code','Nigerian' as Nationality,'a Nigerian' as Person
union all select '121' as id,'NORWAY' as Country,'NO' as 'Country Code','Norwegian' as Nationality,'a Norwegian' as Person
union all select '122' as id,'OMAN' as Country,'OM' as 'Country Code','Omani' as Nationality,'an Omani' as Person
union all select '123' as id,'PAKISTAN' as Country,'PK' as 'Country Code','Pakistani' as Nationality,'a Pakistani' as Person
union all select '124' as id,'PANAMA' as Country,'PA' as 'Country Code','Panamanian' as Nationality,'a Panamanian' as Person
union all select '125' as id,'PAPUA NEW GUINEA' as Country,'PG' as 'Country Code','Guinean' as Nationality,'a Papua New Guinean' as Person
union all select '126' as id,'PARAGUAY' as Country,'PY' as 'Country Code','Paraguayan' as Nationality,'a Paraguayan' as Person
union all select '127' as id,'PERU' as Country,'PE' as 'Country Code','Peruvian' as Nationality,'a Peruvian' as Person
union all select '128' as id,'POLAND' as Country,'PL' as 'Country Code','Polish' as Nationality,'a Pole' as Person
union all select '129' as id,'PORTUGAL' as Country,'PT' as 'Country Code','Portuguese' as Nationality,'a Portuguese' as Person
union all select '130' as id,'QATAR' as Country,'QA' as 'Country Code','Qatari' as Nationality,'a Qatari' as Person
union all select '131' as id,'ROMANIA' as Country,'RO' as 'Country Code','Romanian' as Nationality,'a Romanian' as Person
union all select '132' as id,'RWANDA' as Country,'RW' as 'Country Code','Rwandan' as Nationality,'a Rwandan' as Person
union all select '133' as id,'SAUDI ARABIA' as Country,'SA' as 'Country Code','Saudi Arabian' as Nationality,'a Saudi Arabian' as Person
union all select '134' as id,'SENEGAL' as Country,'SN' as 'Country Code','Senegalese' as Nationality,'a Senegalese' as Person
union all select '135' as id,'SERBIA' as Country,'RS' as 'Country Code','Serb or Serbian' as Nationality,'a Serb or a Serbian' as Person
union all select '136' as id,'SIERRA LEONE' as Country,'SL' as 'Country Code','Sierra Leonian' as Nationality,'a Sierra Leonian' as Person
union all select '137' as id,'SINGAPORE' as Country,'SG' as 'Country Code','Singaporean' as Nationality,'a Singaporean' as Person
union all select '138' as id,'SLOVAKIA' as Country,'SK' as 'Country Code','Slovak' as Nationality,'a Slovak' as Person
union all select '139' as id,'SLOVENIA' as Country,'SI' as 'Country Code','Slovenian' as Nationality,'a Slovene ' as Person
union all select '140' as id,'SOLOMON ISLANDS' as Country,'SB' as 'Country Code','Slomoni' as Nationality,'a Solomon Islander' as Person
union all select '141' as id,'SOMALIA' as Country,'SO' as 'Country Code','Somali' as Nationality,'a Somali' as Person
union all select '142' as id,'SOUTH AFRICA' as Country,'ZA' as 'Country Code','South African' as Nationality,'a South African' as Person
union all select '143' as id,'SRI LANKA' as Country,'LK' as 'Country Code','Sri Lankan' as Nationality,'a Sri Lankan' as Person
union all select '144' as id,'SUDAN' as Country,'SD' as 'Country Code','Sudanese' as Nationality,'a Sudanese' as Person
union all select '145' as id,'SURINAME' as Country,'SR' as 'Country Code','Surinamese' as Nationality,'a Surinamer' as Person
union all select '146' as id,'SWAZILAND' as Country,'SZ' as 'Country Code','Swazi' as Nationality,'a Swazi' as Person
union all select '147' as id,'TAJIKISTAN' as Country,'TJ' as 'Country Code','Tajik' as Nationality,'a Tajik' as Person
union all select '148' as id,'THAILAND' as Country,'TH' as 'Country Code','Thai' as Nationality,'a Thai' as Person
union all select '149' as id,'TOGO' as Country,'TG' as 'Country Code','Togolese' as Nationality,'a Togolese' as Person
union all select '150' as id,'TRINIDAD AND TOBAGO' as Country,'TT' as 'Country Code','Trinidadian' as Nationality,'a Trinidadian' as Person
union all select '151' as id,'TUNISIA' as Country,'TN' as 'Country Code','Tunisian' as Nationality,'a Tunisian' as Person
union all select '152' as id,'TURKEY' as Country,'TR' as 'Country Code','Turkish' as Nationality,'a Turk' as Person
union all select '153' as id,'TURKMENISTAN' as Country,'TM' as 'Country Code','Turkoman' as Nationality,'a Turkmen' as Person
union all select '154' as id,'TUVALU' as Country,'TV' as 'Country Code','Tuvaluan' as Nationality,'a Tuvaluan' as Person
union all select '155' as id,'UGANDA' as Country,'UG' as 'Country Code','Ugandan' as Nationality,'a Ugandan' as Person
union all select '156' as id,'UKRAINE' as Country,'UA' as 'Country Code','Ukrainian' as Nationality,'a Ukrainian' as Person
union all select '157' as id,'UNITED ARAB EMIRATES' as Country,'AE' as 'Country Code','Emirati' as Nationality,'a UAE citizen' as Person
union all select '158' as id,'UNITED STATES' as Country,'US' as 'Country Code','American' as Nationality,'a US citizen' as Person
union all select '159' as id,'URUGUAY' as Country,'UY' as 'Country Code','Uruguayan' as Nationality,'a Uruguayan' as Person
union all select '160' as id,'UZBEKISTAN' as Country,'UZ' as 'Country Code','Uzbek' as Nationality,'an Uzbek' as Person
union all select '161' as id,'VANUATU' as Country,'VU' as 'Country Code','Vanuatuan' as Nationality,'a Vanuatuan' as Person
union all select '162' as id,'YEMEN' as Country,'YE' as 'Country Code','Yemeni' as Nationality,'a Yemeni' as Person
union all select '163' as id,'ZAMBIA' as Country,'ZM' as 'Country Code','Zambian' as Nationality,'a Zambian' as Person) as a


update t 
	set t.ETLNationalityName=m.NationalityName
from #tempNationality t inner join tblEtlMembers m on m.NationalityName=t.Country

insert into TBL_ETL_Nationality_MAPPING(ETLNationalityName,Country,Nationality,NationalityID)
select t.ETLNationalityName,t.Country,t.Nationality,n.Id 
from #tempNationality t 
left join tblNationality n on n.Nationality=t.Nationality





insert into TBL_ETL_Nationality_MAPPING(ETLNationalityName,Country,Nationality,NationalityID)
select ETLNationalityName,Country,Nationality,NationalityID from (
select 
	case when Nationality='Syrian Arab Republic' then 'Syria'
		when Nationality='Comoran, Comorian' then 'Comoros'
		when Nationality='Antiguan / Barbudan' then 'Antigua and Barbuda'
		when Nationality='Macedonian' then 'Macedonia'
		when Nationality='Seychellois' then 'Seychelles'
		when Nationality='Kyrgyzstani / Kyrgyz' then 'Kyrgyzstan'
		when Nationality='Burmese' then 'Myanmar'
		when Nationality='Zimbabwean' then 'Zimbabwe'
		when Nationality='British Virgin Island' then 'British Virgin Islands'
		when Nationality='Tanzanian' then 'Tanzania'
		when Nationality='Moldovan' then 'Moldova'
		when Nationality='American' then 'United States of America'
		when Nationality='Russian' then 'Russia'
		when Nationality='Palestinian' then 'Palestine' end as ETLNationalityName,
		case when Nationality='Syrian Arab Republic' then 'Syria'
		when Nationality='Comoran, Comorian' then 'Comoros'
		when Nationality='Antiguan / Barbudan' then 'Antigua and Barbuda'
		when Nationality='Macedonian' then 'Macedonia'
		when Nationality='Seychellois' then 'Seychelles'
		when Nationality='Kyrgyzstani / Kyrgyz' then 'Kyrgyzstan'
		when Nationality='Burmese' then 'Myanmar'
		when Nationality='Zimbabwean' then 'Zimbabwe'
		when Nationality='British Virgin Island' then 'British Virgin Islands'
		when Nationality='Tanzanian' then 'Tanzania'
		when Nationality='Moldovan' then 'Moldova'
		when Nationality='American' then 'United States of America'
		when Nationality='Russian' then 'Russia'
		when Nationality='Palestinian' then 'Palestine' end as Country,
		Nationality,Id as NationalityID
from tblNationality where Nationality in ('Syrian Arab Republic','Comoran, Comorian','Antiguan / Barbudan','Macedonian','Seychellois','Kyrgyzstani / Kyrgyz','Burmese','Zimbabwean','British Virgin Island','Tanzanian','Moldovan','American','Russian','Palestinian','Syrian Arab Republic')) as a

where not exists(select * from TBL_ETL_Nationality_MAPPING en where en.ETLNationalityName=a.ETLNationalityName)


update  TBL_ETL_Nationality_MAPPING set ETLNationalityName='South Korea' where Nationality='South Korean' and Country='KOREA'
