-- Re/create DB
DROP DATABASE IF EXISTS notspotify;
CREATE DATABASE IF NOT EXISTS notspotify;
USE notspotify;

CREATE TABLE IF NOT EXISTS artist (
    artist_id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS song (
    song_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    duration INT NOT NULL,
    explicit BOOL NOT NULL DEFAULT FALSE,
    link VARCHAR(255) NOT NULL,
    PRIMARY KEY (song_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
);

CREATE TABLE IF NOT EXISTS genre (
    genre_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (genre_id)
);

-- Junction (song, genre)
CREATE TABLE IF NOT EXISTS song_genre (
    song_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (song_id, genre_id),
    FOREIGN KEY (song_id)
        REFERENCES song (song_id),
    FOREIGN KEY (genre_id)
        REFERENCES genre (genre_id)
);

CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id),
    UNIQUE (email)
);

-- Junction (user, song)
CREATE TABLE IF NOT EXISTS user_favorite_song (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id)
        REFERENCES user (user_id),
    FOREIGN KEY (song_id)
        REFERENCES song (song_id)
);

CREATE TABLE IF NOT EXISTS playlist (
    playlist_id INT AUTO_INCREMENT,
    user_id INT NOT NULL,
    PRIMARY KEY (playlist_id),
    FOREIGN KEY (user_id)
        REFERENCES user (user_id)
);

-- Junction (playlist, song)
CREATE TABLE IF NOT EXISTS playlist_song (
    playlist_id INT NOT NULL,
	song_index INT NOT NULL,
    song_id INT NOT NULL,
	PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id)
        REFERENCES playlist (playlist_id),
    FOREIGN KEY (song_id)
        REFERENCES song (song_id)
);
