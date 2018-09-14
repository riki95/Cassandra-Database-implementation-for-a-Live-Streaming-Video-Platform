DROP KEYSPACE project;

CREATE KEYSPACE project WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

USE project;

CREATE TABLE user (
    username text PRIMARY KEY,
    name text,
    surname text,
    email text,
    password text,
    status text,
    streaming set<bigint>,
    clip set<bigint>,
    following set<text>,
    followed set<text>
);

CREATE TABLE streaming (
    streamingId bigint PRIMARY KEY,
    startingtime timestamp,
    endingtime timestamp,
    title text,
    maxView bigint,
    maxViewTime time,
    user text,
    clip set<bigint>,
    game text,
    finished boolean,
    currentViews bigint
);

CREATE TABLE clip (
    clipId bigint PRIMARY KEY,
    title text,
    startingtime time,
    endingtime time,
    streaming bigint,
    user text
);

CREATE TABLE game (
    title text PRIMARY KEY,
    genre text,
    viewers bigint,
    user set<text>,
    streaming set<bigint>,
);

CREATE TABLE streamLine (
    streamingId bigint,
    currentTime time,
    viewers bigint,
    PRIMARY KEY (streamingId, currentTime)
);

CREATE INDEX finished ON streaming(finished);
CREATE INDEX status ON user(status);
CREATE INDEX game ON streaming(game);








