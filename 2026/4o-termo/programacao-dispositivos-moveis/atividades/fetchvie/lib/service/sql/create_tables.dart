const String createWorkScript = '''
CREATE TABLE works (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  type VARCHAR(5) NOT NULL,
  poster_path TEXT NOT NULL,
  release_date DATETIME NOT NULL,
  overview TEXT NOT NULL,
  rating FLOAT NOT NULL
);
''';

const String createUserScript = '''
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username VARCHAR(100),
  pfp_path TEXT,
  is_adult BOOLEAN DEFAULT FALSE
);
''';

const String createUserFavoritesScript = '''
CREATE TABLE user_favorites (
  user_id INTEGER REFERENCES users(id),
  work_id INTEGER REFERENCES works(id),
  favorited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, work_id)
);
''';
