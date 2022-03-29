-- User Registration 
SELECT *
FROM `adl_db`.`userregistration`;

-- Individual ADLs 
SELECT *
FROM `adl_db`.`useradl`
WHERE userRegistration_email = "testuser1@colorado.edu";

SELECT * 
FROM `adl_db`.`useradl`
WHERE userRegistration_email = "testuser2@colorado.edu";

-- User profile
SELECT *
FROM `adl_db`.`userprofile`;
 
