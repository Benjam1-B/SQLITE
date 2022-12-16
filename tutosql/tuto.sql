-- SQLite

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS recipes;

CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT
);

INSERT INTO categories (title) 
VALUES
    ("Plat"),
    ("Dessert");

CREATE TABLE recipes (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(50) NOT NULL UNIQUE,
    content TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL
);

INSERT INTO recipes (title, slug, category_id)
VALUES
    ("Creme anglaise", "creme-anglaise", 2),
    ("Soupe", "soupe", 1),
    ("Salade de fruit", "salade-de-fruit", 2);

-- DELETE FROM categories WHERE id = 2;

SELECT r.id, r.title, c.title AS category
FROM recipes r
JOIN categories c ON r.category_id = c.id
WHERE c.title = "Dessert";

/*CREATE TABLE recipes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(50) NOT NULL UNIQUE,
    content TEXT DEFAULT "Hello" NOT NULL,
    duration SMALLINT DEFAULT 10 NOT NULL,
    online BOOLEAN, 
    created_at DATETIME
);*/

-- DROP TABLE recipes;

-- CREATE UNIQUE INDEX idx_slug ON recipes (slug)

-- DROP INDEX idx_slug;

-- UPDATE recipes SET slug = "soupe2" WHERE id = 4;

/*INSERT INTO recipes(
    title,  
    slug, 
    content,
    duration, 
    online, 
    created_at
    ) VALUES (
        "Soupe1",
        "soupe-2",
        "contenu de test",
        10,
        FALSE,
        1670176728
    );*/

-- UPDATE recipes SET content = NULL

-- SELECT * FROM recipes WHERE content IS NULL

-- UPDATE recipes SET title = "Soupe de légume" WHERE title = "Soupe"

-- DELETE FROM recipes WHERE id = 6;

-- EXPLAIN QUERY PLAN SELECT * FROM recipes WHERE slug = "soupe";