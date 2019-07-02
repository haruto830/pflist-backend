-- userテーブル
create table if not exists `users`
(
    `user_id`       int auto_increment,
    `user_name`	    varchar(255) not null,
    `uid`           varchar(255) not null,
    `insert_data`   datetime not null default current_timestamp,
    `update_date`   datetime not null default current_timestamp,
    `delete_flag`   tinyint(1) not null default 0,
    primary key (`user_id`),
    INDEX idx_uid(uid)
) default charset=utf8 collate=utf8_bin;

-- portfoliosテーブル
create table if not exists `portfolios`
(
    `portfolio_id`       int auto_increment,
    `user_id`            int not null,
    `portfolio_name`     varchar(255) not null,
    `portfolio_overview` text,
    `portfolio_appeal`   text,
    `portfolio_term`     int,
    `portfolio_state`    varchar(255),
    `nice_count`         int,
    `insert_data`        datetime not null default current_timestamp,
    `update_date`        datetime not null default current_timestamp,
    `delete_flag`        tinyint(1) not null default 0,
    primary key (`portfolio_id`),
    foreign key (user_id) references users(user_id)
) default charset=utf8 collate=utf8_bin;

-- portfolios_imagesテーブル
create table if not exists `portfolios_images`
(
    `image_id`        int auto_increment,
    `portfolio_id`    int not null,
    `portfolio_image` text,
    `insert_data`     datetime not null default current_timestamp,
    `update_date`     datetime not null default current_timestamp,
    `delete_flag`     tinyint(1) not null default 0,
    primary key (`image_id`),
    foreign key (portfolio_id) references portfolios(portfolio_id)
) default charset=utf8 collate=utf8_bin;

-- SKILLS_CATEGORIESテーブル
create table if not exists `skills_categories`
(
    `skill_category_id`    int auto_increment,
    `skill_category_name`  varchar(255) not null,
    `insert_data`    datetime not null default current_timestamp,
    `update_date`    datetime not null default current_timestamp,
    `delete_flag`    tinyint(1) not null default 0,
    primary key (`skill_category_id`)
) default charset=utf8 collate=utf8_bin;

-- skills_mastersテーブル
create table if not exists `skills_masters`
(
    `skill_cd`     int auto_increment,
    `skill_name`   varchar(255) not null,
    `skill_category_id` int,
    `insert_data`  datetime not null default current_timestamp,
    `update_date`  datetime not null default current_timestamp,
    `delete_flag`  tinyint(1) not null default 0,
    primary key (`skill_cd`),
    foreign key (skill_category_id) references skills_categories(skill_category_id)
) default charset=utf8 collate=utf8_bin;

-- portfolios_skillsテーブル
create table if not exists `portfolios_skills`
(
    `skill_id`     int auto_increment,
    `skill_cd`     int,
    `portfolio_id` int,
    `insert_data`  datetime not null default current_timestamp,
    `update_date`  datetime not null default current_timestamp,
    `delete_flag`  tinyint(1) not null default 0,
    primary key (`skill_id`),
    foreign key (skill_cd) references skills_masters(skill_cd),
    foreign key (portfolio_id) references portfolios(portfolio_id)
) default charset=utf8 collate=utf8_bin;

-- PORTFOLIOS_NICESテーブル
create table if not exists `portfolios_nices`
(
    `nice_id`      int auto_increment,
    `user_id`      int not null,
    `portfolio_id` int not null,
    `insert_data`  datetime not null default current_timestamp,
    primary key (`nice_id`),
    foreign key (user_id) references users(user_id),
    foreign key (portfolio_id) references portfolios(portfolio_id)
) default charset=utf8 collate=utf8_bin;

-- urls_categoriesテーブル
create table if not exists `urls_categories`
(
    `url_category_id`    int auto_increment,
    `url_category_name`  varchar(255) not null,
    `insert_data`    datetime not null default current_timestamp,
    `update_date`    datetime not null default current_timestamp,
    `delete_flag`    tinyint(1) not null default 0,
    primary key (`url_category_id`)
) default charset=utf8 collate=utf8_bin;

-- portfolios_urlsテーブル
create table if not exists `portfolios_urls`
(
    `url_id`       int auto_increment,
    `portfolio_id` int not null,
    `url_category_id`  int not null, 
    `url` varchar(255) not null,
    `insert_data`  datetime not null default current_timestamp,
    `update_date`  datetime not null default current_timestamp,
    `delete_flag`  tinyint(1) not null default 0,
    primary key (`url_id`),
    foreign key (url_category_id) references urls_categories(url_category_id)
) default charset=utf8 collate=utf8_bin;