create table images(
imgid int auto_increment primary key,
name varchar(50),
photo longblob
);
drop table images;
insert into images(name, photo)
values 
("Profilepic", load_file('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/red.jpg'));

show variables like 'secure_file_priv';

select imgid, name,length(photo) as imagesize from images;
