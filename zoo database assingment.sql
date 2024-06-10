-- Create the database
CREATE DATABASE MovieDatabase;
GO

-- Use the new database
USE MovieDatabase;
GO

-- Create the actors table
CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    Actor_Name VARCHAR(100),
    Movie_Name VARCHAR(100)
);

-- Create the directors table
CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY,
    Director_Name VARCHAR(100),
    Movie_Name VARCHAR(100),
    ActorID INT FOREIGN KEY REFERENCES Actors(ActorID)
);

-- Insert values into Actors table
INSERT INTO Actors (ActorID, Actor_Name, Movie_Name) VALUES (1, 'Clark Gable', 'Gone with the Wind');
INSERT INTO Actors (ActorID, Actor_Name, Movie_Name) VALUES (2, 'Vivien Leigh', 'Gone with the Wind');
INSERT INTO Actors (ActorID, Actor_Name, Movie_Name) VALUES (3, 'Humphrey Bogart', 'Casablanca');
INSERT INTO Actors (ActorID, Actor_Name, Movie_Name) VALUES (4, 'Ingrid Bergman', 'Casablanca');
INSERT INTO Actors (ActorID, Actor_Name, Movie_Name) VALUES (5, 'Marlon Brando', 'The Godfather');

-- Insert values into Directors table
INSERT INTO Directors (DirectorID, Director_Name, Movie_Name, ActorID) VALUES (1, 'Victor Fleming', 'Gone with the Wind', 1);
INSERT INTO Directors (DirectorID, Director_Name, Movie_Name, ActorID) VALUES (2, 'Michael Curtiz', 'Casablanca', 3);
INSERT INTO Directors (DirectorID, Director_Name, Movie_Name, ActorID) VALUES (3, 'Francis Ford Coppola', 'The Godfather', 5);
INSERT INTO Directors (DirectorID, Director_Name, Movie_Name, ActorID) VALUES (4, 'George Cukor', 'My Fair Lady', 2);
INSERT INTO Directors (DirectorID, Director_Name, Movie_Name, ActorID) VALUES (5, 'John Huston', 'The Maltese Falcon', 3);

-- Query to join the actors and directors tables
SELECT a.Actor_Name, a.Movie_Name, d.Director_Name
FROM Actors a
JOIN Directors d ON a.ActorID = d.ActorID
WHERE a.Movie_Name = d.Movie_Name;