# randomに抽出する

```sql
SEELCT * FROM customers ORDER BY random() LIMIT 1;

EXPLAIN ANALYZE SELECT * FROM customers WHERE name = 'sylvester41';
```

- 大体 300ms ぐらいかかる

# Indexを貼って高速化

```sql
CREATE INDEX customers_name_idx ON customers (name);
-- ANALYZE VERBOSE customers;

DROP INDEX customers_name_idx;
```

Execution Time: 3.989 ms

# Parallel Query の有効化

```sql
SHOW max_parallel_workers_per_gather;
SHOW max_parallel_workers;
```

どちらもデフォルトにする.
max_parallel_workers_per_gather=2
max_parallel_workers=8

70ms ぐらいにはなる.
