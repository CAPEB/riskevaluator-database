INSERT INTO ENTREPRISE (_NOENTREPRISE__,NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (1,'1234','abc',5,2000);
INSERT INTO ENTREPRISE (_NOENTREPRISE__,NOSIRET,NOM_ENTREPRISE,EFFECTIF,ANNEEDECREATION ) VALUES (2,'AG6778','CZPLomberie',5,2000);


insert  into compte (id_compte,_noentreprise__,is_admin,mail,pwd,_name,first_name,is_valid,creation_date,last_login,is_cgu,is_forgotpass,is_temp_password) values (1,1,true,'a@gmail.com','pwd','rob','rob',true,'1999-01-08','1999-01-08',true,false,false);
insert  into compte (id_compte,_noentreprise__,is_admin,mail,pwd,_name,first_name,is_valid,creation_date,last_login,is_cgu,is_forgotpass,is_temp_password) values (2,2,true,'b@gmail.com','pwd2','bob','bob',true,'2000-01-08','2000-01-08',true,false,false);


insert  into questionnaire  (id_questionnaire,thematique) values (1,'Securité pour les meties du batiments');
insert  into questionnaire  (id_questionnaire,thematique) values (2,'Attractivité de l''entreprise');

insert  into categorie_question  (id_categorie,id_questionnaire,libelle) values (1,1,'DUERP');
insert  into categorie_question  (id_categorie,id_questionnaire,libelle) values (2,1,'ORGANISATION DU CHANTIER');
insert  into categorie_question  (id_categorie,id_questionnaire,libelle) values (3,1,'CHUTES EN HAUTEUR');
insert  into categorie_question  (id_categorie,id_questionnaire,libelle) values (4,1,'POUSSIERE');


insert  into metier  (id_metier,nom_metier) values (1,'carreleur');
insert  into metier  (id_metier,nom_metier) values (2,'Plombier');
insert  into metier  (id_metier,nom_metier) values (3,'Serrurier');
insert  into metier  (id_metier,nom_metier) values (4,'Tailleur de pierres');
insert  into metier  (id_metier,nom_metier) values (5,'Couvreur Zingueur');


insert  into question  (id_question,id_categorie,"type",libelle_question) values (1,4,'Question Choix Unique','Vos salariés ont-ils à disposition des masques anti-poussière');
insert  into question  (id_question,id_categorie,"type",libelle_question) values (2,2,'Question Choix Unique','Déplacez-vous les matériaux au plus près de la zone de chantier');
insert  into question  (id_question,id_categorie,"type",libelle_question) values (3,1,'Question Choix Multiple','Quels sont les EPI à disposition des salariés');
insert  into question  (id_question,id_categorie,"type",libelle_question) values (4,1,'Question Choix Multiple','Proposez-vous d''éventuelles formations à vos salariés parmi les choix suivants? ');

insert  into preconisation_globale  (id_preconisation_g,id_questionnaire,contenu,"viewIfPourcentageScoreLessThan") values (1,1,'En France, le risque électrique représente plus de 30% des incendies et plus de 10 morts par an',70);
insert  into preconisation_globale  (id_preconisation_g,id_questionnaire,contenu,"viewIfPourcentageScoreLessThan") values (2,1,'Selon l’art. R4544-9 et 10, l’habilitation électrique pour non électricien est obligatoire, en cas d’accident du travail la responsabilité civile ou pénale de l’employeur pourra être engagée. L’employeur s’expose aux versements de dommages et intérêts et à une amende',80);

insert  into preconisation_categorie  (id_preconisation,id_categorie ,contenu,"viewIfPourcentageScoreLessThan") values (1,2,'L’organisation du chantier est très importante, elle vous permettra d’éviter le port de charges inutiles et donc de réduire les risques physiques liées à la manutention manuelle qui représente 48% des accidents du travail',70);
insert  into preconisation_categorie  (id_preconisation,id_categorie ,contenu,"viewIfPourcentageScoreLessThan") values (2,4,'En 2019, l’amiante est à l’origine d’environ 3 000 maladies professionnelles et de 1 800 cancers. Si les moyens de protection nécessaires concernant ce risque ne sont pas respectés, vous risquez 1 an d’emprisonnement et 75 000 € d’amende pour mise en danger de la vie d’autrui',80);

insert  into metier_question  (id_question, id_metier) values (1,6);
insert  into metier_question  (id_question, id_metier) values (1,7);
insert  into metier_question  (id_question, id_metier) values (1,8);
insert  into metier_question  (id_question, id_metier) values (2,6);
insert  into metier_question  (id_question, id_metier) values (2,7);
insert  into metier_question  (id_question, id_metier) values (2,8);
insert  into metier_question  (id_question, id_metier) values (3,6);
insert  into metier_question  (id_question, id_metier) values (3,7);
insert  into metier_question  (id_question, id_metier) values (3,8);
insert  into metier_question  (id_question, id_metier) values (4,6);
insert  into metier_question  (id_question, id_metier) values (4,7);
insert  into metier_question  (id_question, id_metier) values (4,8);

insert into reponse (id_reponse, id_question, nb_points, contenu) values (1,1,6,'Oui');
insert into reponse (id_reponse, id_question, nb_points, contenu) values (2,1,0,'Non');
insert into reponse (id_reponse, id_question, nb_points, contenu) values (3,1,3,'Certains');
insert into reponse (id_reponse, id_question, nb_points, contenu) values (4,1,6,'Non Concerné');
insert into reponse (id_reponse, id_question, nb_points, contenu) values (5,2,6,'Oui');
insert into reponse (id_reponse, id_question, nb_points, contenu) values (6,2,0,'Non');
insert into reponse (id_reponse, id_question, nb_points, contenu) values (7,2,3,'Certains');
insert into reponse (id_reponse, id_question, nb_points, contenu) values (8,2,6,'Non Concerné');

