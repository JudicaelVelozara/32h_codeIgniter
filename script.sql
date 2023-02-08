DROP DATABASE IF EXISTS TAKALO;

CREATE DATABASE IF NOT EXISTS TAKALO;


USE TAKALO;
# -----------------------------------------------------------------------------
#       TABLE : client
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS client(
    idUser INT NOT NULL AUTO_INCREMENT ,  
    nom VARCHAR(50) ,
    mail VARCHAR(50) ,
    pass VARCHAR(30),
    dateNaissance DATE
   , PRIMARY KEY (idUser) 
 ); 



# -----------------------------------------------------------------------------
#       TABLE : administrator
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS administrator(
    idAdmin INT NOT NULL AUTO_INCREMENT ,  
    nom VARCHAR(50) ,
    mail VARCHAR(50) ,
    pass VARCHAR(30)
   , PRIMARY KEY (idAdmin) 
 ); 




# -----------------------------------------------------------------------------
#       TABLE : OBJET
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS objet(
   idObjet INTEGER(2) NOT NULL  ,
   idCategorie INTEGER(2) NOT NULL ,
    designation VARCHAR(50)
   , PRIMARY KEY (idObjet) 
 ); 

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE OBJET
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_OBJET_CATEGORIE
     ON objet (idCategorie ASC);

# -----------------------------------------------------------------------------
#       TABLE : CATEGORIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS categorie(
   idCategorie INTEGER(2) NOT NULL ,
   categorie VARCHAR(50)  
   , PRIMARY KEY (idCategorie) 
 );

# -----------------------------------------------------------------------------
#       TABLE : OBJETUSER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS objetUser(
   idUser INTEGER(2) NOT NULL  ,
   idObjet INTEGER(2) NOT NULL  ,
   momentObtention datetime
   , PRIMARY KEY (idUser,idObjet) 
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE OBJETUSER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_OBJETUSER_USER
     ON objetUser (idUser ASC);

CREATE  INDEX I_FK_OBJETUSER_OBJET
     ON objetUser (idObjet ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE objet 
  ADD FOREIGN KEY FK_OBJET_CATEGORIE (idCategorie)
      REFERENCES categorie (idCategorie) ;


ALTER TABLE objetUser 
  ADD FOREIGN KEY FK_OBJETUSER_USER (idUser)
      REFERENCES client (idUser) ;


ALTER TABLE objetUser 
  ADD FOREIGN KEY FK_OBJETUSER_OBJET (idObjet)
      REFERENCES objet (idObjet) ;





insert into client values(null,'za','za@test.mg','pass',"2003/06/06");
insert into client values(null,'client','client','client',"2003/06/06");


insert into administrator values(null,'admin','admin','admin');



INSERT INTO client(nom,mail,pass,dateNaissance) values("Loic","Loic@mdg.com","0001","2000-01-03");
INSERT INTO client(nom,mail,pass,dateNaissance) values("Larry","Larry@mdg.com","0002","2000-02-08");
INSERT INTO client(nom,mail,pass,dateNaissance) values("Lucie","Lucie@mdg.com","0003","2000-03-02");
INSERT INTO client(nom,mail,pass,dateNaissance) values("Ludovic","Ludovic@mdg.com","0004","1990-04-02");
INSERT INTO client(nom,mail,pass,dateNaissance) values("Lala","Lala@mdg.com","0005","2003-06-09");


INSERT INTO administrator(nom,mail,pass) values("Paul","Paul@mdg.com","0011");
INSERT INTO administrator(nom,mail,pass) values("Patrick","Patrick@mdg.com","0012");
INSERT INTO administrator(nom,mail,pass) values("Pierre","Pierre@mdg.com","0013");


INSERT INTO categorie values(1,"vetement");
INSERT INTO categorie values(2,"ustensile de cuisine");
INSERT INTO categorie values(3,"bijoux");
INSERT INTO categorie values(4,"materiel de travaux");


INSERT INTO objet values(1,1,"T-shirt");
INSERT INTO objet values(2,1,"robe");
INSERT INTO objet values(3,1,"veste");
INSERT INTO objet values(4,1,"chemise");
INSERT INTO objet values(5,2,"mixeur");
INSERT INTO objet values(6,2,"batteuse");
INSERT INTO objet values(7,2,"machine à cafe");
INSERT INTO objet values(8,2,"presse orange");
INSERT INTO objet values(9,3,"collier");
INSERT INTO objet values(10,3,"bague");
INSERT INTO objet values(11,3,"paires de boucle d'oreille");
INSERT INTO objet values(12,3,"bracelet");
INSERT INTO objet values(13,4,"perceuse");
INSERT INTO objet values(14,4,"poste de soudure");


INSERT INTO objetUser values(1,1,"2023-01-01");
INSERT INTO objetUser values(2,1,"2023-01-02");
INSERT INTO objetUser values(2,2,"2023-01-02");
INSERT INTO objetUser values(3,3,"2023-01-02");
INSERT INTO objetUser values(4,4,"2023-01-02");
INSERT INTO objetUser values(5,5,"2023-01-02");
INSERT INTO objetUser values(1,6,"2023-01-03");
INSERT INTO objetUser values(2,7,"2023-01-03");
INSERT INTO objetUser values(3,8,"2023-01-04");
INSERT INTO objetUser values(4,9,"2023-01-01");
INSERT INTO objetUser values(5,10,"2023-01-02");
INSERT INTO objetUser values(1,11,"2023-01-03");
INSERT INTO objetUser values(2,12,"2023-01-02");
INSERT INTO objetUser values(3,13,"2023-01-04");
INSERT INTO objetUser values(4,14,"2023-01-05");
