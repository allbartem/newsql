CREATE OR REPLACE VIEW V_TDSUBPROGS
AS 
SELECT 
SPRG.CLIENT_ID,
SPRG.PROGRAM_ID,
SPRG.SUB_PROGRAM_ID,
SPRG.NAME SUBPRG_NAME,
SPRG.CLIENT_SUB_PROGRAM_NAME AS CLI_SUBPRG_NAME,
SPRG.DESCRIPTION AS SUBPRG_DESC,
SPRG.START_DATE AS SUBPRG_START_DATE,
SPRG.END_DATE AS SUBPRG_END_DATE,
SPRG.APPROVED_CAPITAL_AMOUNT SUBPRG_APPROVED_CAP,
SPRG.APPROVED_EXPENSE_AMOUNT SUBPRG_APPROVED_EXP,
SPRG.PLANNED_SUBPROGRAM,
SPRG.STATUS AS SUBPRG_STATUS,
SPRG.SUB_PROGRAM_MANAGER_ID
FROM PRJ_SUB_PROGRAM SPRG
WHERE SPRG.CLIENT_ID = 48
OR SPRG.CLIENT_ID = 49;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE VIEW V_TDPROGS
AS 
SELECT PRG.PROGRAM_ID,
PRG.CLIENT_ID,
PRG.PLAN_ID,
PRG.NAME AS PLAN_NAME,
PRG.CLIENT_PROGRAM_NAME,
PRG.STATUS AS PRG_STATUS,
PRG.PROGRAM_MANAGER_ID,
PRG.START_DATE AS PRG_STARTDATE,
PRG.END_DATE AS PRG_ENDDATE,
PRG.DESCRIPTION AS PRG_DESC
FROM PRJ_PROGRAM PRG
WHERE PRG.CLIENT_ID = 48
OR PRG.CLIENT_ID = 49;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW V_TDPLANS
AS 
SELECT 
PLN.PLAN_ID,
PLN.CLIENT_ID,
PLN.NAME AS PLAN_NAME,
PLN.CLIENT_PLAN_NAME,
PLN.STATUS AS PLN_STATUS,
PLN.PLAN_MANAGER_ID ,
PLN.START_DATE AS PLN_STARTDATE,
PLN.END_DATE AS PLN_ENDDATE,
PLN.DESCRIPTION AS PLN_DESC
FROM PRJ_PLAN PLN
WHERE PLN.CLIENT_ID = 48
OR PLN.CLIENT_ID = 49;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW V_TDTENANTSITE
AS 
SELECT RTA.*, RT.ID, RT.OPERATING_NAME, RT.LEGAL_NAME, RT.TENANT_TYPE,
RT.TENANT_NUM, RT.DEPT_ID
FROM
RLSE_TENANT_SITES_ALL RTA
INNER JOIN RLSE_TENANT RT
ON RTA.TENANT_ID = RT.ID 
AND RTA.CLIENT_ID IN (48, 49);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW V_TDBLDG
AS 
SELECT B.BUILDING_ID,
          B.CLIENTID AS "CLIENT_ID",
          B.CLIENTCODE AS "CLIENT_BUILDING_CODE",
          B.CLIENTOWNERSHIP_CODE AS "LEASE_OWN",
          B.BUILDING_NAME AS "BUILDING_NAME",
          B.ADDRESS AS "ADDRESS",
          B.ADDRESS2 AS "ADDRESS2",
          B.CITY AS "CITY",
          B.PROVINCE AS "PROV",
          B.POSTALCODE AS "POSTAL",
          B.CODE AS "COUNTRY",
          B.FMZID AS "FMZ_ID",
          B.RENTABLEAREA AS "RENTABLE_SQFT",
          B.LEASEDRENTABLEAREA AS "GROSS_SQFT",
          B.OFFICESPACE AS "USABLE_SQFT",
           B.STARTDATE AS "START_DATE",
          B.ENDDATE AS "END_DATE",
          B.OCCUPANCYSTATUS_CODE AS "OCCUPANCY_STATUS",
          B.PRIMARYUSAGE_CODE AS "PROP_USE",
          B.STATUS AS "ACTIVE",
          B.STATUSREASON AS "INACTIVATE_REASON",
          CASE B.LocationType
             WHEN 'BUILDING' THEN B.BUILDINGMANAGER
             WHEN 'LAND' THEN B.LANDMANAGER
          END
             AS "LABORCODE",
          B.CONSTRUCTIONYEAR AS "CONSTRUCTION_YEAR",
          B.LONGITUDE AS "LONGITUDE",
          B.LATITUDE AS "LATITUDE",
          B.LAND_CODE AS "DWELLING_LAND_ID"
     FROM BUILDING_MAT B
	 WHERE B.CLIENTID = 48
	 OR B.CLIENTID = 49;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW V_TDGOBJ_ORG
AS 
SELECT
	ORGANIZATION_ID, 
	NAME AS ORG_NAME, 
  ORGANIZATION_ROLE,
	BUSINESS_GROUP_ID, 
	LOCATION_ID, 
	CLIENT_ID, 
	DATE_FROM, 
	DATE_TO, 
	INTERNAL_EXTERNAL_FLAG, 
	TYPE, 
	PARTY_ID, 
	EXTERNALSYS_ORGANIZATION_ID 
FROM GOBJ_ORGANIZATION
	 WHERE CLIENT_ID = 48
	 OR CLIENT_ID = 49;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW V_TDPRJCLASS
AS 
SELECT 
 	"PROJECTCLASS_ID" ,
	"CLASS_CODE" ,
	"CLIENT_ID" ,
	"DESCRIPTION" ,
	"INHERITCLASS" ,
	"INACTIVE" 
  FROM RPRJ_PROJECTCLASS
	 WHERE CLIENT_ID = 48
	 OR CLIENT_ID = 49;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW V_TDLABOR
AS 
SELECT 
 AH_EMAIL,
CALLING_ORDER,
CELL,
CLIENT_ID,
COUNTRY,
CRAFT,
DELEGATE,
EMAIL,
EMPLOYEE_ID,
LABORCODE,
NAME LABOUR_NAME,
PERSON_ID,
PHONENUM,
POSTAL_CODE,
PROVINCE,
SUPERVISOR
  FROM LABOR
	 WHERE CLIENT_ID = 48
	 OR CLIENT_ID = 49;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW V_TDPRJTEMPLATE
AS
SELECT 
ACTIVE_FLAG,
CLIENT_ID,
DESCRIPTION,
PROJECT_TEMPLATE_ID,
TEMPLATE_NAME
FROM PRJ_PROJECT_TEMPLATE
WHERE (CLIENT_ID = 48 OR CLIENT_ID = 49);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW V_TDLUKUPCLISTATUS
AS 
SELECT DISTINCT
  LOOKUP_CODE_ID,
  LOOKUP_VALUE,
  LOOKUP_DEFINITION,
  CLIENT_ID
FROM
  LOOKUP_CODE 
  WHERE LOOKUP_TYPE_CLASS = 'PRJ.CLIENT_STATUS'
  AND ( CLIENT_ID = 48
  OR CLIENT_ID = 49);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


