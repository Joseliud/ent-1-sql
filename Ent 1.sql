-- === USERS ===

select * from users;

create table users (
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30)
);

insert into users (first_name, last_name, email)values
('Eliud', 'Rincon', 'jose08@academlo.com'), --1
('Bryan', 'Sanchez', 'bryan09@academlo.com'), --2
('Karen', 'Mendoza', 'mendoza10@academlo.com'); --3

-- === POSTS ===

select * from posts;

create table posts (
	id serial primary key,
	user_id int references users(id),
	title varchar(100),
	text varchar(100)
);

insert into posts (user_id, title, text) values
(1, 'Aprendiendo SQL', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi '), -- 1
(2, 'Como crear una tabla en SQL', 'varius congue odio, non tristique lorem. Vivamus et vehicula ipsum'),-- 2
(3, 'Fundamentos de SQL', 'ut iaculis ipsum. Sed felis nibh, elementum nec erat sed'),-- 3
(2, 'Instalaciòn de pgAmdin', 'varius varius est. Donec nec arcu vitae diam lobortis rhoncus'),-- 4
(1, 'Comandos basicos de SQL', 'sit amet at elit. Suspendisse non diam mauris. Etiam arcu'); -- 5

drop table posts;

-- === LIKES (pivote) ===
select * from likes;

create table likes(
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values
(1,1),
(1,2),
(1,3),
(2,1),
(3,1);

-- posts -- like -- users

select * from users inner join likes
on users.id = likes.user_id inner join posts
on posts.id = likes.post_id;
