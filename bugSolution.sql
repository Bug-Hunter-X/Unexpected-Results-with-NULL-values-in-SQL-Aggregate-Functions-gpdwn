Several techniques can handle `NULL` values in aggregate functions:

1. **COALESCE:** Replace `NULL` values with a specific value (e.g., 0) using the `COALESCE` function.

```sql
SELECT AVG(COALESCE(score, 0)) FROM scores;
```

This replaces `NULL` scores with 0 before calculating the average, giving a more representative result.

2. **CASE statement:**  Conditionally handle `NULL` values

```sql
SELECT AVG(CASE WHEN score IS NULL THEN 0 ELSE score END) FROM scores;
```

This uses a `CASE` statement to replace `NULL` with 0. 

3. **Filtering:** If appropriate, filter out rows with NULL values before calculating the average.

```sql
SELECT AVG(score) FROM scores WHERE score IS NOT NULL;
```

This approach only averages scores where the value isn't NULL.  Choose the method that makes the most sense for your data and desired outcome.