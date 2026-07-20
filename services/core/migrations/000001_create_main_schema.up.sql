CREATE TABLE users (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    login text UNIQUE NOT NULL CHECK (char_length(login) > 3),
    email text UNIQUE CHECK (char_length(email) > 3),
    phone text UNIQUE CHECK (char_length(phone) > 5),
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE folders (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    parent_folder_id uuid REFERENCES folders(id) ON DELETE CASCADE,
    user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title text NOT NULL DEFAULT 'Untitled',
    public boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz,
    CHECK (parent_folder_id <> id)
);

CREATE TABLE notes (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title text NOT NULL DEFAULT 'Untitled',
    body text,
    user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    folder_id uuid REFERENCES folders(id) ON DELETE CASCADE,
    favorite boolean NOT NULL DEFAULT false,
    public boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz
);

CREATE TABLE files (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    title text NOT NULL,
    path text NOT NULL UNIQUE,
    extension text,
    size bigint,
    note_id uuid REFERENCES notes(id) ON DELETE SET NULL,
    folder_id uuid REFERENCES folders(id) ON DELETE CASCADE,
    user_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    public boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz
);



