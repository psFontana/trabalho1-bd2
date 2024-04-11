DROP TABLE IF EXISTS Taxi;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Corrida;
DROP TABLE IF EXISTS Motorista;
DROP TABLE IF EXISTS Zona;
DROP TABLE IF EXISTS Fila;
DROP TABLE IF EXISTS ClienteEmpresa;

CREATE TABLE Taxi (
  Placa VARCHAR(7) NOT NULL,
  Marca VARCHAR(30) NOT NULL,
  Modelo VARCHAR(30) NOT NULL,
  AnoFab INTEGER,
  Licenca VARCHAR(9),
  PRIMARY KEY(Placa)
);

CREATE TABLE Cliente (
  CliId VARCHAR(4) NOT NULL,
  Nome VARCHAR(80) NOT NULL,
  CPF VARCHAR(14) NOT NULL,
  PRIMARY KEY(CliId)
);

CREATE TABLE Corrida (
  CliId VARCHAR(4) NOT NULL,
  Placa VARCHAR(7) NOT NULL,
  DataPedido DATE NOT NULL,
  PRIMARY KEY(CliId, Placa, DataPedido),
  FOREIGN KEY(CliId)
    REFERENCES Cliente(CliId)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Placa)
    REFERENCES Taxi(Placa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


CREATE TABLE Motorista (
  CNH VARCHAR(6) NOT NULL,
  Nome VARCHAR(80) NOT NULL,
  CNHValid INTEGER,
  Placa VARCHAR(7) NOT NULL,
  PRIMARY KEY(CNH),
  FOREIGN KEY(Placa)
    REFERENCES Taxi(Placa)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Zona (
  Zona VARCHAR(40) NOT NULL,
  PRIMARY KEY(Zona)
);

CREATE TABLE Fila (
   Zona VARCHAR(40) NOT NULL,
   CNH VARCHAR(6) NOT NULL,
   DataHoraIn TIMESTAMP,
   DataHoraOut TIMESTAMP,
   KmIn INTEGER,
   PRIMARY KEY (Zona, CNH),
   FOREIGN KEY(Zona)
     REFERENCES Zona(Zona)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION,
   FOREIGN KEY(CNH)
     REFERENCES Motorista(CNH)
       ON DELETE NO ACTION
       ON UPDATE NO ACTION
);


CREATE TABLE ClienteEmpresa (
  CliId VARCHAR(4) NOT NULL,
  Nome VARCHAR(80) NOT NULL,
  CNPJ VARCHAR(14) NOT NULL,
  PRIMARY KEY(CliId)
);