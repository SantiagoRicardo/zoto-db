USE zoto_db;

CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    adress VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL,
    enabled BOOLEAN DEFAULT true
);

CREATE TABLE objects (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    object_name VARCHAR(50) NOT NULL,
    object_description VARCHAR(255),
    quantity INT NOT NULL
);

CREATE TABLE publications (
	id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users (id),
    object_id INT,
    FOREIGN KEY (object_id) REFERENCES objects (id),
    publication_description VARCHAR(255),
    create_date DATETIME
);

CREATE TABLE offers (
	id INT PRIMARY KEY AUTO_INCREMENT,
    publication_id INT,
    FOREIGN KEY (publication_id) REFERENCES publications (id),
    user_offering_id INT,
    FOREIGN KEY (user_offering_id) REFERENCES users (id),
    offer_description VARCHAR(255),
    offer_type ENUM ('exchange', 'donation', 'sale'),
    offer_state ENUM ('pending', 'accepted', 'rejected')
);

CREATE TABLE transactions (
	id INT PRIMARY KEY AUTO_INCREMENT,
    offer_id INT,
    FOREIGN KEY (offer_id) REFERENCES offers (id),
    transaction_type ENUM ('exchange', 'donation', 'sale'),
    transaction_state ENUM ('pending', 'completed', 'canceled')
);