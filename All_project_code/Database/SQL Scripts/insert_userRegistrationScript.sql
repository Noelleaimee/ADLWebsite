INSERT INTO `adl_db`.`userregistration`
(`email`,
`username`,
`password`,
`first_name`,
`last_name`)
VALUES
('testuser1@colorado.edu',
'testuser1',
sha1('123456'),
'First',
'Last');

INSERT INTO `adl_db`.`userregistration`
(`email`,
`username`,
`password`,
`first_name`,
`last_name`)
VALUES
('testuser2@colorado.edu',
'testuser2',
sha1('12345'),
'First',
'Last');

INSERT INTO `adl_db`.`userregistration`
(`email`,
`username`,
`password`,
`first_name`,
`last_name`)
VALUES
('testuser3@colorado.edu',
'testuser3',
sha1('1234567'),
'First',
'Last');