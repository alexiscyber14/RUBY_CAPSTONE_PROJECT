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

CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
);

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(150),
  multiplayer BOOLEAN,
  last_played_at DATE,
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE INDEX idx_games_author_id ON games (author_id);
