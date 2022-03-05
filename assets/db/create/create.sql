CREATE TABLE IF NOT EXISTS notes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    firstName TEXT,
    lastName TEXT,
    picture TEXT,
    thumbnail TEXT,
    gender TEXT,
    latitude REAL,
    longitude REAL
);

CREATE TABLE IF NOT EXISTS photos(
    id String PRIMARY KEY,
    image TEXT,
    thumbnail TEXT,
    noteId TEXT
);