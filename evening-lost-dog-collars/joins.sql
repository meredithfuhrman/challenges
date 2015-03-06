-- For which collars can we identify an owner?
SELECT lost_dog_collars.dog_name AS lost_collar, dog_owners.name AS owner_Name
  FROM lost_dog_collars
  JOIN dog_owners
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);


-- For which collars is there no known owner?
SELECT lost_dog_collars.dog_name AS lost_collar
  FROM lost_dog_collars
  LEFT OUTER JOIN dog_owners
  ON (dog_owners.dog_name = lost_dog_collars.dog_name)
WHERE dog_owners.dog_name IS null;


-- We need to see all collars, with an owner, if one matches.
SELECT lost_dog_collars.dog_name AS lost_collar, dog_owners.name AS owner_Name
  FROM lost_dog_collars
  LEFT OUTER JOIN dog_owners
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- We need to see all owners, with collars in the Lost and Found, if one matches
SELECT lost_dog_collars.dog_name AS lost_collar, dog_owners.name AS owner_Name
  FROM lost_dog_collars
  RIGHT OUTER JOIN dog_owners
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);
