INSERT INTO `adl_db`.`useradl`
(`userRegistration_email`,
`user_ADL_name`,
`user_ADL_description`,
`times_ADL_completed`,
`times_ADL_completed_week`,
`times_ADL_completed_month`)
VALUES
("testuser1@colorado.edu",
"Brush teeth",
"Everyday I brush my teeth",
2,
1,
2);

INSERT INTO `adl_db`.`useradl`
(`userRegistration_email`,
`user_ADL_name`,
`user_ADL_description`,
`times_ADL_completed`,
`times_ADL_completed_week`,
`times_ADL_completed_month`)
VALUES
("testuser1@colorado.edu",
"Make breakfast",
"Everyday I make breakfast",
9,
6,
8);

INSERT INTO `adl_db`.`useradl`
(`userRegistration_email`,
`user_ADL_name`,
`user_ADL_description`,
`times_ADL_completed`,
`times_ADL_completed_week`,
`times_ADL_completed_month`)
VALUES
("testuser2@colorado.edu",
"Brush teeth",
"Everyday I brush my teeth",
20,
2,
20);


SELECT *
FROM `adl_db`.`useradl`;

