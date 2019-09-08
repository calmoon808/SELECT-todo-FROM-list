DROP TABLE IF EXISTS new_tasks;
DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY NOT NULL, 
    title VARCHAR(255) NOT NULL, 
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT now(), 
    update_at TIMESTAMP, 
    completed BOOLEAN NOT NULL DEFAULT 'false'
);
ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD completed_at TIMESTAMP DEFAULT NULL;
ALTER TABLE tasks ALTER COLUMN update_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN update_at SET DEFAULT now();

INSERT INTO tasks (title, description)
VALUES ('poop', 'i like poop');

INSERT INTO tasks (title, description)
VALUES ('Study SQL', 'Complete this exerciese');

INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title FROM tasks WHERE completed_at is NULL;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at is NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC;