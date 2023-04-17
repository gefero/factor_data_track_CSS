library(tidyverse)

radios <- read_csv("./clase4/data/censo_PHV_2010.csv")


radios <- radios %>%
        mutate(`HOGAR.Régimen.tenencia._.Propietario` = 
                       `HOGAR.Régimen.tenencia._.Propietario.vivienda.y.terreno` +       
                       `HOGAR.Régimen.tenencia._.Propietario.sólo.de.la.vivienda`)

cols <- c("RADIO", "PROVINCIA", "DEPTO",
        "HOGAR.Al.menos.un.indicador.NBI._.Hogares.sin.NBI", 
          "HOGAR.Baño.uso.exclusivo._.Usado.sólo.p.este.hogar",
          "HOGAR.Combustible.para.cocinar._.Gas.de.red",
          "HOGAR.Desagüe.del.inodoro._.A.red.pública.cloaca",
          "HOGAR.Material.techo._.Cubierta sfáltica.o.membrana",
          "HOGAR.Material.pisos._.Cerámica.baldosa.mármol.madera.alfombra",
          "HOGAR.Fuente.agua.para.beber.y.cocinar._.Red.pública",
          "HOGAR.Revestimiento.interior.o.cielorraso.del.techo._.Sí",
          "HOGAR.Tenencia.de.agua._.Por.cañeria.dentro.de.la.vivienda",
          "HOGAR.Tiene.baño.o.letrina._.Sí",
          "HOGAR.Tiene.botón.cadena.mochila.p.limpieza.del.inodoro._.Sí",
          "HOGAR.Régimen.tenencia._.Propietario")

radios <- radios %>% select(all_of(cols))

names(radios) <- c(names(radios)[1:3], names(radios)[4:15] %>% stringr::str_extract(., "(?<=HOGAR.).*"))


radios <- radios %>%
        janitor::clean_names()

radios <- radios %>%
        rename(hogares_sin_nbi = al_menos_un_indicador_nbi_hogares_sin_nbi,
               banio_uso_exclusivo = bano_uso_exclusivo_usado_solo_p_este_hogar,
               cocina_gas_red = combustible_para_cocinar_gas_de_red,
               desague_red_cloaca = desague_del_inodoro_a_red_publica_cloaca,
               techo_membrana = material_techo_cubierta_sfaltica_o_membrana,
               piso_ceramica_baldosa = material_pisos_ceramica_baldosa_marmol_madera_alfombra,
               agua_de_red = fuente_agua_para_beber_y_cocinar_red_publica,
               revestimiento_techo = revestimiento_interior_o_cielorraso_del_techo_si,
               agua_canieria_dentro = tenencia_de_agua_por_caneria_dentro_de_la_vivienda,
               inodoro_con_cadena = tiene_boton_cadena_mochila_p_limpieza_del_inodoro_si)

write_csv(radios, './clase4/data/radios_hogar.csv')
