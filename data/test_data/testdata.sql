-- userテーブル
insert into `users`(`user_name`,`uid`)
values ('test1', '1234567890abcdefg');

-- portfoliosテーブル
insert into `portfolios`(`user_id`, `portfolio_name`, `portfolio_overview`, `portfolio_appeal`,`portfolio_term`, `portfolio_state`, `nice_count`)
values (1 , 'pflist' , '概要です' , 'アピールポイント' , 4 , '開発中' , 0);

-- portfolios_imagesテーブル
insert into `portfolios_images`(`portfolio_id`, `portfolio_image`) 
values (1, 'https://github.com/haruto830/pflist-frontend/blob/master/doc/image/pflistLogo/pinterest_profile_image.png?raw=true');

-- SKILLS_CATEGORIESテーブル
insert into `skills_categories`(`skill_category_name`)
values ('言語'),('フレームワーク'),('DB'),('クラウド'),('その他');

-- skills_mastersテーブル
insert into `skills_masters`(`skill_name`, `skill_category_id`)
values ('JavaScript',1),('Vue.js',2),('MySQL', 3),('AWS',4);

-- portfolios_skillsテーブル
insert into `portfolios_skills`(`skill_cd` ,`portfolio_id`)
values (1,1),(2,1),(3,1),(4,1);

-- PORTFOLIOS_NICESテーブル
insert into  `portfolios_nices`(`user_id`,`portfolio_id`)
values (1,1);

-- urls_categoriesテーブル
insert into `urls_categories` (`url_category_name`)
values ('ポートフォリオ'),('リポジトリ'),('ブログ');

-- portfolios_urlsテーブル
insert into `portfolios_urls`(`portfolio_id` ,`url_category_id`, `url`) 
values (1,1,'http://pflist.com'),(1,2,'https://github.com/haruto830/pflist-backend'),(1,2,'https://github.com/haruto830/pflist-frontend');