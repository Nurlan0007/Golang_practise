CREATE TABLE IF NOT EXISTS expenses (
    [cite_start]id SERIAL PRIMARY KEY, -- [cite: 44]
    [cite_start]user_id INTEGER NOT NULL REFERENCES users(id), -- [cite: 45, 46, 59, 62]
    [cite_start]category_id INTEGER NOT NULL REFERENCES categories(id), -- [cite: 47, 48, 60, 63]
    [cite_start]amount NUMERIC NOT NULL CHECK(amount > 0), -- [cite: 49, 50, 61, 64]
    [cite_start]currency TEXT NOT NULL, -- [cite: 51, 52]
    [cite_start]spent_at TIMESTAMPTZ NOT NULL, -- [cite: 53, 54]
    [cite_start]note TEXT, -- [cite: 57]
    [cite_start]created_at TIMESTAMPTZ NOT NULL DEFAULT NOW() -- [cite: 55, 56]
);

CREATE INDEX IF NOT EXISTS idx_expenses_user_id ON expenses(user_id); [cite_start]-- [cite: 66]
CREATE INDEX IF NOT EXISTS idx_expenses_user_id_spent_at ON expenses(user_id, spent_at); [cite_start]-- [cite: 67]