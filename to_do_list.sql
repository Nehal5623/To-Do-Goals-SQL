DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS habits;
DROP TABLE IF EXISTS goals;
DROP TABLE IF EXISTS habits_log;


CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL,
  email VARCHAR NOT NULL UNIQUE,
  password VARCHAR,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  title VARCHAR,
  description TEXT,
  due_date DATE,
  status TEXT,
  priority TEXT,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE habits(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  name VARCHAR,
  frequency VARCHAR,
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE goals(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  title VARCHAR,
  description TEXT,
  target_date DATE,
  progress VARCHAR,
created_at TEXT DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE habits_log(
  id INTEGER PRIMARY KEY,
  habit_id INTEGER NOT NULL,
  log_date DATE,
  completed VARCHAR,
  FOREIGN KEY (habit_id) REFERENCES habits(id)
);


INSERT INTO users(name, email, password) 
             VALUES ("Nehal Sinha","nehal@example.com","hashed123");
INSERT INTO users(name, email, password) 
             VALUES ("Ayan Roy","ayan@example.com","pass456");


INSERT INTO tasks(user_id, title, description, due_date, status, priority) 
             VALUES (1,"Submit SQL Project","Final project due","2024-06-15","pending","high");
INSERT INTO tasks(user_id, title, description, due_date, status, priority) 
             VALUES (1,"Buy Groceries","Milk, eggs, cereal","2024-06-13","done","low");
INSERT INTO tasks(user_id, title, description, due_date, status, priority) 
             VALUES (2,"Morning Run","30 minute jog","2024-06-13","inprogress","medium");
        
INSERT INTO goals(user_id, title, description, target_date, progress) 
             VALUES (1,"Lose 5kgs in 2 months","Gym + clean diet","2024-08-01","30%");
INSERT INTO goals(user_id, title, description, target_date, progress) 
             VALUES (2,"Read 12 books","One per month challenge","2024-08-31","25%");
             
INSERT INTO habits(user_id, name, frequency, start_date, end_date) 
             VALUES (1,"Drink 3L water","daily","2024-06-01",NULL);        
INSERT INTO habits(user_id, name, frequency, start_date, end_date) 
             VALUES (1,"Sleep before 11 PM","daily","2024-06-01",NULL);
INSERT INTO habits(user_id, name, frequency, start_date, end_date) 
             VALUES (2,"Read 10 pages","daily","2024-05-01",NULL);             
             
INSERT INTO habits_log(habit_id, log_date, completed) 
             VALUES (1, "2024-06-10", "TRUE");
INSERT INTO habits_log(habit_id, log_date, completed) 
             VALUES (1, "2024-06-11", "TRUE");
INSERT INTO habits_log(habit_id, log_date, completed) 
             VALUES (2, "2024-06-10", "FALSE");
INSERT INTO habits_log(habit_id, log_date, completed) 
             VALUES (3, "2024-06-11", "TRUE");
INSERT INTO habits_log(habit_id, log_date, completed) 
             VALUES (3, "2024-06-12", "TRUE");