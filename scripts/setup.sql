CREATE TABLE revenda (
    cnpj VARCHAR(14) NOT NULL,
    bandeira VARCHAR(200) NOT NULL,
    revenda VARCHAR(200) NOT NULL,
    regiao VARCHAR(200) NOT NULL,
    estado VARCHAR(200) NOT NULL,
    municipio VARCHAR(200) NOT NULL,
    PRIMARY KEY (cnpj)
);

CREATE TABLE produto (
    nome VARCHAR(200),
    valor_compra VARCHAR(6),
    valor_venda VARCHAR(6),
    data_coleta VARCHAR(10) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    unidade_medida VARCHAR(200) NOT NULL,
    PRIMARY KEY (nome, data_coleta, cnpj),
    FOREIGN KEY (cnpj) REFERENCES revenda (cnpj)
);



COPY revenda(regiao, estado, municipio, revenda, cnpj, bandeira)
FROM '/tmp/revenda.csv'
DELIMITER E'\t'
CSV HEADER;

COPY produto(cnpj, nome, data_coleta, valor_venda, valor_compra, unidade_medida )
FROM '/tmp/produto.csv'
DELIMITER E'\t'
CSV HEADER;