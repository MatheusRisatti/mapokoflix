CREATE DATABASE IF NOT EXISTS MapokoFlixDb;

USE MapokoFlixDb;

CREATE TABLE IF NOT EXISTS Genre (
    Id              TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name            VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Movie (
    Id              INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    OriginalTitle   VARCHAR(100) NOT NULL,
    Title           VARCHAR(100) NOT NULL,
    Synopsis        TEXT,
    MovieYear       YEAR,
    Duration        SMALLINT(3) UNSIGNED,
    AgeRating       TINYINT UNSIGNED,
    Image           VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS ApplicationUser (
    Id              INT UNSIGNED NOT NULL,
    Name            VARCHAR(100) NOT NULL,
    UserName        VARCHAR(20) NOT NULL UNIQUE,
    PasswordHash    VARCHAR(200) NOT NULL,
    SecurityStamp   VARCHAR(200) NOT NULL,
    Email           VARCHAR(100) NOT NULL UNIQUE,
    BirthOfDate     DATETIME NOT NULL,
    ProfilePicture  VARCHAR(200),
    IsAdmin         BOOL DEFAULT FALSE,
    PRIMARY KEY(Id)
);

CREATE TABLE IF NOT EXISTS MovieGenre (
    MovieId         INT     UNSIGNED NOT NULL,
    GenreId         TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (MovieId, GenreId),
    CONSTRAINT FK_MovieGenre_Movie FOREIGN KEY (MovieId) REFERENCES Movie(Id),
    CONSTRAINT FK_MovieGenre_Genre FOREIGN KEY (GenreId) REFERENCES Genre(Id)
);

CREATE TABLE IF NOT EXISTS MovieComments (
    Id              INT UNSIGNED NOT NULL,
    MovieId         INT UNSIGNED NOT NULL,
    UserId          INT UNSIGNED NOT NULL,
    CommentText     TEXT NOT NULL,
    CommentDate     DATETIME,
    PRIMARY KEY (MovieId, UserId),
    CONSTRAINT FK_Movie_Comment FOREIGN KEY (MovieId) REFERENCES Movie(Id),
    CONSTRAINT FK_User_Comment FOREIGN KEY (UserId) REFERENCES ApplicationUser(Id)
);

CREATE TABLE IF NOT EXISTS MovieRating (
    MovieId         INT UNSIGNED NOT NULL,
    UserId          INT UNSIGNED NOT NULL,
    RatingValue     TINYINT UNSIGNED NOT NULL,
    RatingDate      DATETIME,
    PRIMARY KEY (MovieId, UserId),
    CONSTRAINT FK_Movie_Rating FOREIGN KEY (MovieId) REFERENCES Movie(Id),
    CONSTRAINT FK_User_Rating FOREIGN KEY (UserId) REFERENCES ApplicationUser(Id)
);

