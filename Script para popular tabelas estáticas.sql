describe airline.passenger;

# Insert de passageiro
INSERT INTO airline.passenger 
	(full_name, cpf, created_at, updated_at) 
	VALUES 
		('José Passageiro 2', '000.000.000-00', now(), now());
        
SELECT * FROM airline.passenger;

# Insert de estado
INSERT INTO airline.state 
	(state_name, acronym, created_at, updated_at) 
	VALUES 
		('São Paulo', 'SP', now(), now()),
        ('Rio de Janeiro', 'RJ', now(), now()),
        ('Distríto Federal', 'DF', now(), now()),
        ('Minas Gerais', 'MG', now(), now())
;

# DELETE FROM airline.state WHERE id > 0;

SELECT * FROM airline.state;

# Insert de cidade
INSERT INTO airline.city 
	(city_name, fk_state, created_at, updated_at) 
	VALUES 
		('São Paulo', 5, now(), now()),
        ('Rio de Janeiro', 6, now(), now()),
        ('Brasilía', 7, now(), now()),
        ('Belo Horizonte', 8, now(), now())
;

SELECT ct.id AS "ID Cidade", city_name AS "Cidade", state_name AS "Estado", acronym AS "Sigla" FROM airline.city AS ct JOIN airline.state AS st ON st.id = ct.fk_state;

# Insert de aeroporto
INSERT INTO airline.airport
	(airport_name, fk_city, created_at, updated_at)
    VALUES
		('Guarulhos', 1, now(), now()),
        ('Santos Dumond', 2, now(), now()),
        ('Aeroporto Internacional de Brasília', 3, now(), now()),
        ('Confins', 4, now(), now())
;

SELECT * FROM airline.airport;
SELECT * FROM airline.city;

SELECT 
	ap.id AS "ID Aeroporto",
    airport_name AS "Aeroporto",
	city_name AS "Cidade"
FROM airline.airport AS ap
	JOIN airline.city AS ct ON ct.id = ap.fk_city
;

SELECT 
	ap.id AS "ID Aeroporto",
    airport_name AS "Aeroporto",
	city_name AS "Cidade", 
	state_name AS "Estado", 
	acronym AS "Sigla" 
FROM airline.airport AS ap
	JOIN airline.city AS ct ON ap.fk_city = ct.id
    JOIN airline.state AS st ON ct.fk_state = st.id
;

# Insert de classe
INSERT INTO airline.class
	(class_type, created_at, updated_at)
    VALUES
		('Econômica', now(), now()),
        ('Executiva', now(), now())
;

SELECT * FROM airline.class;


