---auto increment on le définit plus simplement à la création avec SERIAL

--unique
--un métier unique
ALTER TABLE metier  ADD CONSTRAINT metier_unique UNIQUE (nom_metier);

--un libellé de catgorie unique par questionnaire
ALTER TABLE categorie_question  ADD CONSTRAINT cat_unique UNIQUE (id_questionnaire, libelle);


--un libellé de réponse unique par question  ici contenu c'est libellé
ALTER TABLE reponse  ADD CONSTRAINT rep_unique UNIQUE (id_question, contenu);


--contenu de préconisation contenu unique dans la catégorie pour un questionnaire

alter table preconisation_categorie add constraint preco_unique unique (ID_PRECONISATION,id_categorie,contenu);

--contenu de préconisation globale unique par questionnaire 
alter table preconisation_globale add constraint preco_g_unique unique (ID_PRECONISATION_g,id_questionnaire,contenu);

--check id entreprise non null
--ALTER TABLE compte  ADD CONSTRAINT compte_atr CHECK ( _noentreprise__ is not null) NOT VALID;
--ALTER TABLE compte  VALIDATE CONSTRAINT compte_atr;


--viewIfPourcentageScoreLessThan de la catégorie entre 0 et 100
ALTER TABLE preconisation_categorie  ADD CONSTRAINT  score_positif 
CHECK ( preconisation_categorie.viewIfPourcentageScoreLessThan > 0 and preconisation_categorie.viewIfPourcentageScoreLessThan < 100);

--viewIfPourcentageScoreLessThan globale entre 0 et 100
ALTER TABLE preconisation_globale  ADD CONSTRAINT  score_positif_global 
CHECK ( preconisation_globale.viewIfPourcentageScoreLessThan > 0 and preconisation_globale.viewIfPourcentageScoreLessThan < 100);


-- triggers
--trigger 1 pour vérifier un labell unique par questionnaire
CREATE FUNCTION lib_quest() RETURNS trigger AS $lib_quest$
	declare
	nb int;
	
    BEGIN
        
         IF NEW.id_categorie IS NULL THEN
            RAISE EXCEPTION 'id categorie null';
        END IF;
        select id_questionnaire into idq from categorie_question where id_categorie = new.id_categorie;
        select count(*) into nb from question
		where (id_categorie in (SELECT id_categorie  FROM questionnaire q INNER JOIN categorie_question cq  ON q.id_questionnaire  = cq.id_questionnaire where q.id_questionnaire =idq)) 
		and libelle_question = new.libelle_question  ;
		
		if  (TG_OP = 'INSERT') then
	        IF nb > 0   then
	            RAISE EXCEPTION 'libelle existe déjà:  %  ', NEW.libelle_question;
	        END IF;
	    end if ;
	   
	    if (TG_OP = 'UPDATE') then
		    IF nb > 1  then
		            RAISE EXCEPTION 'libelle existe déjà:  %  ', NEW.libelle_question;
		    END IF;
		end if;
		return new;
        
    END;--
$lib_quest$ LANGUAGE plpgsql;

CREATE TRIGGER lib_quest BEFORE INSERT OR UPDATE ON question 
    FOR EACH ROW EXECUTE PROCEDURE lib_quest();