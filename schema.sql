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