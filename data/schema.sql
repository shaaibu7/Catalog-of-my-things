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
