-- userテーブル
create table if not exists `users`
(
`user_id`	    varchar(255) not null,
`user_name`	    varchar(255) not null,
`uid`           varchar(255) not null,
`insert_data`   datetime not null default current_timestamp,
`update_date`	datetime not null default current_timestamp,
`delete_flag`	tinyint(1) not null,
primary key (`user_id`)
) default charset=utf8 collate=utf8_bin;