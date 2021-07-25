-- re('INSERT INTO user (name, salt, password, display_name, avatar_icon, created_at) VALUES (?, ?, ?, ?, ?, NOW())')
-- row = db.query('SELECT LAST_INSERT_ID() AS last_insert_id').first

-- 'SELECT * FROM user WHERE name = ?'
-- SELECT name, display_name, avatar_icon FROM user WHERE id = ?
-- DELETE FROM user WHERE id > 1000
CREATE TABLE user (
  id INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(191) UNIQUE,
  salt VARCHAR(20),
  password VARCHAR(40),
  display_name TEXT,
  avatar_icon TEXT,
  created_at DATETIME NOT NULL
) Engine=InnoDB DEFAULT CHARSET=utf8mb4;

-- 'SELECT id FROM channel'
-- SELECT * FROM channel ORDER BY id
-- INSERT INTO channel (name, description, updated_at, created_at) VALUES (?, ?, NOW(), NOW())'
-- DELETE FROM channel WHERE id > 10
CREATE TABLE channel (
  id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  description MEDIUMTEXT,
  updated_at DATETIME NOT NULL,
  created_at DATETIME NOT NULL
) Engine=InnoDB DEFAULT CHARSET=utf8mb4;

-- db.prepare('INSERT INTO message (channel_id, user_id, content, created_at) VALUES (?, ?, ?, NOW())')
-- db.prepare('SELECT * FROM message WHERE id > ? AND channel_id = ? ORDER BY id DESC LIMIT 100')
-- db.prepare('SELECT name, display_name, avatar_icon FROM user WHERE id = ?')

-- 'SELECT * FROM message WHERE channel_id = ? ORDER BY id DESC LIMIT ? OFFSET ?'
CREATE TABLE message (
  id INTEGER AUTO_INCREMENT NOT NULL PRIMARY KEY,
  channel_id INTEGER,
  user_id INTEGER,
  content TEXT,
  created_at DATETIME NOT NULL
) Engine=InnoDB DEFAULT CHARSET=utf8mb4;

-- 'INSERT INTO haveread (user_id, channel_id, message_id, updated_at, created_at) ',
--     'VALUES (?, ?, ?, NOW(), NOW()) ',
--     'ON DUPLICATE KEY UPDATE message_id = ?, updated_at = NOW()',

-- db.prepare('SELECT * FROM haveread WHERE user_id = ? AND channel_id = ?')
CREATE TABLE haveread (
  user_id INTEGER NOT NULL,
  channel_id INTEGER NOT NULL,
  message_id INTEGER,
  updated_at DATETIME NOT NULL,
  created_at DATETIME NOT NULL,
  PRIMARY KEY(user_id, channel_id)
) Engine=InnoDB DEFAULT CHARSET=utf8mb4;
