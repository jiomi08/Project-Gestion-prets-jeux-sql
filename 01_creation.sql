PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS "ADHERENT" (
	"id_adherent"	INTEGER,
	"nom"	TEXT NOT NULL,
	"prenom"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"date_inscription"	TEXT NOT NULL,
	PRIMARY KEY("id_adherent")
);
CREATE TABLE IF NOT EXISTS "BOITE" (
	"id_boite"	INTEGER,
	"etat"	TEXT NOT NULL,
	"id_jeu"	INTEGER,
	PRIMARY KEY("id_boite"),
	FOREIGN KEY("id_jeu") REFERENCES "JEU"("id_jeu")
);
CREATE TABLE IF NOT EXISTS "EMPRUNT" (
	"id_emprunt"	INTEGER,
	"date_depart"	TEXT NOT NULL,
	"dateRet_prevue"	TEXT NOT NULL,
	"dateRet_reel"	TEXT,
	"id_adherent" INTEGER NOT NULL ,
	"id_boite"	INTEGER NOT NULL,
	PRIMARY KEY("id_emprunt"),
	FOREIGN KEY("id_adherent") REFERENCES "ADHERENT"("id_adherent"),
	FOREIGN KEY("id_boite") REFERENCES "BOITE"("id_boite")
);
CREATE TABLE IF NOT EXISTS "JEU" (
	"id_jeu" INTEGER NOT NULL,
	"titre"	TEXT NOT NULL,
	"nb_joueur_min"	INTEGER NOT NULL,
	"nb_joueur_max"	INTEGER NOT NULL,
	"age_min"	INTEGER NOT NULL,
	"duree"	INTEGER NOT NULL,
	PRIMARY KEY("id_jeu")
);
CREATE UNIQUE INDEX IF NOT EXISTS "un_emprunt_en_cours_par_boite" ON "EMPRUNT" (
	"id_boite"
) WHERE "dateRet_reel" IS NULL;
COMMIT;