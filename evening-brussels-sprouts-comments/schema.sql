CREATE TABLE recipes (
  recipe_id serial not null primary key,
  recipe_name varchar(100)
 );

 CREATE TABLE comments (
   comment_id serial not null primary key,
   comment varchar(255),
   recipe_id serial references recipes
 );
