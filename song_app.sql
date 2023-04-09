DROP DATABASE IF EXISTS song_app;
CREATE DATABASE song_app;
USE song_app;

CREATE TABLE artists (
  artist_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  PRIMARY KEY (artist_id)
);

CREATE TABLE genres (
  genre_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (genre_id)
);

CREATE TABLE songs (
  song_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  artist_id INT NOT NULL,
  duration INT,
  is_explicit BOOLEAN,
  link VARCHAR(255),
  PRIMARY KEY (song_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE user_favorite_songs (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE playlists (
  playlist_id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (playlist_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE playlist_songs (
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  song_rank INT NOT NULL,
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE song_genres (
  song_id INT NOT NULL,
  genre_id INT NOT NULL,
  PRIMARY KEY (song_id, genre_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
