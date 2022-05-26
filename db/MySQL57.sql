CREATE DATABASE IF NOT EXISTS NIIT
    CHARACTER SET utf8
    COLLATE utf8_bin;

use NIIT;

show tables;

CREATE TABLE IF NOT EXISTS `user`(
                                     `UserName` VARCHAR(20),
                                     `Password` VARCHAR(20) NOT NULL,
                                     `EmailID` VARCHAR(20) NOT NULL,
                                     PRIMARY KEY ( `UserName` ));

insert into `user`(username, password, emailid)
    values
    ('Liam','niit1234','1225419368@qq.com');

SELECT * from user;

select * from niit.user where username = 1 and password = 1;
