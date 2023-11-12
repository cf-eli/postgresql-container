DROP TABLE IF EXISTS spotify_artist;
CREATE TABLE IF NOT EXISTS spotify_artist (
    artist_id VARCHAR(255) PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    genres VARCHAR(255) [],
    artist_images VARCHAR(255) [] NOT NULL
);
DROP TABLE IF EXISTS spotify_track;
CREATE TABLE IF NOT EXISTS spotify_track (
    track_id VARCHAR(255) PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    track_duration_ms INT NOT NULL,
    track_number INT NOT NULL
);
DROP TABLE IF EXISTS spotify_track_artists;
CREATE TABLE IF NOT EXISTS spotify_track_artists (
    track_id VARCHAR(255),
    artist_id VARCHAR(255),
    FOREIGN KEY (track_id) REFERENCES spotify_track(track_id),
    FOREIGN KEY (artist_id) REFERENCES spotify_artist(artist_id)
);
DROP TABLE IF EXISTS spotify_album;
CREATE TABLE IF NOT EXISTS spotify_album (
    album_id VARCHAR(255) PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    album_type VARCHAR(255) NOT NULL,
    album_release_date TIMESTAMP,
    album_release_date_precision VARCHAR(255),
    album_total_tracks INT NOT NULL,
    album_images VARCHAR(255) []
);
DROP TABLE IF EXISTS spotify_album_tracks;
CREATE TABLE IF NOT EXISTS spotify_album_tracks (
    album_id VARCHAR(255),
    track_id VARCHAR(255),
    FOREIGN KEY (album_id) REFERENCES spotify_album(album_id),
    FOREIGN KEY (track_id) REFERENCES spotify_track(track_id)
);
DROP TABLE IF EXISTS spotify_user;
CREATE TABLE IF NOT EXISTS spotify_user (
    username VARCHAR(255) PRIMARY KEY,
    display_name VARCHAR(255) NOT NULL,
    user_images VARCHAR(255)
);
DROP TABLE IF EXISTS spotify_config;
CREATE TABLE IF NOT EXISTS spotify_config (
    -- store what being left off every 30 seconds for next time
    data_id VARCHAR(255) PRIMARY KEY,
    -- "name of what being stored"
    context VARCHAR(255) NOT NULL -- "data being stored"
);
DROP TABLE IF EXISTS spotify_history;
CREATE TABLE IF NOT EXISTS spotify_history (
    -- USERNAME@TRACK_TIMESTAMP
    history_id VARCHAR(255) PRIMARY KEY,
    track_timestamp TIMESTAMP NOT NULL,
    username VARCHAR(255) NOT NULL,
    platform VARCHAR(255) NOT NULL,
    ms_played INT NOT NULL,
    country_code VARCHAR(255),
    ip_address VARCHAR(255),
    user_agent VARCHAR(255),
    track_id VARCHAR(255),
    reason_start VARCHAR(255),
    reason_end VARCHAR(255),
    shuffle BOOLEAN,
    skipped BOOLEAN,
    track_offline BOOLEAN,
    offline_timestamp TIMESTAMP,
    incognito_mode BOOLEAN,
    FOREIGN KEY (track_id) REFERENCES spotify_track(track_id),
    FOREIGN KEY (username) REFERENCES spotify_user(username)
);