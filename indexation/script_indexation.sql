CREATE INDEX idx_questionnaire_categorie_question ON categorie_question(id_questionnaire);


CREATE INDEX idx_eval_compte ON evaluation (id_compte);


CREATE INDEX idx_eval_entre ON evaluation (id_entreprise);


CREATE INDEX idx_preconisation_categorie ON preconisation_categorie(id_categorie);


CREATE INDEX idx_preco_glob_question ON preconisation_globale(id_questionnaire);


CREATE INDEX idx_cate_question ON question(id_categorie);


CREATE INDEX idx_reponse_question ON reponse(id_question);
