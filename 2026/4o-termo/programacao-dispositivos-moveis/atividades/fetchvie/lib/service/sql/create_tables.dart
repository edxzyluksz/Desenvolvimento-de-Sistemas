const String createWorkScript = 
'''
CREATE TABLE works (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    poster_path TEXT NOT NULL,
    overview TEXT,
    rating FLOAT DEFAULT 0.0
);
''';

const String createUserScript =
'''
CREATE TABLE users (
  uid INTEGER PRIMARY KEY AUTOINCREMENT,
  username VARCHAR(100),
  pfp_path TEXT
  is_adult BOOLEAN DEFAULT FALSE
);
''';