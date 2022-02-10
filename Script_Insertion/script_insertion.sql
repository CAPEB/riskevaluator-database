INSERT INTO ENTREPRISE (NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (1234,'abc',5,2000);
INSERT INTO ENTREPRISE (NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (1152,'CZPLomberie',5,2000);
INSERT INTO ENTREPRISE (NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (54125,'abcmlq',5,2000);
INSERT INTO ENTREPRISE (NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (1111,'CZPLomberie2',5,2000);
INSERT INTO ENTREPRISE (NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (2222,'abcMenuis',5,2000);
INSERT INTO ENTREPRISE (NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (69874,'CZELect',5,2000);

insert into compte (is_admin,mail,pwd,name,first_name,is_valid,creation_date,last_login,is_cgu,is_forgotpass,is_temp_password) values (true,'a@gmail.com','pwd','rob','rob',true,'1999-01-08','1999-01-08',true,false,false);
insert into compte (is_admin,mail,pwd,name,first_name,is_valid,creation_date,last_login,is_cgu,is_forgotpass,is_temp_password) values (true,'b@gmail.com','pwd2','bob','bob',true,'2000-01-08','2000-01-08',true,false,false);


insert  into questionnaire  (thematique) values ('Securité pour les meties du batiments');
insert  into questionnaire  (thematique) values ('Attractivité de l''entreprise');
insert  into questionnaire  (thematique) values ('Publicite');
insert  into questionnaire  (thematique) values ('Thematique');
insert  into questionnaire  (thematique) values ('Mal bouffe chez les maçons');
insert  into questionnaire  (thematique) values ('Rentabilité');

insert  into categorie_question  (id_questionnaire,libelle) values (1,'DUERP');
insert  into categorie_question  (id_questionnaire,libelle) values (1,'ORGANISATION DU CHANTIER');
insert  into categorie_question  (id_questionnaire,libelle) values (1,'CHUTES EN HAUTEUR');
insert  into categorie_question  (id_questionnaire,libelle) values (1,'POUSSIERE');


insert  into question  (id_categorie,q_type,libelle_question) values (4,'QUESTION_CHOIX_UNIQUE','Vos salariés ont-ils à disposition des masques anti-poussière');
insert  into question  (id_categorie,q_type,libelle_question) values (2,'QUESTION_CHOIX_UNIQUE','Déplacez-vous les matériaux au plus près de la zone de chantier');
insert  into question  (id_categorie,q_type,libelle_question) values (1,'QUESTION_CHOIX_MULTIPLE','Proposez-vous d''éventuelles formations à vos salariés parmi les choix suivants? ');
insert  into question  (id_categorie,q_type,libelle_question) values (5,'Question Choix Unique','Vos salariés ont-ils à disposition des masques anti-poussière');
insert  into question  (id_categorie,q_type,libelle_question) values (6,'Question Choix Unique','Déplacez-vous les matériaux au plus près de la zone de chantier');
insert  into question  (id_categorie,q_type,libelle_question) values (7,'Question Choix Multiple','Quels sont les EPI à disposition des salariés');
insert  into question  (id_categorie,q_type,libelle_question) values (8,'Question Choix Multiple','Proposez-vous d''éventuelles formations à vos salariés parmi les choix suivants? ');
insert  into question  (id_categorie,q_type,libelle_question) values (9,'Question Choix Unique','Vos salariés ont-ils à disposition des masques anti-poussière');
insert  into question  (id_categorie,q_type,libelle_question) values (10,'Question Choix Unique','Déplacez-vous les matériaux au plus près de la zone de chantier');
insert  into question  (id_categorie,q_type,libelle_question) values (11,'Question Choix Multiple','Quels sont les EPI à disposition des salariés');
insert  into question  (id_categorie,q_type,libelle_question) values (12,'Question Choix Multiple','Proposez-vous d''éventuelles formations à vos salariés parmi les choix suivants? ');

insert  into metier  (nom_metier) values ('Carreleur');
insert  into metier  (nom_metier) values ('Plombier');
insert  into metier  (nom_metier) values ('Serrurier');
insert  into metier  (nom_metier) values ('Tailleur de pierres');
insert  into metier  (nom_metier) values ('Couvreur Zingueur');
insert  into metier  (nom_metier) values ('Menuisier');
insert  into metier  (nom_metier) values ('Charpentier');
insert  into metier  (nom_metier) values ('Maçon');



insert  into preconisation_globale  (id_questionnaire,contenu,view_if_pourcentage_score_less_than) values (1,'En France, le risque électrique représente plus de 30% des incendies et plus de 10 morts par an',70);
insert  into preconisation_globale  (id_questionnaire,contenu,view_if_pourcentage_score_less_than) values (1,'Selon l’art. R4544-9 et 10, l’habilitation électrique pour non électricien est obligatoire, en cas d’accident du travail la responsabilité civile ou pénale de l’employeur pourra être engagée. L’employeur s’expose aux versements de dommages et intérêts et à une amende',80);
insert  into preconisation_globale  (id_questionnaire,contenu,view_if_pourcentage_score_less_than) values (2,'En France, le risque électrique représente plus de 30% des incendies et plus de 10 morts par an',70);
insert  into preconisation_globale  (id_questionnaire,contenu,view_if_pourcentage_score_less_than) values (2,'Selon l’art. R4544-9 et 10, l’habilitation électrique pour non électricien est obligatoire, en cas d’accident du travail la responsabilité civile ou pénale de l’employeur pourra être engagée. L’employeur s’expose aux versements de dommages et intérêts et à une amende',80);

insert  into preconisation_categorie  (id_categorie ,contenu,view_if_pourcentage_score_less_than) values (2,'L’organisation du chantier est très importante, elle vous permettra d’éviter le port de charges inutiles et donc de réduire les risques physiques liées à la manutention manuelle qui représente 48% des accidents du travail',70);
insert  into preconisation_categorie  (id_categorie ,contenu,view_if_pourcentage_score_less_than) values (4,'En 2019, l’amiante est à l’origine d’environ 3 000 maladies professionnelles et de 1 800 cancers. Si les moyens de protection nécessaires concernant ce risque ne sont pas respectés, vous risquez 1 an d’emprisonnement et 75 000 € d’amende pour mise en danger de la vie d’autrui',80);
insert  into preconisation_categorie  (id_categorie ,contenu,view_if_pourcentage_score_less_than) values (5,'L’organisation du chantier est très importante, elle vous permettra d’éviter le port de charges inutiles et donc de réduire les risques physiques liées à la manutention manuelle qui représente 48% des accidents du travail',70);
insert  into preconisation_categorie  (id_categorie ,contenu,view_if_pourcentage_score_less_than) values (7,'En 2019, l’amiante est à l’origine d’environ 3 000 maladies professionnelles et de 1 800 cancers. Si les moyens de protection nécessaires concernant ce risque ne sont pas respectés, vous risquez 1 an d’emprisonnement et 75 000 € d’amende pour mise en danger de la vie d’autrui',80);


insert  into metier_question  (id_question, id_metier) values (1,5);
insert  into metier_question  (id_question, id_metier) values (1,7);
insert  into metier_question  (id_question, id_metier) values (1,8);
insert  into metier_question  (id_question, id_metier) values (2,6);
insert  into metier_question  (id_question, id_metier) values (2,5);
insert  into metier_question  (id_question, id_metier) values (2,8);
insert  into metier_question  (id_question, id_metier) values (3,6);
insert  into metier_question  (id_question, id_metier) values (3,7);
insert  into metier_question  (id_question, id_metier) values (3,8);
insert  into metier_question  (id_question, id_metier) values (4,6);
insert  into metier_question  (id_question, id_metier) values (4,7);
insert  into metier_question  (id_question, id_metier) values (4,8);

insert into reponse (id_question, nb_points, contenu) values (1,6,'Oui');
insert into reponse (id_question, nb_points, contenu) values (1,0,'Non');
insert into reponse (id_question, nb_points, contenu) values (1,3,'Certains');
insert into reponse (id_question, nb_points, contenu) values (1,6,'Non Concerné');
insert into reponse (id_question, nb_points, contenu) values (2,6,'Oui');
insert into reponse (id_question, nb_points, contenu) values (2,0,'Non');
insert into reponse (id_question, nb_points, contenu) values (2,3,'Certains');
insert into reponse (id_question, nb_points, contenu) values (2,6,'Non Concerné');