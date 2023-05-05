-- schema for book

CREATE TABLE authors(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  PRIMARY KEY(id);
);

CREATE TABLE genre(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL
  PRIMARY KEY(id);
);

CREATE TABLE label(
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(250) NOT NULL,
  color VARCHAR(250) NOT NULL,
  PRIMARY KEY(id);
);

CREATE TABLE source(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL,
  PRIMARY KEY(id);
);

CREATE TABLE book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(250) NOT NULL,
  cover_state VARCHAR(250) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genre(id),
  label_id INT REFERENCES label(id),
  source_id INT REFERENCES source(id)
);

-- database schema for game and author class

CREATE TABLE game(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genre(id),
  label_id INT REFERENCES label(id),
  source_id INT REFERENCES source(id)
)


