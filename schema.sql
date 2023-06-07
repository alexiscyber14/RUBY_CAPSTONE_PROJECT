CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  published_date DATE,
  archived BOOLEAN
);

CREATE TABLE label (
  id INT PRIMARY KEY,
  title VARCHAR(150),
  color VARCHAR(50)
);

CREATE TABLE book (
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(120),
  cover_state VARCHAR(50),
  archived BOOLEAN,
  label_id INT,
  CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE INDEX idx_book_label_id ON book (label_id);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL PRIMARY KEY,
  title VARCHAR(150),
  multiplayer BOOLEAN,
  last_played_at DATE,
  author_id INT,
  CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE INDEX idx_games_author_id ON games (author_id);

CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL
);

CREATE TABLE music_album (
  id SERIAL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  publish_date DATE NOT NULL,
  genre_id INT,
  CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE INDEX idx_music_album_genre_id ON music_album (genre_id);

CREATE TABLE associations (
  id SERIAL PRIMARY KEY,
  item_id INT,
  associated_item_id INT,
  CONSTRAINT fk_item_id FOREIGN KEY (item_id) REFERENCES items(id),
  CONSTRAINT fk_associated_item_id FOREIGN KEY (associated_item_id) REFERENCES items(id)
);

CREATE INDEX idx_associations_item_id ON associations (item_id);
CREATE INDEX idx_associations_associated_item_id ON associations (associated_item_id);
