-- To run this file, use the following command:
-- psql -f posts.sql

DROP TABLE IF EXISTS posts;
DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;

\c blog


-- Create posts table
-- id SERIAL PRIMARY KEY,
-- title VARCHAR(255),
-- body TEXT,
-- created_at TIMESTAMP,
-- updated_at TIMESTAMP
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Alter posts table to include user name
ALTER TABLE posts
CREATE COLUMN username VARCHAR(255)


-- Insert 5 posts into posts table
INSERT INTO posts (title, body, username) VALUES
('Post 1 Title', 'This is the body of post 1.', 'user1'),
('Post 2 Title', 'This is the body of post 2.', 'user2'),
('Post 3 Title', 'This is the body of post 3.', 'user3'),
('Post 4 Title', 'This is the body of post 4.', 'user4'),
('Post 5 Title', 'This is the body of post 5.', 'user5');

-- Delete a post with id of 1
DELETE FROM posts WHERE id = 1;


-- Update the post with id of 2 to have the title "New Title"
UPDATE posts SET title = 'New Title' WHERE id = 2;


-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password_digest VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert 5 users into users table
INSERT INTO users (name, email, password_digest) VALUES
('Name 1', 'Email 1', 'Password1'), 
('Name 2', 'Email 2', 'Password2'), 
('Name 3', 'Email 3', 'Password3'), 
('Name 4', 'Email 4', 'Password4'), 
('Name 5', 'Email 5', 'Password5');

-- Update the posts table to include a foreign key for the user who created the post
ALTER TABLE posts ADD COLUMN user_id INTEGER;

ALTER TABLE posts
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES users(id);

-- Insert a new post into the posts table
INSERT INTO posts (title, content, user_id) VALUES
('Sample Post', 'This is the content of the sample post', 1);
