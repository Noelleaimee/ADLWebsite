INSERT INTO `adl_db`.`userregistration`
(`email`,
`username`,
`password`,
`first_name`,
`last_name`)
VALUES
('testuser2@colorado.edu',
'testuser2',
sha1('123456'),
'First',
'Last');