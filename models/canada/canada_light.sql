SELECT
  PERIODE_DE_REFERENCE, 
  GEO,
  Groupe_d_age, 
  Sexe, 
  Indicateurs, 
  Caracteristiques, 
  UNITE_DE_MESURE, 
  VALEUR
  from {{ source('canada', 'canada_light') }}