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
