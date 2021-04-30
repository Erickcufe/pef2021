datos <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Bases_de_datos_presupuesto/CSV/PEF_2021.csv")
trans <- vroom::vroom("https://www.transparenciapresupuestaria.gob.mx/work/models/PTP/DatosAbiertos/Bases_de_datos_presupuesto/CSV/anexos_transversales_ppef2021.csv")

summary(datos)
sum(datos$MONTO_APROBADO, na.rm = TRUE)
datos$ID_ENTIDAD_FEDERATIVA <- as.factor(datos$ID_ENTIDAD_FEDERATIVA)

ggplot(datos, aes(x = ID_ENTIDAD_FEDERATIVA, y = MONTO_APROBADO)) +
  geom_point() + theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 0.1))

# Ramo 38 es el correspondiente a conacyt
# Programa trnasversal

transversal <- 35243171
gasto <- 26573104028
laborales <- 224105958
pcity <- 30291180394
erogacion_h_m <- 5162370696
cambio_climatico <- 259103342
desarrollo_jovenes <- 40681358

sum(transversal, gasto, laborales, pcity, erogacion_h_m,
    cambio_climatico, desarrollo_jovenes)

pecity_total <- 102720793059

egreso_total <- 6295736200000

pecity_total / egreso_total *100

library(dplyr)
# ID_RAMO
# ID_UR

datos_filtrados <- datos %>% filter(ID_RAMO == 38)
datos_filtrados$ID_ENTIDAD_FEDERATIVA <- as.factor(datos_filtrados$ID_ENTIDAD_FEDERATIVA)

table(datos_filtrados$GPO_FUNCIONAL)

sum(datos_filtrados[datos_filtrados$GPO_FUNCIONAL == 1, "MONTO_APROBADO"])
inv_cient <- datos_filtrados[datos_filtrados$ID_SUBFUNCION == 1, ]
sum(datos_filtrados[datos_filtrados$GPO_FUNCIONAL == 3, "MONTO_APROBADO"])
sum(datos_filtrados[datos_filtrados$ID_SUBFUNCION == 1, "MONTO_APROBADO"])

cap_4000 <- datos_filtrados[datos_filtrados$ID_CAPITULO == 4000,]
sum(datos_filtrados[datos_filtrados$ID_CAPITULO == 4000, "MONTO_APROBADO"])

ggplot(cap_4000, aes(DESC_CONCEPTO, MONTO_APROBADO))+
  geom_col()+ theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 0.1))

ggplot(cap_4000, aes(ID_ENTIDAD_FEDERATIVA, MONTO_APROBADO))+
  geom_col()+ theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 0.1))

ggplot(cap_4000, aes(DESC_PP, MONTO_APROBADO))+
  geom_col()+ theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 0.1))

i_funcion <- datos %>% filter(ID_FUNCION==8)

i_funcion %>% group_by(DESC_RAMO) %>% summarise(sum(MONTO_APROBADO, na.rm = TRUE))

conacyt <- i_funcion  %>%
  group_by(DESC_RAMO, DESC_UR, DESC_PP, ID_ENTIDAD_FEDERATIVA) %>% summarise(suma =sum(MONTO_APROBADO, na.rm = TRUE))

ver <- datos %>% filter(DESC_PP == "CONACYT")

sum(i_funcion$MONTO_APROBADO, na.rm = TRUE)



