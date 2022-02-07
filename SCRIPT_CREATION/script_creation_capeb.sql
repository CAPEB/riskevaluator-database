create table ENTREPRISE (
   NOSIRET              int                 null,
   NOM_ENTREPRISE                TEXT                 null,
   EFFECTIF             INT4                 null,
   ANNEEDECREATION      INT4                 null,
   constraint PK_ENTREPRISE primary key (NOSIRET)
);

create table COMPTE (
   ID_COMPTE            SERIAL               ,
  -- _NOENTREPRISE__      INT4                 not null,
   IS_ADMIN             BOOL                 not null,
   MAIL                 TEXT                 not null,
   PWD                  TEXT                 not null,
   _NAME                TEXT                 null,
   FIRST_NAME           TEXT                 null,
   IS_VALID             BOOL                 not null,
   CREATION_DATE        DATE                 null,
   LAST_LOGIN           DATE                 null,
   IS_CGU               BOOL                 null,
   IS_FORGOTPASS        BOOL                 null,
   IS_TEMP_PASSWORD     TEXT                 null,
   constraint PK_COMPTE primary key (ID_COMPTE)
);

create table CATEGORIE_QUESTION (
   ID_CATEGORIE         SERIAL               ,
   ID_QUESTIONNAIRE     INT4                 not null,
   libelle              TEXT                 not null,
   constraint PK_CATEGORIE_QUESTION primary key (ID_CATEGORIE)
);

create table EVALUATION (
   ID_EVALUATION        SERIAL               ,
   ID_COMPTE            INT4                 not null,
   ID_ENTREPRISE        INT4                 not null,
   constraint PK_EVALUATION primary key (ID_EVALUATION)
);

create table METIER (
   ID_METIER            SERIAL               ,
   NOM_METIER           TEXT                not null,
   constraint PK_METIER primary key (ID_METIER)
);

create table METIER_QUESTION (
   ID_QUESTION          INT4                 not null,
   ID_METIER            INT4                 not null,
   constraint PK_METIER_QUESTION primary key (ID_QUESTION, ID_METIER)
);

create table PRECONISATION_CATEGORIE (
   ID_PRECONISATION     SERIAL               ,
   ID_CATEGORIE         INT4                 not null,
   contenu     text        null,
   viewIfPourcentageScoreLessThan       INT4                 null,
   constraint PK_PRECONISATION_CATEGORIE primary key (ID_PRECONISATION)
);

create table PRECONISATION_GLOBALE (
   ID_PRECONISATION_G   SERIAL               ,
   ID_QUESTIONNAIRE     INT4                 not null,
   CONTENU              TEXT                 null,
   viewIfPourcentageScoreLessThan       INT4                 null,
   constraint PK_PRECONISATION_GLOBALE primary key (ID_PRECONISATION_G)
);

CREATE TYPE TYPE_QUESTION AS ENUM ('Question Choix Unique', 'Question Choix Multiple');

create table QUESTION (
   ID_QUESTION          SERIAL                 ,
   ID_CATEGORIE         INT4                 not null,
   TYPE                 TYPE_QUESTION        null,
   LIBELLE_QUESTION     TEXT                 null,
   constraint PK_QUESTION primary key (ID_QUESTION)
);

create table QUESTIONNAIRE (
   ID_QUESTIONNAIRE     SERIAL               ,
   THEMATIQUE           TEXT                not null,
   constraint PK_QUESTIONNAIRE primary key (ID_QUESTIONNAIRE)
);

create table REPONSE (
   ID_REPONSE           SERIAL               ,
   ID_QUESTION          INT4                 not null,
   NB_POINTS            INT4                 not null,
   CONTENU              TEXT                 null,
   constraint PK_REPONSE primary key (ID_REPONSE)
);


create table SCORE_CATEGORY (
   ID_EVALUATION        INT4                 not null,
   ID_CATEGORIE         INT4                 not null,
   NB_POINTS            INT4                 null,
   constraint PK_SCORE_CATEGORY primary key (ID_EVALUATION, ID_CATEGORIE)
);


alter table SCORE_CATEGORY
   add constraint FK_ASSOCIAT_ASSOCIATI_EVALUATI foreign key (ID_EVALUATION)
      references EVALUATION (ID_EVALUATION)
      on delete restrict on update restrict;

alter table SCORE_CATEGORY
   add constraint FK_ASSOCIAT_ASSOCIATI_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIE_QUESTION (ID_CATEGORIE)
      on delete restrict on update restrict;

alter table CATEGORIE_QUESTION
   add constraint FK_CATEGORI_ASSOCIATI_QUESTION foreign key (ID_QUESTIONNAIRE)
      references QUESTIONNAIRE (ID_QUESTIONNAIRE)
      on delete restrict on update restrict;

/*alter table COMPTE
   add constraint FK_COMPTE_ASSOCIATI_ENTREPRI foreign key (_NOENTREPRISE__)
      references ENTREPRISE (_NOENTREPRISE__)
      on delete restrict on update restrict;*/

alter table EVALUATION
   add constraint FK_EVALUATI_ASSOCIATI_COMPTE foreign key (ID_COMPTE)
     references COMPTE (ID_COMPTE)
      on delete restrict on update restrict;
     
alter table EVALUATION  
   add constraint FK_ASSOCIAT_ENTREP_EVALUATI foreign key (ID_ENTREPRISE)
      references ENTREPRISE  (NOSIRET)
      on delete restrict on update restrict;

alter table METIER_QUESTION
   add constraint FK_METIER_Q_METIER_QU_QUESTION foreign key (ID_QUESTION)
      references QUESTION (ID_QUESTION)
      on delete restrict on update restrict;

alter table METIER_QUESTION
   add constraint FK_METIER_Q_METIER_QU_METIER foreign key (ID_METIER)
      references METIER (ID_METIER)
      on delete restrict on update restrict;

alter table PRECONISATION_CATEGORIE
   add constraint FK_PRECONIS_ASSOCIATI_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIE_QUESTION (ID_CATEGORIE)
      on delete restrict on update restrict;

alter table PRECONISATION_GLOBALE
   add constraint FK_PRECONIS_ASSOCIATI_QUESTION foreign key (ID_QUESTIONNAIRE)
      references QUESTIONNAIRE (ID_QUESTIONNAIRE)
      on delete restrict on update restrict;

alter table QUESTION
   add constraint FK_QUESTION_ASSOCIATI_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIE_QUESTION (ID_CATEGORIE)
      on delete restrict on update restrict;

alter table REPONSE
   add constraint FK_REPONSE_ASSOCIATI_QUESTION foreign key (ID_QUESTION)
      references QUESTION (ID_QUESTION)
      on delete restrict on update restrict;
