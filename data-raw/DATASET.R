## code to prepare `DATASET` dataset goes here

pef_2021 <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Bases_de_datos_presupuesto/CSV/PEF_2021.csv")
transversales_2021 <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Bases_de_datos_presupuesto/CSV/anexos_transversales_ppef2021.csv")


usethis::use_data(pef_2021, overwrite = TRUE)
usethis::use_data(transversales_2021, overwrite = TRUE)
