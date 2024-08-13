CREATE TABLE products (id SERIAL PRIMARY Key,
                                         code VARCHAR(200) Not NULL,
                                                           description VARCHAR(150) NULL,
                                                                                    price DOUBLE PRECISION DEFAULT NULL,
                                                                                                                   quantity INT NOT NULL)
INSERT Into products (code,
                      description,
                      price,
                      quantity)
VALUES ('P1',
        'produit1',
        10.5,
        100), ('P2',
               'produit2',
               12.5,
               110), ('P1',
                      'produit3',
                      13.5,
                      105)