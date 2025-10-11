CREATE TABLE IF NOT EXISTS categories (
    [cite_start]id SERIAL PRIMARY KEY, -- [cite: 32]
    [cite_start]name TEXT NOT NULL, -- [cite: 33]
    [cite_start]user_id INTEGER REFERENCES users(id), -- [cite: 34, 37]
    [cite_start]CONSTRAINT uq_user_category UNIQUE (user_id, name) -- [cite: 38, 39]
);

CREATE INDEX IF NOT EXISTS idx_categories_user_id ON categories(user_id); [cite_start]-- [cite: 41]