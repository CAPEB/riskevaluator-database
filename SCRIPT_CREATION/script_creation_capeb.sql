-- public.entreprise definition
-- Drop table
-- DROP TABLE public.entreprise;
CREATE TABLE public.entreprise (
	noentreprise serial4 NOT NULL,
	anneedecreation int4 NULL,
	effectif int4 NULL,
	nosiret varchar(255) NULL,
	nom_entreprise varchar(255) NULL,
	CONSTRAINT entreprise_pkey PRIMARY KEY (noentreprise)
);
-- public.metier definition
-- Drop table
-- DROP TABLE public.metier;
CREATE TABLE public.metier (
	id_metier serial4 NOT NULL,
	nom_metier varchar(255) NOT NULL,
	CONSTRAINT metier_pkey PRIMARY KEY (id_metier)
);
-- public.questionnaire definition
-- Drop table
-- DROP TABLE public.questionnaire;
CREATE TABLE public.questionnaire (
	id_questionnaire serial4 NOT NULL,
	thematique varchar(255) NOT NULL,
	CONSTRAINT questionnaire_pkey PRIMARY KEY (id_questionnaire),
	CONSTRAINT ukhnqfog8s68hf67f8ysrrnj0st UNIQUE (thematique)
);
-- public.categorie_question definition
-- Drop table
-- DROP TABLE public.categorie_question;
CREATE TABLE public.categorie_question (
	id_categorie serial4 NOT NULL,
	libelle varchar(255) NOT NULL,
	id_questionnaire int4 NOT NULL,
	CONSTRAINT categorie_question_pkey PRIMARY KEY (id_categorie),
	CONSTRAINT fkdrxl0k0ggi4rajmluvo4nnkoc FOREIGN KEY (id_questionnaire) REFERENCES public.questionnaire(id_questionnaire)
);
-- public.compte definition
-- Drop table
-- DROP TABLE public.compte;
CREATE TABLE public.compte (
	id_compte serial4 NOT NULL,
	creation_date date NULL,
	first_name varchar(255) NULL,
	is_admin bool NULL,
	is_cgu bool NULL,
	is_forgotpass bool NULL,
	is_temp_password varchar(255) NULL,
	is_valid bool NULL,
	last_login date NULL,
	mail varchar(255) NULL,
	"name" varchar(255) NULL,
	pwd varchar(255) NULL,
	noentreprise int4 NOT NULL,
	CONSTRAINT compte_pkey PRIMARY KEY (id_compte),
	CONSTRAINT fk53wyy5y93qsjp6v32an1grte3 FOREIGN KEY (noentreprise) REFERENCES public.entreprise(noentreprise)
);
-- public.evaluation definition
-- Drop table
-- DROP TABLE public.evaluation;
CREATE TABLE public.evaluation (
	id_evaluation serial4 NOT NULL,
	id_compte int4 NOT NULL,
	CONSTRAINT evaluation_pkey PRIMARY KEY (id_evaluation),
	CONSTRAINT fkfw17o0msl05lapxwndpi2qof7 FOREIGN KEY (id_compte) REFERENCES public.compte(id_compte)
);
-- public.preconisation_categorie definition
-- Drop table
-- DROP TABLE public.preconisation_categorie;
CREATE TABLE public.preconisation_categorie (
	id_preconisation serial4 NOT NULL,
	contenu text NULL,
	view_if_pourcentage_score_less_than int4 NULL,
	id_categorie int4 NOT NULL,
	CONSTRAINT preconisation_categorie_pkey PRIMARY KEY (id_preconisation),
	CONSTRAINT fk1tinogp2sxqftkin8bfw0jp8e FOREIGN KEY (id_categorie) REFERENCES public.categorie_question(id_categorie)
);
-- public.preconisation_globale definition
-- Drop table
-- DROP TABLE public.preconisation_globale;
CREATE TABLE public.preconisation_globale (
	id_preconisation_g serial4 NOT NULL,
	contenu text NULL,
	view_if_pourcentage_score_less_than int4 NULL,
	id_questionnaire int4 NOT NULL,
	CONSTRAINT preconisation_globale_pkey PRIMARY KEY (id_preconisation_g),
	CONSTRAINT fkedtr0ur7drk38mudmpjtwijl6 FOREIGN KEY (id_questionnaire) REFERENCES public.questionnaire(id_questionnaire)
);
-- public.question definition
-- Drop table
-- DROP TABLE public.question;
CREATE TABLE public.question (
	id_question serial4 NOT NULL,
	aide varchar(255) NULL,
	libelle_question text NULL,
	q_type varchar(255) NULL,
	id_categorie int4 NOT NULL,
	CONSTRAINT question_pkey PRIMARY KEY (id_question),
	CONSTRAINT fkj58hfx2dxu7wje6poknogkwfn FOREIGN KEY (id_categorie) REFERENCES public.categorie_question(id_categorie)
);
-- public.reponse definition
-- Drop table
-- DROP TABLE public.reponse;
CREATE TABLE public.reponse (
	id_reponse serial4 NOT NULL,
	contenu text NULL,
	nb_points int4 NULL,
	id_question int4 NOT NULL,
	CONSTRAINT reponse_pkey PRIMARY KEY (id_reponse),
	CONSTRAINT fk7utui46seipahjep29ytvvwep FOREIGN KEY (id_question) REFERENCES public.question(id_question)
);
-- public.score_category definition
-- Drop table
-- DROP TABLE public.score_category;
CREATE TABLE public.score_category (
	id_categorie int4 NOT NULL,
	id_evaluation int4 NOT NULL,
	nb_points int4 NULL,
	CONSTRAINT score_category_pkey PRIMARY KEY (id_categorie, id_evaluation),
	CONSTRAINT fk78v7np6darpj0o1dp1n8f3viw FOREIGN KEY (id_evaluation) REFERENCES public.evaluation(id_evaluation),
	CONSTRAINT fk8wjhr1aeaoeq1gmogf3ryanhb FOREIGN KEY (id_categorie) REFERENCES public.categorie_question(id_categorie)
);
-- public.metier_question definition
-- Drop table
-- DROP TABLE public.metier_question;
CREATE TABLE public.metier_question (
	id_metier int4 NOT NULL,
	id_question int4 NOT NULL,
	CONSTRAINT metier_question_pkey PRIMARY KEY (id_metier, id_question),
	CONSTRAINT fki0m5r78avsaiuo327pwqhl40k FOREIGN KEY (id_question) REFERENCES public.question(id_question),
	CONSTRAINT fktlbo1il3jml4knpfe6kqx7jm7 FOREIGN KEY (id_metier) REFERENCES public.metier(id_metier)
);
