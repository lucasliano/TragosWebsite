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
INSERT INTO trago VALUES (0, "Mojito", "Toda una Leyenda" ,"Ron, Menta, Tónica, Azúcar, Hielo.", true, 1);
INSERT INTO trago VALUES (0, "Mojito Red", "Para Inovadores" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 1);
INSERT INTO trago VALUES (0, "Margarita", "Un Clásico" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 1);
INSERT INTO trago VALUES (0, "Margarita Blue", "Caribbean Style" ,"Ron, Menta, Tónica, Azúcar, Hielo.", true, 1);
INSERT INTO trago VALUES (0, "Sex on the Beach", "Para Renovar la Pasión" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 1);
INSERT INTO trago VALUES (0, "Agua de Valencia", "Sentite en España" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 1);
INSERT INTO trago VALUES (0, "Caipirinha", "Para Sentirse en Brasil" ,"Ron, Menta, Tónica, Azúcar, Hielo.", true, 1);
INSERT INTO trago VALUES (0, "Cubalibre", "Ron con Cola pai" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 1);


/** Bebidas sin alcohol **/
INSERT INTO trago VALUES (0, "Coca-Cola", "" ,"", false, 2);
INSERT INTO trago VALUES (0, "Coca-Cola Zero", "" ,"", true, 2);
INSERT INTO trago VALUES (0, "Cunnington Cola Light", "" ,"", true, 2);
INSERT INTO trago VALUES (0, "Cunnington Tónica Light", "" ,"", false, 2);
INSERT INTO trago VALUES (0, "Agua", "" ,"", false, 2);
INSERT INTO trago VALUES (0, "Soda", "" ,"", false, 2);

/** Tragos sin alcohol **/
INSERT INTO trago VALUES (0, "San Francisco", "Inofensivo y Refrescante" ,"Ron, Menta, Tónica, Azúcar, Hielo.", true, 3);
INSERT INTO trago VALUES (0, "Shirley Temple", "Para Bailar Sin Parar" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 3);
INSERT INTO trago VALUES (0, "Soda Verde", "Sentite Ecológico" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 3);

/** Tragos Secos **/
INSERT INTO trago VALUES (0, "Gin-Tonic", "Para Calentar la Garganta" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 4);
INSERT INTO trago VALUES (0, "Martini", "Áspero como Lengua de Gato" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 4);
INSERT INTO trago VALUES (0, "Aperol Spritz", "Para Sentirte a la Moda" ,"Ron, Menta, Tónica, Azúcar, Hielo.", true, 4);


/** Cervezas **/
INSERT INTO trago VALUES (0, "Imperial IPA", "India Pale Ale" ,"Doble Lúpulo. IBU:42 | ABV:6%", true, 5);
INSERT INTO trago VALUES (0, "Imperial APA", "American Pale Ale" ,"IBU:30 | ABV:5%", false, 5);
INSERT INTO trago VALUES (0, "Imperial Lager", "Amber" ,"IBU:18 | ABV:5.5%", false, 5);

/** Espumantes **/
INSERT INTO trago VALUES (0, "Champagne Emilia", "Toda una leyenda" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 6);
INSERT INTO trago VALUES (0, "Sidra 1888", "Toda una leyenda" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 6);


/** Vinos **/
INSERT INTO trago VALUES (0, "Vinoide", "Toda una leyenda" ,"Ron, Menta, Tónica, Azúcar, Hielo.", false, 7);



SELECT * FROM trago;							/** This **/

INSERT INTO pedido VALUES (0, "Mojito", "Juan", true );
SELECT * FROM pedido;
SELECT * FROM pedido WHERE terminado = false;
DELETE FROM pedido WHERE idPedido = 1;
drop table pedido;



SELECT trago.* FROM trago INNER JOIN cat
	ON trago.idCat = cat.idCat
WHERE cat.idCat = 1;

SELECT trago.* FROM trago INNER JOIN cat ON trago.idCat = cat.idCat WHERE cat.idCat = 3;