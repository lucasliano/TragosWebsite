USE tragosdb;
CREATE TABLE trago (
	id MEDIUMINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    texto mediumtext,
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


/** DROP TABLE cat; **/

/** Código para agregar un elemento a la lista y ver la lista **/
INSERT INTO cat VALUES (0, "Tragos Tropicales");		
INSERT INTO cat VALUES (0, "Bebidas Sin Alcohol");
INSERT INTO cat VALUES (0, "Tragos Sin Alcohol");
INSERT INTO cat VALUES (0, "Tragos Secos");
INSERT INTO cat VALUES (0, "Cervezas");
INSERT INTO cat VALUES (0, "Espumantes");
INSERT INTO cat VALUES (0, "Vinos");
SELECT * FROM cat;


DROP TABLE trago;

/** Tragos Tropicales **/
INSERT INTO trago VALUES (0, "Caipirinha", "Trago tropical que contiene jugo", true, 1);
INSERT INTO trago VALUES (0, "Mojito", "Trago tropical que contiene jugo", false, 1);
INSERT INTO trago VALUES (0, "Mojito Red", "Trago tropical que contiene jugo", true, 1);
/** Bebidas sin alcohol **/
INSERT INTO trago VALUES (0, "Coca-Cola", "Trago tropical que contiene jugo", true, 2);
INSERT INTO trago VALUES (0, "Agua", "Trago tropical que contiene jugo", false, 2);
INSERT INTO trago VALUES (0, "Soda", "Trago tropical que contiene jugo", false, 2);
/** Tragos sin alcohol **/
INSERT INTO trago VALUES (0, "San Francisco", "Trago tropical que contiene jugo", true, 3);
/** Tragos Secos **/
INSERT INTO trago VALUES (0, "Gin-Tónic", "Trago tropical que contiene jugo", false, 4);
/** Cervezas **/
INSERT INTO trago VALUES (0, "Imperial IPA", "Trago tropical que contiene jugo", false, 5);
/** Espumantes **/
INSERT INTO trago VALUES (0, "Shampo", "Trago tropical que contiene jugo", false, 6);
/** Vinos **/
INSERT INTO trago VALUES (0, "Vinoide", "Trago tropical que contiene jugo", false, 7);

SELECT * FROM trago;

INSERT INTO pedido VALUES (0, "Mojito", "Juan", true );
SELECT * FROM pedido;
SELECT * FROM pedido WHERE terminado = false;
DELETE FROM pedido WHERE idPedido = 1;
drop table pedido;



SELECT trago.* FROM trago INNER JOIN cat
	ON trago.idCat = cat.idCat
WHERE cat.idCat = 1;

SELECT trago.* FROM trago INNER JOIN cat ON trago.idCat = cat.idCat WHERE cat.idCat = 3;