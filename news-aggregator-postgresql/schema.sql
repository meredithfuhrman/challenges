-- If you want to run this schema repeatedly you'll need to drop
-- the table before re-creating it. Note that you'll lose any
-- data if you drop and add a table:

-- DROP TABLE IF EXISTS articles;

-- Define your schema here:

CREATE TABLE articles (
  article_id integer,
  title varchar(50),
  url varchar(50),
  description varchar(50)

 );
