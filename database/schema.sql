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

create table item(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	publish_date DATE,
    archived BOOLEAN,
	FOREIGN Key(genre_id) REFERENCES genre(id),
	FOREIGN Key(author_id) REFERENCES author(id),
	FOREIGN Key(label_id) REFERENCES label(id),
    PRIMARY KEY(id)
);

-- index --
CREATE INDEX idx_genre_id ON item (genre_id)

create table music_album(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
	genre_id INT,
	author_id INT,
	label_id INT,
	on_spotify BOOLEAN,
	FOREIGN Key(genre_id) REFERENCES genre(id),
	FOREIGN Key(author_id) REFERENCES author(id),
	FOREIGN Key(label_id) REFERENCES label(id),
    PRIMARY KEY(id)
);

CREATE INDEX idx_genre_id ON music_album (genre_id)
CREATE INDEX idx_author_id ON music_album (author_id)
CREATE INDEX idx_label_id ON music_album (label_id)

create table genre(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    items TEXT[],
    PRIMARY KEY(id)
);


-- create index for better performance
CREATE INDEX author_id_idx ON game (author_id);
CREATE INDEX genre_id_idx ON game (genre_id);
CREATE INDEX label_id_idx ON game (label_id);
CREATE INDEX source_id_idx ON game (source_id);


CREATE INDEX author_id_idx ON book (author_id);
CREATE INDEX genre_id_idx ON book (genre_id);
CREATE INDEX label_id_idx ON book (label_id);
CREATE INDEX source_id_idx ON book (source_id);



