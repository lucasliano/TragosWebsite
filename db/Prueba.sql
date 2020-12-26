USE tragosdb;
CREATE TABLE trago (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    texto mediumtext,
    ingredientes mediumtext,
    recomendado BOOLEAN,
    idCat MEDIUMINT, 
    PRIMARY KEY (id),
    FOREIGN KEY (idCat) REFERENCES cat(id)
    );
SELECT * FROM trago;

CREATE TABLE cat (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    PRIMARY KEY (id)
    );
SELECT * FROM cat;

CREATE TABLE pedido (
	idPedido MEDIUMINT NOT NULL AUTO_INCREMENT,
    nombreTrago VARCHAR(60),
    nombrePersona VARCHAR(60),
    terminado BOOLEAN,
    PRIMARY KEY (idPedido)
    );



/** Código para agregar un elemento a la lista y ver la lista **/
INSERT INTO cat VALUES (0, "Tragos Tropicales");	/** SI **/	
INSERT INTO cat VALUES (0, "Bebidas Sin Alcohol");	/** SI **/
INSERT INTO cat VALUES (0, "Tragos Sin Alcohol");	/** SI **/
INSERT INTO cat VALUES (0, "Tragos Secos");			/** SI **/
INSERT INTO cat VALUES (0, "Cervezas");				/** SI **/
INSERT INTO cat VALUES (0, "Espumantes");			/** SI **/
INSERT INTO cat VALUES (0, "Vinos");				/** SI **/
SELECT * FROM cat;

DROP TABLE cat;

DROP TABLE trago;

/** Tragos Tropicales **/
INSERT INTO trago VALUES (0, "Mojito", "Toda una Leyenda" ,"Ron, Menta, Lima, Tónica, Azúcar.", true, 1);
INSERT INTO trago VALUES (0, "Mojito Red", "Para Innovadores" ,"Ron, Menta, Frutilla, Lima, Tónica, Azúcar.", false, 1);
INSERT INTO trago VALUES (0, "Margarita", "Un Clásico" ,"Tequila, Jugo de Limón, Azúcar.", false, 1);
INSERT INTO trago VALUES (0, "Margarita Blue", "Caribbean Style" ,"Tequila, Blue Curacao, Jugo de Limón, Azúcar.", true, 1);
INSERT INTO trago VALUES (0, "Sex on the Beach", "Para Renovar la Pasión" ,"Vodka, Licor de Durazno, Jugo de Naranja, Granadina.", false, 1);
INSERT INTO trago VALUES (0, "Agua de Valencia", "Sentite en España" ,"Vodka, Ginebra, Champagne dulce, Jugo de Naranja, Jugo de Limón, Azúcar.", false, 1);
INSERT INTO trago VALUES (0, "Caipirinha", "Para Sentirse en Brasil" ,"Cachaza, Lima, Tónica, Azúcar.", true, 1);
INSERT INTO trago VALUES (0, "Cubalibre", "Para sentirte como el 'Che'" ,"Ron, Cola, Jugo de Limón, Angostura.", false, 1);
INSERT INTO trago VALUES (0, "Gancia Batido con Limón", "Último pero no menos importante" ,"Gancia, Azúcar, Jugo de Limón, Rodajas de Limón.", false, 1);


/** Bebidas sin alcohol **/
INSERT INTO trago VALUES (0, "Coca-Cola", "" ,"", false, 2);
INSERT INTO trago VALUES (0, "Coca-Cola Zero", "" ,"", true, 2);
INSERT INTO trago VALUES (0, "Cunnington Cola Light", "" ,"", true, 2);
INSERT INTO trago VALUES (0, "Cunnington Tónica Light", "" ,"", false, 2);
INSERT INTO trago VALUES (0, "Agua", "" ,"", false, 2);
INSERT INTO trago VALUES (0, "Soda", "" ,"", false, 2);

/** Tragos sin alcohol **/
INSERT INTO trago VALUES (0, "San Francisco", "Inofensivo y Refrescante" ,"Jugo de Naranja, Jugo de Durazno, Jugo de Ananá, Granadina, Azúcar.", true, 3);
INSERT INTO trago VALUES (0, "Shirley Temple", "Para Bailar Sin Parar" ,"Ginger Ale, Jugo de Naranja, Granadina.", false, 3);
INSERT INTO trago VALUES (0, "Soda Verde", "Sentite Ecológico" ,"Jugo de Limón, Menta, Arándanos, Pepino, Soda.", false, 3);

/** Tragos Secos **/
INSERT INTO trago VALUES (0, "Gin-Tonic", "Para Calentar la Garganta" ,"Gin, Tónica, Limón.", false, 4);
INSERT INTO trago VALUES (0, "Martini", "Áspero como Lengua de Gato" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 4);
INSERT INTO trago VALUES (0, "Aperol Spritz", "Para Sentirte a la Moda" ,"Aperol, Champagne, Naranja.", true, 4);


/** Cervezas **/
INSERT INTO trago VALUES (0, "Imperial IPA", "India Pale Ale" ,"Doble Lúpulo. IBU:42 | ABV:6%", true, 5);
INSERT INTO trago VALUES (0, "Imperial APA", "American Pale Ale" ,"IBU:30 | ABV:5%", false, 5);
INSERT INTO trago VALUES (0, "Imperial Lager", "Amber" ,"IBU:18 | ABV:5.5%", false, 5);

/** Espumantes **/
INSERT INTO trago VALUES (0, "Champagne Emilia", "Burbujeante" ,"", false, 6);
INSERT INTO trago VALUES (0, "Sidra 1888", "Una leyenda" ,"", false, 6);


/** Vinos **/
INSERT INTO trago VALUES (0, "Cosecha Tardia", "Fresco y Dulce" ,"", false, 7);

DELETE FROM trago WHERE id = 16;

SELECT * FROM trago;							/** This **/

INSERT INTO pedido VALUES (0, "Mojito", "Juan", true );
SELECT * FROM pedido;
SELECT * FROM pedido WHERE terminado = false;


drop table pedido;



SELECT trago.* FROM trago INNER JOIN cat
	ON trago.idCat = cat.idCat
WHERE cat.idCat = 1;

SELECT trago.* FROM trago INNER JOIN cat ON trago.idCat = cat.idCat WHERE cat.idCat = 3;