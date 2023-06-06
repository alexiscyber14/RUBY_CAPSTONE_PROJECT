CREATE TABLE label (
    id INT,
    title VARCHAR(150),
    color VARCHAR(50),
    PRIMARY KEY (id),
)

CREATE TABLE book (
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE,
    publisher VARCHAR(120),
    cover_state VARCHAR(50),
    archived BOOLEAN,
    label_id INT, 
    PRIMARY KEY (id), 
    CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES label(id)
) 

CREATE INDEX idx_book_label_id ON book (label_id);

CREATE TABLE Genre(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
)

CREATE TABLE MusicAlbum (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(150) NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    genre_id VARCHAR(150),
    PRIMARY KEY (id)
    CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES Genre(id)
)

CREATE INDEX album_genre_id ON MusicAlbum (genre_id);