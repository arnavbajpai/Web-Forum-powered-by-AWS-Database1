INSERT INTO Users (UserAlias, Email, FirstName, Surname, Phone, PasswordHash) 
	VALUES ("johndoe", "johndoe@example.com", "John", "Doe", "1234567890", "hashed_password_123");
INSERT INTO Users (UserAlias, Email, FirstName , Surname) VALUES ("tommy12235","tommy12235@gmail.com" , "tommy", "miller" );
INSERT INTO Users (UserAlias, Email, FirstName, Surname) 
VALUES 
  ("alice101", "alice101@example.com", "Alice", "Smith"),
  ("bob202", "bob202@example.com", "Bob", "Johnson"),
  ("charlie303", "charlie303@example.com", "Charlie", "Brown");
-- Query to view the inserted users
SELECT * FROM Users;

INSERT INTO Posts (UserID, CategoryID, Title, Content, IsTopic)
VALUES (1, 3, "Introduction to Sports", "This is a post discussing different sports activities.", TRUE),
       (3, 3, "Sports in the 21st Century", "A deep dive into how sports have evolved in the modern world.", TRUE);
INSERT INTO Posts (ParentPostID, UserID, CategoryID, Content)
VALUES (1, 2, 4, "This is a comment under a post.");

-- Query to view the inserted posts
SELECT * FROM Posts;

-- Inserting tags into Tags table (only specifying required fields)
INSERT INTO Tags (TagName)
VALUES ("Electric Cars"), ("Tennis"), ("Recipies");
-- Query to view the inserted tags
SELECT * FROM Tags;