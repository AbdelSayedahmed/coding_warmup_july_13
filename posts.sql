-- To run this file, use the following command:
-- psql -f posts.sql

DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;
DROP DATABASE IF EXISTS blog;
CREATE DATABASE blog;

\c blog

-- Create users table first
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
('Name 1', 'email1@example.com', 'Password1'), 
('Name 2', 'email2@example.com', 'Password2'), 
('Name 3', 'email3@example.com', 'Password3'), 
('Name 4', 'email4@example.com', 'Password4'), 
('Name 5', 'email5@example.com', 'Password5');

-- Create posts table
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INTEGER,
    username VARCHAR(255),
    CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Insert 5 posts into posts table
INSERT INTO posts (title, body, username, user_id) VALUES
('Post 1 Title', 'This is the body of post 1.', 'user1', 1),
('Post 2 Title', 'This is the body of post 2.', 'user2', 2),
('Post 3 Title', 'This is the body of post 3.', 'user3', 3),
('Post 4 Title', 'This is the body of post 4.', 'user4', 4),
('Post 5 Title', 'This is the body of post 5.', 'user5', 5);

-- Delete a post with id of 1
DELETE FROM posts WHERE id = 1;

-- Update the post with id of 2 to have the title "New Title"
UPDATE posts SET title = 'New Title' WHERE id = 2;

-- Insert a new post into the posts table
INSERT INTO posts (title, body, username, user_id) VALUES
('Sample Post', 'This is the content of the sample post', 'user1', 1);
