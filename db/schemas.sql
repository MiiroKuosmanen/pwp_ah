CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    nickname VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE Items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    seller_id INT NOT NULL REFERENCES Users (id) ON DELETE CASCADE,
    category_id INT REFERENCES Categories (id) ON DELETE SET NULL
);

CREATE TABLE Auction (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255),
    item_id INT NOT NULL REFERENCES Items (id) ON DELETE CASCADE,
    seller_id INT NOT NULL REFERENCES Users (id) ON DELETE CASCADE,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    starting_price DECIMAL(10, 2) NOT NULL,
    current_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Bids (
    id SERIAL PRIMARY KEY,
    auction_id INT NOT NULL REFERENCES Auction (id) ON DELETE CASCADE,
    buyer_id INT NOT NULL REFERENCES Users (id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL,
    bid_time TIMESTAMP NOT NULL
);
