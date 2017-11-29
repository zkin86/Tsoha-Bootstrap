-- Lisää CREATE TABLE lauseet tähän tiedostoon
CREATE TABLE Omistaja(
  id SERIAL PRIMARY KEY,
  name varchar(50) NOT NULL,
  password varchar(50) NOT NULL
);

CREATE TABLE Kampanja(
  id SERIAL PRIMARY KEY,
  omistaja_id INTEGER REFERENCES Omistaja(id),
  name varchar(50) NOT NULL,
  prosperity INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE Ryhma(
  id SERIAL PRIMARY KEY,
  kampanja_id INTEGER REFERENCES Kampanja(id),
  name varchar(50) NOT NULL,
  perustettu DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Hahmoluokka(
  id SERIAL PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE Hahmo(
  id SERIAL PRIMARY KEY,
  ryhma_id INTEGER REFERENCES Ryhma(id),
  hahmoluokka_id INTEGER REFERENCES Hahmoluokka(id),
  hahmo_name varchar(50) NOT NULL,
  pelaaja_name varchar(50) NOT NULL,
  kulta INTEGER NOT NULL DEFAULT 30,
  exp INTEGER NOT NULL DEFAULT 0,
  taso INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE K_saavutus(
  id SERIAL PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE KampanjanSaavutus(
 kampanja_id INTEGER REFERENCES Kampanja(id),
 saavutus_id INTEGER REFERENCES K_saavutus(id)
);

CREATE TABLE R_saavutus(
 id SERIAL PRIMARY KEY,
 name varchar(50) NOT NULL
);

CREATE TABLE RyhmanSaavutus(
 ryhma_id INTEGER REFERENCES Ryhma(id),
 saavutus_id INTEGER REFERENCES R_saavutus(id)
);

CREATE TABLE Skenaario(
 id SERIAL PRIMARY KEY,
 name varchar(50) NOT NULL
);

CREATE TABLE Historia(
  skenaario_id INTEGER REFERENCES Skenaario(id),
  Kampanja_id INTEGER REFERENCES Kampanja(id),
  played DATE NOT NULL DEFAULT CURRENT_DATE
);

--puuttuu taulu tavaroille sekä liitostaulu hahmojen tavaroille
