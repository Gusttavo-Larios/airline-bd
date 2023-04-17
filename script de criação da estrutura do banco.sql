CREATE DATABASE airline;

USE airline;

CREATE TABLE class (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    class_type VARCHAR(20) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY(id)
);

CREATE TABLE airplane (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    serial_number VARCHAR(20) NOT NULL UNIQUE,
    model VARCHAR(30) NOT NULL,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY(id)
);

CREATE TABLE seat (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    seat_code VARCHAR(45) NOT NULL,
    fk_class INTEGER UNSIGNED NOT NULL,
    fk_airplane INTEGER UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_class) REFERENCES class(id),
    FOREIGN KEY (fk_airplane) REFERENCES airplane(id)
);

CREATE TABLE pilot (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
	lincese_number VARCHAR(45) NOT NULL UNIQUE,
    full_name VARCHAR(55) NOT NULL,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY(id)
);

CREATE TABLE state (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    state_name VARCHAR(50) NOT NULL UNIQUE,
    acronym VARCHAR(2) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY(id)
);

CREATE TABLE city (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    fk_state INTEGER UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_state) REFERENCES state(id)
);

CREATE TABLE airport(
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    fk_city INTEGER UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY(id),
    FOREIGN KEY (fk_city) REFERENCES city(id)
);

CREATE TABLE flight (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    flight_code VARCHAR(45),
    time_table DATETIME NOT NULL,
    fk_pilot INTEGER UNSIGNED NOT NULL,
    fk_airplane INTEGER UNSIGNED NOT NULL,
    fk_departure_airport INTEGER UNSIGNED NOT NULL,
    fk_arrival_airport INTEGER UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY (id),
    FOREIGN KEY (fk_pilot) REFERENCES pilot(id),
    FOREIGN KEY (fk_airplane) REFERENCES airplane(id),
    FOREIGN KEY (fk_departure_airport) REFERENCES airport(id),
    FOREIGN KEY (fk_arrival_airport) REFERENCES airport(id)
);

CREATE TABLE passenger(
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    full_name VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY (id)
);

CREATE TABLE airfare (
	id INTEGER UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
    price DECIMAL NOT NULL,
    fk_flight INTEGER UNSIGNED NOT NULL,
    fk_passenger  INTEGER UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT now(),
    update_at DATETIME DEFAULT now() ON UPDATE now(),
    PRIMARY KEY (id),
    FOREIGN KEY (fk_flight) REFERENCES flight(id),
    FOREIGN KEY (fk_passenger) REFERENCES passenger(id)
);
