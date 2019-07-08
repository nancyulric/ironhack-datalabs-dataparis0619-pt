```mysql
USE lab_mysql;
```

CREATE TABLE Evenement (id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, nom_evenement VARCHAR(40) NOT NULL, url_evenement VARCHAR(70), date_debut DATE NOT NULL, date_fin DATE NOT NULL);

CREATE TABLE Categorie (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, nom_categorie VARCHAR(25) NOT NULL);

CREATE TABLE Sous_categorie (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, nom_sous_categorie VARCHAR(25) NOT NULL);

CREATE TABLE Contact (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, nom_contact VARCHAR(70) NOT NULL, tel_contact VARCHAR(14)NOT NULL, mail_contact VARCHAR(70)NOT NULL);

CREATE TABLE Reservation (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, type_resa VARCHAR(40), tel_resa VARCHAR(14), url_resa VARCHAR(70), mail_resa VARCHAR(70));

CREATE TABLE Prix (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, type_prix CHAR(3) NOT NULL, detail_prix INT(5) NOT NULL);

CREATE TABLE Lieu_evenement (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, nom_lieu VARCHAR(70) NOT NULL, adresse_lieu VARCHAR(70) NOT NULL, code_postal CHAR(5) NOT NULL, arrondissement CHAR(2) NOT NULL);

CREATE TABLE Type_acces (id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, nom_type_acces VARCHAR(10));

INSERT INTO Evenement (nom_evenement, url_evenement, date_debut, date_fin)
VALUES ('Fetes des possibles', 'https://quefaire.paris.fr/59875/fete-des-possibles', 16/09/2019, 16/09/2019),
		('Atelier de conversation en espagnol', 'Atelier de conversation en espagnol', 03/01/2019, 26/12/2019),
		('Bibliothèque Hors Les Murs', 'https://quefaire.paris.fr/83826/bibliotheque-hors-les-murs', 12/07/2019, 30/08/2019);
		
INSERT INTO Categorie (nom_categorie)
VALUES ('animations'),
		('animations'),
		('animations');
		
INSERT INTO Sous_categorie (nom_sous_categorie)
VALUES ('atelier/cours'),
		('atelier/cours'),
		('lecture/rencontre');
		
INSERT INTO Contact (nom_contact, tel_contact, mail_contact)
VALUES ('Espéranto Paris Île-de-France', 'none','mailto:info@esperanto.paris'),
		('Bibliothèque Vaclav Havel', '01 40 38 65 40', 'bibliotheque.vaclav-havel@paris.fr'),
		('Bibliothèque Vaclav Havel', '01 40 38 65 40', 'bibliotheque.vaclav-havel@paris.fr');
		
INSERT INTO Reservation (type_resa, tel_resa, url_resa, mail_resa)
VALUES ('sur_place', 'none', 'none', 'none'),
		('sur_place', 'none', 'none', 'none'),
		('sur_place', 'none', 'none', 'none');
		
INSERT INTO Prix (type_prix, detail_prix)
VALUES ('non', 0),
		('non', 0),
		('non', 0);
		
INSERT INTO Type_acces (nom_type_acces)
VALUES ('none'),
		('pmr'),
		('none');
		
INSERT INTO Lieu_evenement (nom_lieu, adresse_lieu, code_postal, arrondissement)
VALUES ('Espéranto Paris Île-de-France', '4 bis rue de la Cerisaie', '75004', 04 ),
		('Bibliothèque Václav Havel', '26 esplanade Nathalie Sarraute', '75018', 18),
		('Jardins Rosa-Luxemburg', '63 quater, rue Riquet', '75018', 18);