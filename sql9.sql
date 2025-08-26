-- METADATA

-- List all databases:
SHOW DATABASES;

-- List all tables in a database:
SHOW TABLES;

-- Describe structure of a table (columns, datatypes, keys):
DESCRIBE teacher;

-- Get all tables with their columns using information_schema:
SELECT table_name, column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'sprk';

-- Find primary key of a table:
SELECT column_name
FROM information_schema.key_column_usage
WHERE table_name = 'teacher'
AND constraint_name = 'PRIMARY';

-- Find foreign key relationships:
SELECT constraint_name, table_name, column_name, referenced_table_name, referenced_column_name
FROM information_schema.key_column_usage
WHERE referenced_table_name IS NOT NULL;

-- metadata about constraints
select constraint_name, constraint_type, table_name 
from information_schema.table_constraints
where table_schema = 'sprk';

-- Metadata about Indexes
show index from teacher;

select index_name, column_name, non_unique, seq_in_index
from information_schema.statistics
where table_schema = 'sprk' and table_name = 'student';

-- Metadata about columns
select column_name, data_type, character_maximum_length, is_nullable, column_key, column_default
from information_schema.columns
where table_schema = 'sprk' and table_name = 'teacher';

-- metadata about views
select table_name, view_definition
from information_schema.views
where table_schema = 'sprk';

-- metadata about users and privileges
select user(); -- show current user
select user, host from MySQL.user; -- show all users
show grants for 'root'@'localhost'; -- show privileges of specific user

-- metadata about queries and performance
show processlist; -- show all active processes
select * from performance_schema.threads limit 5;