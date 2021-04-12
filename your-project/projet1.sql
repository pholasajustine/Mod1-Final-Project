CREATE DATABASE projet1;
USE projet1;

CREATE TEMPORARY TABLE alternance
SELECT offres_alternance.`place.departement`, `departements-france`.nom_departement, offres_alternance.month, 
COUNT(offres_alternance.month) As nb_alternances
FROM `departements-france`
LEFT JOIN offres_alternance
ON code_departement = `place.departement`
GROUP BY offres_alternance.month, `departements-france`.code_departement;

CREATE TEMPORARY TABLE covid
SELECT `departements-france`.code_departement, `departements-france`.nom_departement, 
covid_incidence_dep.mois, covid_incidence_dep.taux_incidence
FROM `departements-france`
LEFT JOIN covid_incidence_dep
ON code_departement = departement;

SELECT covid.code_departement, covid.nom_departement, covid.mois, covid.taux_incidence, alternance.nb_alternances
FROM covid
LEFT JOIN alternance
ON code_departement = `place.departement`;
