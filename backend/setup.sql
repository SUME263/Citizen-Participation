CREATE Database citizendb;
use citizendb;

create table Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    email varchar(100) UNIQUE NOT NULL,
    password_hash varchar(50) NOT NULL, 
    role enum('citizen', 'offical', 'admin') DEFAULT 'citizen',
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Feedback (
    suggestion_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    upvotes INT DEFAULT 0,
    downvotes INT DEFAULT 0,
    status ENUM('open', 'closed', 'under review') DEFAULT 'open',
    FOREIGN KEY (user_id) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    suggestion_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (suggestion_id) REFERENCES Feedback(suggestion_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- CREATE TABLE Polls (
--     poll_id INT PRIMARY KEY AUTO_INCREMENT,
--     title VARCHAR(255) NOT NULL,
--     description TEXT NOT NULL,
--     creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     closing_date TIMESTAMP NOT NULL,
--     created_by INT NOT NULL,
--     FOREIGN KEY (created_by) REFERENCES Users(UserID) ON DELETE SET NULL
-- );

CREATE TABLE Polls (
    poll_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    closing_date TIMESTAMP NOT NULL,
    created_by INT,
    FOREIGN KEY (created_by) REFERENCES Users(UserID) ON DELETE SET NULL
) ENGINE=InnoDB;


CREATE TABLE Votes (
    vote_id INT PRIMARY KEY AUTO_INCREMENT,
    poll_id INT NOT NULL,
    user_id INT NOT NULL,
    vote_option ENUM('Yes', 'No', 'Other') NOT NULL,
    vote_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (poll_id) REFERENCES Polls(poll_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('in progress', 'completed', 'delayed') DEFAULT 'in progress',
    created_by INT NOT NULL,
    FOREIGN KEY (created_by) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE PublicIssues (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    issue_title VARCHAR(255) NOT NULL,
    issue_description TEXT NOT NULL,
    report_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('open', 'resolved', 'under investigation') DEFAULT 'open',
    FOREIGN KEY (user_id) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE TownHallMeetings (
    meeting_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    meeting_date TIMESTAMP NOT NULL,
    description TEXT NOT NULL,
    location_url VARCHAR(2083) NOT NULL,
    created_by INT NOT NULL,
    FOREIGN KEY (created_by) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    notification_message TEXT NOT NULL,
    sent_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(UserID) ON DELETE CASCADE
);

