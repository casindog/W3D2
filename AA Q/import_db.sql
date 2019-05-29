DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT,
  lname TEXT
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INTEGER,
  question_id INTEGER,

FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  question TEXT,
  parent_reply TEXT,
  user_id INTEGER,
  body TEXT,
  Top_level BOOLEAN,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
  users (fname, lname)
VALUES
  ('KEVIN', 'CHOU'),
  ('JEREMY', 'ROSENBERG');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Posion', 'What is the difference between venom and poison?', (SELECT id FROM users WHERE fname = 'JEREMY')),
  ('Love', 'What is love? (baby don''t hurt me)', (Select id from users where fname = 'KEVIN'));