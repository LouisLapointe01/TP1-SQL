DROP TABLE Moniteur CASCADE CONSTRAINTS;
DROP TABLE Specialité CASCADE CONSTRAINTS;
DROP TABLE Cours CASCADE CONSTRAINTS;
DROP TABLE Adherent CASCADE CONSTRAINTS;
DROP TABLE Suivre CASCADE CONSTRAINTS;
DROP TABLE Materiel CASCADE CONSTRAINTS;
DROP TABLE Louer CASCADE CONSTRAINTS;

CREATE TABLE Moniteur(NoM NUMBER(5),NomM VARCHAR(30),PrenomM VARCHAR(30),Adresse VARCHAR(30),DateNaiss DATE,
CONSTRAINT pk_Moniteur PRIMARY KEY(NoM),
CONSTRAINT ck_NomM CHECK (NomM IS NOT NULL),
CONSTRAINT ck_PrenomM CHECK (PrenomM IS NOT NULL),
CONSTRAINT ck_Adresse CHECK (Adresse IS NOT NULL),
CONSTRAINT ck_DateNaiss CHECK (DateNaiss IS NOT NULL));

CREATE TABLE Specialité(IdSpecialité NUMBER(5) ,NomS VARCHAR(30),
CONSTRAINT pk_Specialité PRIMARY KEY(IdSpecialité),
CONSTRAINT ck_IdSpecialité CHECK (IdSpecialité IS NOT NULL),
CONSTRAINT ck_nomS CHECK (nomS  IS NOT NULL));

CREATE TABLE Cours(CodeC NUMBER(5),Niveau VARCHAR(30) ,NbPlaces NUMBER(5),DateCours DATE,NoM NUMBER(5),IdSpecialité NUMBER(5),
CONSTRAINT pk_Cours PRIMARY KEY(CodeC),
CONSTRAINT ck_CodeC CHECK (CodeC IS NOT NULL),
CONSTRAINT ck_Niveau CHECK (Niveau  IS NOT NULL),
CONSTRAINT ck_NbPlaces CHECK (NbPlaces > 0),
CONSTRAINT ck_DateCours CHECK (DateCours IS NOT NULL),
CONSTRAINT fk_noM FOREIGN KEY (NoM) REFERENCES Moniteur(NoM) on delete cascade,
CONSTRAINT fk_idSpecialite FOREIGN KEY (idSpecialité) REFERENCES Specialité(IdSpecialité)on delete cascade);

CREATE TABLE Adherent(NoA NUMBER(5),NomA VARCHAR(30),PrenomA VARCHAR(30),AdresseA VARCHAR(30),TelA NUMBER(10),AgeA NUMBER(3),
CONSTRAINT pk_Adherent PRIMARY KEY(NoA),
CONSTRAINT ck_NoA CHECK (NoA IS NOT NULL),
CONSTRAINT ck_NomA CHECK (NomA IS NOT NULL),
CONSTRAINT ck_PrenomA CHECK (PrenomA IS NOT NULL),
CONSTRAINT ck_AdresseA CHECK (AdresseA IS NOT NULL),
CONSTRAINT ck_AgeA CHECK (AgeA BETWEEN 12 and 100));

CREATE TABLE Suivre(CodeC NUMBER(5),NoA NUMBER(5),
CONSTRAINT fk_c_NoA FOREIGN KEY (NoA) REFERENCES Adherent(NoA)on delete cascade,
CONSTRAINT fk_c_CodeC FOREIGN KEY (CodeC) REFERENCES Cours(CodeC)on delete cascade);

CREATE TABLE Materiel(CodeM NUMBER(5),Type VARCHAR(30) ,Marque VARCHAR(30) ,Prix NUMBER(5),QteDispo NUMBER(5),
CONSTRAINT pk_Materiel PRIMARY KEY(CodeM),
CONSTRAINT ck_CodeM CHECK (CodeM IS NOT NULL),
CONSTRAINT ck_Type CHECK (Type IS NOT NULL),
CONSTRAINT ck_Marque CHECK (Marque IS NOT NULL),
CONSTRAINT ck_Prix CHECK (Prix > 0),
CONSTRAINT ck_QteDispo CHECK (QteDispo > 0));


CREATE TABLE Louer (NoA NUMBER(5),CodeM NUMBER(5),Quantite NUMBER(5),
CONSTRAINT ck_a_NoA CHECK (NoA IS NOT NULL),
CONSTRAINT ck_a_CodeM CHECK (CodeM IS NOT NULL),
CONSTRAINT ck_Quantite CHECK (Quantite > 0),
CONSTRAINT fk_d_NoA FOREIGN KEY (NoA) REFERENCES Adherent(NoA)on delete cascade,
CONSTRAINT fk_d_CodeM FOREIGN KEY (CodeM) REFERENCES Materiel(CodeM)on delete cascade);

INSERT INTO Moniteur VALUES (1,'Dujardin','Jean','123 rue du haut, Grenoble','01-09-1974');
INSERT INTO Moniteur VALUES (2,'Clown','George ','Rue du bas, Grenoble','20-08-1987');

INSERT INTO Specialité VALUES (1,'ski');
INSERT INTO Specialité VALUES (2,'snowboard');
INSERT INTO Specialité VALUES (3,'raquette');

INSERT INTO Cours VALUES (1,'debutant',1,'01-02-2013',1,2);
INSERT INTO Cours VALUES (2,'moyen',1,'02-02-2013',1,2);
INSERT INTO Cours VALUES (3,'debutant',5,'01-02-2013',2,1);

INSERT INTO Adherent VALUES (1,'Lapointe','Louis','103 Avenue Jules Julien, Toulouse',068475852,17);
INSERT INTO Adherent VALUES (2,'Michel','Bernad','23 rue de rien, Tarbes',07888358471,69);
INSERT INTO Adherent VALUES (3,'Coulibaly','Mohammed','Rue de la rue, Grenoble',NULL,19);

INSERT INTO Suivre VALUES (1,1);
INSERT INTO Suivre VALUES (2,1);
INSERT INTO Suivre VALUES (1,3);
INSERT INTO Suivre VALUES (3,2);

INSERT INTO Materiel VALUES (1,'ski','HyperGliss',10,2);
INSERT INTO Materiel VALUES (2,'snowboard','HyperGliss',11,3);
INSERT INTO Materiel Values (4,'raquette','Smash',8,2);

INSERT INTO Louer VALUES (3,1,1);
INSERT INTO Louer VALUES (2,1,2);
