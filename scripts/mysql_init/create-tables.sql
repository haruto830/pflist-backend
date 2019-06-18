CREATE TABLE IF NOT EXISTS `USERS`
(
`USER_ID`	    VARCHAR(255) NOT NULL,
`USER_NAME`	    VARCHAR(255) NOT NULL,
`UID`           VARCHAR(255) NOT NULL,
`INSERT_DATA`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
`UPDATE_DATE`	DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
`DELETE_FLAG`	TINYINT(1) NOT NULL,
PRIMARY KEY (`USER_ID`)
) DEFAULT CHARSET=UTF8 COLLATE=UTF8_BIN;
