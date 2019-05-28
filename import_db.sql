
PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY
  fname VARCHAR
  lname VARCHAR
)

CREATE TABLE questions
(
  id INTEGER PRIMARY KEY
  title VARCHAR
  body VARCHAR

  
FOREIGN KEY
(users_id) REFERENCES users(id)
)

CREATE TABL question_follows (
  users_id INTEGER
  questions_id INTEGER
)E

CREATE TABLE replies (
  question VARCHAR
  parent_reply VARCHAR
  users_id INTEGER
  body VARCHAR
  Top_level BOOLEAN

)

CREATE TABLE question_likes
(
  users_id INTEGER
  questions_id INTEGER
)

INSERT INTO 
  users (fname, lname)
VALUES
  ('KEVIN', 'CHOU'),
  ('JEREMY', 'ROSENBERG');

  INSERT INTO
    questions (title, body, users_id)
  VALUES
    ('Posion', 'What is the difference between venom and poison?', (SELECT id FROM users WHERE fname = 'JEREMY'))
    ('Love', 'What is love? (baby don''t hurt me)', (Select id from users where fname = 'KEVIN'))
