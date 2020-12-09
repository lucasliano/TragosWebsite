USE tragosdb;
CREATE TABLE trago (
	idTrago MEDIUMINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    idCat MEDIUMINT, 
    PRIMARY KEY (idTrago),
    FOREIGN KEY (idCat) REFERENCES cat(idCat)
    );
SELECT * FROM trago;

CREATE TABLE cat (
	idCat MEDIUMINT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60),
    PRIMARY KEY (idCat)
    );
SELECT * FROM cat;

CREATE TABLE pedido (
	idPedido MEDIUMINT NOT NULL AUTO_INCREMENT,
    idTrago MEDIUMINT,
    nombrePersona VARCHAR(60),
    PRIMARY KEY (idPedido),
    FOREIGN KEY (idTrago) REFERENCES trago(idTrago)
    );


/** DROP TABLE cat; **/

/** Código para agregar un elemento a la lista y ver la lista **/
INSERT INTO cat VALUES (0, "Bebidas Sin Alcohol");
SELECT * FROM cat;


INSERT INTO trago VALUES (0, "Caipirinha", 1);
SELECT * FROM trago;


INSERT INTO pedido VALUES (0, 4, "Juan" );
SELECT * FROM pedido;
DELETE FROM pedido WHERE idPedido = 2;



SELECT trago.* FROM trago INNER JOIN cat
	ON trago.idCat = cat.idCat
WHERE cat.idCat = 1;

