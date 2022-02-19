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
	aQuestionId int;
	
    BEGIN
        if old is null then
        	aQuestionId := new.id_question;
       	else 
       		aQuestionId := old.id_question;
       	end if;
        SELECT q_type into type_quest from question where id_question=aQuestionId;
        if type_quest = 'QUESTION_CHOIX_UNIQUE' THEN
            SELECT max(nb_points) into score_max FROM reponse  WHERE reponse.id_question = aQuestionId ;
        else
            SELECT SUM (nb_points) into score_max FROM reponse  WHERE reponse.id_question = aQuestionId and reponse.nb_points>=0;
        end if;
        IF score_max  IS NULL THEN
            RAISE EXCEPTION 'error id_question introuvable';
        else
        	UPDATE question  SET score_max_possible  = score_max  WHERE id_question = aQuestionId; 
        END IF;
       	if old is null then
			return new;
		else 
			return old;
		end if;
        
    END;--
$lib_quest$ LANGUAGE plpgsql;

CREATE TRIGGER lib_quest BEFORE INSERT OR UPDATE ON question 
    FOR EACH ROW EXECUTE PROCEDURE lib_quest();