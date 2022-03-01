INSERT INTO `adl_db`.`userregistration`
(`email`,
`username`,
`password`,
`first_name`,
`last_name`)
VALUES
('testuser2@colorado.edu',
'testuser2',
password('12345678'),
'First',
'Last');

SELECT *
FROM userregistration;