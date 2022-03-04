CREATE TABLE IF NOT EXISTS notes(
    id String PRIMARY KEY AUTOINCREMENT,
    firstName TEXT,
    lastName TEXT,
    picture TEXT,
    thumbnail TEXT,
    gender TEXT,
    latitude INTEGER,
    longitude INTEGER,
);

CREATE TABLE IF NOT EXISTS photos(
    id String PRIMARY KEY,
    image TEXT,
    thumbnail TEXT,
    noteId TEXT,
);