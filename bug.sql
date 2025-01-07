In SQL, a common yet subtle error arises when dealing with `NULL` values and aggregate functions like `AVG`, `SUM`, `MIN`, or `MAX`.  These functions often ignore `NULL` values, leading to unexpected results if not handled appropriately. For instance, calculating the average of a column with some `NULL` entries might yield a lower average than expected because `NULL`s are effectively omitted from the calculation.

Consider this table:

```sql
CREATE TABLE scores (student_id INT, score INT);
INSERT INTO scores (student_id, score) VALUES (1, 85), (2, 92), (3, NULL), (4, 78);
```

If you attempt to calculate the average score using `AVG(score)`:

```sql
SELECT AVG(score) FROM scores;
```

The result will be the average of 85, 92, and 78, excluding the `NULL` value.  This might be correct behavior in some contexts, but if you intended the `NULL` to represent a zero or some other value, the average will be skewed.