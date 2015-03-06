#Query 1; Find all rows that have an ingredient name of Brussels sprouts:

EXPLAIN ANALYZE SELECT name FROM ingredients WHERE name ILIKE '%brussels sprouts%';

  ## Query 1 Analysis with No Index
  ![alt](https://www.dropbox.com/s/p39xalzpzmihqug/Query1-NoIndex.png?dl=0)

  ## Query 1 Analysis with Index
  ![alt](https://www.dropbox.com/s/fz8vdalryqtdzal/Query1-Index.png?dl=0)


#Query 2: Calculate the total count of rows of ingredients with a name of Brussels sprouts:

EXPLAIN ANALYZE SELECT COUNT (asterisk) FROM ingredients WHERE name ILIKE '%brussels sprouts%';

  ## Query 2 Analysis with No Index
  ![alt](https://www.dropbox.com/s/cr3an3arro3yzhl/Query2-NoIndex.png?dl=0)

  ## Query 2 Analysis with Index
  ![alt](https://www.dropbox.com/s/fdufhqbbkhy1t8c/Query2-Index.png?dl=0)

#Query 3:Find all Brussels sprouts ingredients having a unit type of gallon(s):

EXPLAIN ANALYZE SELECT quantity, unit, name FROM ingredients WHERE (name ILIKE '%brussels sprouts%') AND (unit ILIKE '%gallon%');

  ## Query 3 Analysis with No Index
  ![alt](https://www.dropbox.com/s/n60kqim6ja9l2xa/Query3-NoIndex.png?dl=0)

  ## Query 3 Analysis with Index
  ![alt](https://www.dropbox.com/s/yudbnyr8pyh9dud/Query3-Index.png?dl=0)

#Query 4: Find all rows that have a unit type of gallon(s), a name of Brussels sprouts or has the letter j in it:

EXPLAIN ANALYZE SELECT quantity, unit, name FROM ingredients WHERE unit ILIKE '%gallon%' AND (name ILIKE '%brussels sprouts%' OR name ILIKE '%j%');

  ## Query 4 Analysis with No Index
  ![alt](https://www.dropbox.com/s/oaaz9a7drwm9cjc/Query4-NoIndex.png?dl=0)

  ## Query 4 Analysis with Index
  ![alt](https://www.dropbox.com/s/3xa026ytec9oap3/Query4-Index.png?dl=0)

#To create index:

CREATE INDEX ingredient_name ON ingredients (name);
