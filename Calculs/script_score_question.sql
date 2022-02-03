--on ajoute une colone score_max_possible pour une question
ALTER TABLE question  ADD COLUMN score_max_possible int DEFAULT 0;


--trigger qui calcule le score max possible d'une question après un insert un update des réponses de cette question
CREATE FUNCTION score_max_question() RETURNS trigger AS $score_max_question$
	declare
	score_max int;
	
    BEGIN
        SELECT SUM (nb_points) into score_max FROM reponse  WHERE reponse.id_question = new.id_question ;
       
        IF score_max  IS NULL THEN
            RAISE EXCEPTION 'error id_question introuvable';
        else
        	UPDATE question  SET score_max_possible  = score_max  WHERE id_question = new.id_question; 
        END IF;
        
		return new;
        
    END;--
$score_max_question$ LANGUAGE plpgsql;

CREATE TRIGGER score_max_question after INSERT OR UPDATE ON reponse 
    FOR EACH ROW EXECUTE PROCEDURE score_max_question();