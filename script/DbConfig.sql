-- Users Table

CREATE TABLE UserStatus (
StatusId int AUTO_INCREMENT PRIMARY KEY,
StatusName VARCHAR(100)
)ENGINE=InnoDB;
INSERT INTO UserStatus (StatusName) VALUES("Active");
INSERT INTO UserStatus (StatusName) VALUES("Deleted");

-- User Roles Table
CREATE TABLE User_Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
INSERT INTO Categories (Name, Description) VALUES ("Food", "Food Category"), ("Music", "Music Category"), ("Games", "Games Category"), ("Movies", "Movies Category"), ("Sports", "Sports Category"), ("Tech", "Tech Category");
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserAlias VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    FirstName VARCHAR(50),
    Surname VARCHAR(50),
    Phone VARCHAR(50),
    PasswordHash VARCHAR(255),
    StatusId int DEFAULT 1,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    RoleID INT DEFAULT 3,
    FOREIGN KEY (RoleID) REFERENCES User_Roles(RoleID),
    FOREIGN KEY(StatusId) references UserStatus(StatusId)
) ENGINE=InnoDB;

-- Tags Table
CREATE TABLE Tags (
    TagID INT AUTO_INCREMENT PRIMARY KEY,
    TagName VARCHAR(50) NOT NULL UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE PostStatus (
    StatusId int AUTO_INCREMENT PRIMARY KEY,
    StatusName VARCHAR(100)
)ENGINE=InnoDB;

-- Posts Table
CREATE TABLE Posts (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    ParentPostID INT DEFAULT NULL,
    UserID INT NOT NULL,
    CategoryID INT DEFAULT NULL,
    Title VARCHAR(255) DEFAULT "",
    Content TEXT NOT NULL,
    StatusId int DEFAULT 1,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    IsTopic BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (ParentPostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE SET NULL,
    FOREIGN KEY (StatusId) REFERENCES PostStatus(StatusId)
) ENGINE=InnoDB;

-- Post Tags (Many-to-Many Relationship)
CREATE TABLE Post_Tags (
    PostID INT NOT NULL,
    TagID INT NOT NULL,
    PRIMARY KEY (PostID, TagID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID) ON DELETE CASCADE,
    FOREIGN KEY (TagID) REFERENCES Tags(TagID) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Insert Default Roles
INSERT INTO User_Roles (RoleName) VALUES ('Admin'), ('Moderator'), ('User');
INSERT INTO PostStatus (StatusName) VALUES("Unresolved");
INSERT INTO PostStatus (StatusName) VALUES("Resolved");

