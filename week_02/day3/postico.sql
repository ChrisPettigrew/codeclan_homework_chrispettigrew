/* This is a full join */

SELECT animals.*, diets.*
FROM animals
FULL OUTER JOIN diets
ON animals.diet_id = diets.id;

/* which keeper cares for each animal each day*/

SELECT animals.*, care_schedule.*
FROM animals
INNER JOIN care_schedule
ON animals.id = care_schedule.animal_id;

SELECT*
FROM(
	animals
	INNER JOIN care_schedule
	ON animals.id = care_schedule.animal_id
)
INNER JOIN keepers
ON
care_schedule.keeper_id = keepers.id;