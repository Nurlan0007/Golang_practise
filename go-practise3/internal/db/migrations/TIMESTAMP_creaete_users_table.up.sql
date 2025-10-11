CREATE TABLE IF NOT EXISTS users (
    [cite_start]id SERIAL PRIMARY KEY, -- [cite: 23]
    [cite_start]email TEXT NOT NULL UNIQUE, -- [cite: 24, 28]
    [cite_start]name TEXT NOT NULL, -- [cite: 25, 29]
    [cite_start]created_at TIMESTAMPTZ NOT NULL DEFAULT NOW() -- [cite: 26]
);