## code to prepare `DATASET` dataset goes here

pef_2021 <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Bases_de_datos_presupuesto/CSV/PEF_2021.csv")
transversales_2021 <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Bases_de_datos_presupuesto/CSV/anexos_transversales_ppef2021.csv")
aspectos_susceptibles_mejora <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Programas/sed/aspectos_susceptibles_mejora.csv")
evaluaciones <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Programas/sed/evaluaciones.csv")

usethis::use_data(pef_2021, overwrite = TRUE)
usethis::use_data(transversales_2021, overwrite = TRUE)
usethis::use_data(aspectos_susceptibles_mejora, overwrite = TRUE)
usethis::use_data(evaluaciones, overwrite = TRUE)
