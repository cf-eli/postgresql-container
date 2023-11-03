DROP TABLE IF EXISTS artists;
CREATE TABLE IF NOT EXISTS artists (
    id VARCHAR(255) PRIMARY KEY, --SPOTIFY_ARTIST_URI
    artist_name VARCHAR(255) NOT NULL,
    genres VARCHAR(255),
    image_url VARCHAR(255) NOT NULL
    );


DROP TABLE IF EXISTS track;
CREATE TABLE IF NOT EXISTS track (
    id VARCHAR(255) PRIMARY KEY, --SPOTIFY_TRACK_URI
    track_name VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    release_date TIMESTAMP,
    release_date_precision VARCHAR(255)
    );

DROP TABLE IF EXISTS spotify_history;
CREATE TABLE IF NOT EXISTS spotify_history (
    id VARCHAR(255) PRIMARY KEY, -- USERNAME@TRACK_TIMESTAMP
    track_timestamp TIMESTAMP NOT NULL,
    username VARCHAR(255) NOT NULL,
    platform VARCHAR(255) NOT NULL,
    ms_played INT NOT NULL,
    country_code VARCHAR(255),
    ip_address VARCHAR(255),
    user_agent VARCHAR(255),
    track_name VARCHAR(255),
    album_artist_name VARCHAR(255),
    album_name VARCHAR(255),
    spotify_track_uri VARCHAR(255),
    reason_start VARCHAR(255),
    reason_end VARCHAR(255),
    shuffle BOOLEAN,
    skipped BOOLEAN,
    track_offline BOOLEAN,
    offline_timestamp TIMESTAMP,
    incognito_mode BOOLEAN,
    FOREIGN KEY (spotify_track_uri) REFERENCES track(id)
    );


DROP TABLE IF EXISTS track_artists;
CREATE TABLE IF NOT EXISTS track_artists (
    track_id VARCHAR(255),
    artist_id VARCHAR(255),
    feature BOOLEAN NOT NULL,
    FOREIGN KEY (track_id) REFERENCES track(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

DROP TABLE IF EXISTS spotify_data;
CREATE TABLE IF NOT EXISTS spotify_data ( -- store what being left off every 30 seconds for next time
    id VARCHAR(255) PRIMARY KEY, -- "name of what being stored"
    id_data VARCHAR(255) NOT NULL -- "data being stored"
)
