#library("selectr")
#library("xml2")
library("rvest")
library("tibble")
library("purrr")
library("xlsx")
#library("stringr")
#library("lubridate")
library("tidyverse")

page_urls1 <- c("https://www.booli.se/slutpriser/sandfjardsgatan/109205/", 
                paste0("https://www.booli.se/slutpriser/sandfjardsgatan/109205/?page=", 2:10))

page_urls2 <- c("https://www.booli.se/slutpriser/boforsgatan/98057/",
                paste0("https://www.booli.se/slutpriser/boforsgatan/98057/?page=", 2))

page_urls3 <- c("https://www.booli.se/slutpriser/gavlegatan/101687/",
                paste0("https://www.booli.se/slutpriser/gavlegatan/101687/?page=", 2:5))

page_urls4 <- c("https://www.booli.se/slutpriser/sonja+kovalevskys+gata/952326/",
                paste0("https://www.booli.se/slutpriser/sonja+kovalevskys+gata/952326/?page=", 2))

page_urls5 <- c("https://www.booli.se/slutpriser/tegelviksgatan/112192/",
                paste0("https://www.booli.se/slutpriser/tegelviksgatan/112192/?page=", 2:4))

page_urls6 <- c("https://www.booli.se/slutpriser/ekholmsvagen/99535/",
                paste0("https://www.booli.se/slutpriser/ekholmsvagen/99535/?page=", 2:6))

page_urls7 <- c("https://www.booli.se/slutpriser/fargargardstorget/100684/",
                paste0("https://www.booli.se/slutpriser/fargargardstorget/100684/?page=", 2:3))

page_urls8 <- c("https://www.booli.se/slutpriser/vintertullstorget/113886/",
                paste0("https://www.booli.se/slutpriser/vintertullstorget/113886/?page=", 2))

page_urls9 <- c("https://www.booli.se/slutpriser/igeldammsgatan/103062/",
                paste0("https://www.booli.se/slutpriser/igeldammsgatan/103062/?page=", 2:6))

page_urls10 <- c("https://www.booli.se/slutpriser/stickelbarsvagen/426534/")

page_urls11 <- c("https://www.booli.se/slutpriser/sandalettgatan/957643/")

page_urls12 <- c("https://www.booli.se/slutpriser/vanadisvagen/113437/",
                 paste0("https://www.booli.se/slutpriser/vanadisvagen/113437/?page=", 2:7))

page_urls13 <- c("https://www.booli.se/slutpriser/svartviksslingan/111546/",
                 paste0("https://www.booli.se/slutpriser/svartviksslingan/111546/?page=", 2:11))

page_urls14 <- c("https://www.booli.se/slutpriser/sandfjardsgatan/109205/",
                 paste0("https://www.booli.se/slutpriser/sandfjardsgatan/109205/?page=", 2:10))

page_urls15 <- c("https://www.booli.se/slutpriser/solberga+angsvag/110461/",
                 paste0("https://www.booli.se/slutpriser/solberga+angsvag/110461/?page=", 2))

page_urls16 <- c("https://www.booli.se/slutpriser/ballonggatan/97256/",
                 paste0("https://www.booli.se/slutpriser/ballonggatan/97256/?page=", 2))

page_urls17 <- c("https://www.booli.se/slutpriser/planterarvagen/107964/")

page_urls18 <- c("https://www.booli.se/slutpriser/karlsviksgatan/90892/",
                 paste0("https://www.booli.se/slutpriser/karlsviksgatan/90892/?page=", 2:7))

page_urls19 <- c("https://www.booli.se/slutpriser/hantverkargatan/90974/",
                 paste0("https://www.booli.se/slutpriser/hantverkargatan/90974/?page=", 2:6))

page_urls20 <- c("https://www.booli.se/slutpriser/sandhamnsgatan/90860/",
                 paste0("https://www.booli.se/slutpriser/sandhamnsgatan/90860/?page=", 2:11))

page_urls21 <- c("https://www.booli.se/slutpriser/uppvindsgatan/113227/")

page_urls22 <- c("https://www.booli.se/slutpriser/agnes+lagerstedts+gata/429659/")

page_urls23 <- c("https://www.booli.se/slutpriser/alstromergatan/90979/",
                 paste0("https://www.booli.se/slutpriser/alstromergatan/90979/?page=", 2:15))

page_urls24 <- c("https://www.booli.se/slutpriser/aprikosgatan/96937/",
                 paste0("https://www.booli.se/slutpriser/aprikosgatan/96937/?page=", 2:5))

page_urls25 <- c("https://www.booli.se/slutpriser/avestagatan/97111/")

page_urls26 <- c("https://www.booli.se/slutpriser/bengt+bagares+grand/97409/")

page_urls27 <- c("https://www.booli.se/slutpriser/borgarfjordsgatan/449310/",
                 paste0("https://www.booli.se/slutpriser/borgarfjordsgatan/449310/?page=", 2:6))

page_urls28 <- c("https://www.booli.se/slutpriser/folkparksvagen/100247/",
                 paste0("https://www.booli.se/slutpriser/folkparksvagen/100247/?page=", 2:5))

page_urls29 <- c("https://www.booli.se/slutpriser/fruangstorget/100463/",
                 paste0("https://www.booli.se/slutpriser/fruangstorget/100463/?page=", 2))

page_urls30 <- c("https://www.booli.se/slutpriser/fyrvaktarkroken/100585/",
                 paste0("https://www.booli.se/slutpriser/fyrvaktarkroken/100585/?page=", 2:6))

page_urls31 <- c("https://www.booli.se/slutpriser/gondolgatan/101076/")

page_urls32 <- c("https://www.booli.se/slutpriser/helsingorsgatan/102204/",
                 paste0("https://www.booli.se/slutpriser/helsingorsgatan/102204/?page=", 2:7))

page_urls33 <- c("https://www.booli.se/slutpriser/hildebergsvagen/90965/",
                 paste0("https://www.booli.se/slutpriser/hildebergsvagen/90965/?page=", 2:5))

page_urls34 <- c("https://www.booli.se/slutpriser/huvudfabriksgatan/102625/",
                 paste0("https://www.booli.se/slutpriser/huvudfabriksgatan/102625/?page=", 2))

page_urls35 <- c("https://www.booli.se/slutpriser/kanngjutargrand/103519/")

page_urls36 <- c("https://www.booli.se/slutpriser/kista+all%C3%A9vag/449435/",
                 paste0("https://www.booli.se/slutpriser/kista+all%C3%A9vag/449435/?page=", 2))

page_urls37 <- c("https://www.booli.se/slutpriser/kungssatravagen/104515/",
                 paste0("https://www.booli.se/slutpriser/kungssatravagen/104515/?page=", 2:5))

page_urls38 <- c("https://www.booli.se/slutpriser/lillhagsvagen/90870/",
                 paste0("https://www.booli.se/slutpriser/lillhagsvagen/90870/?page=", 2:3))

page_urls39 <- c("https://www.booli.se/slutpriser/ljusnevagen/105501/",
                 paste0("https://www.booli.se/slutpriser/ljusnevagen/105501/?page=", 2:3))

page_urls40 <- c("https://www.booli.se/slutpriser/lm+ericssons+vag/105509/",
                 paste0("https://www.booli.se/slutpriser/lm+ericssons+vag/105509/?page=", 2))

page_urls41 <- c("https://www.booli.se/slutpriser/lotta+svards+grand/429690/",
                 paste0("https://www.booli.se/slutpriser/lotta+svards+grand/429690/?page=", 2:4))

page_urls42 <- c("https://www.booli.se/slutpriser/mariehallsvagen/106162/",
                 paste0("https://www.booli.se/slutpriser/mariehallsvagen/106162/?page=", 2:4))

page_urls43 <- c("https://www.booli.se/slutpriser/nathorstvagen/106814/",
                 paste0("https://www.booli.se/slutpriser/nathorstvagen/106814/?page=", 2:5))

page_urls44 <- c("https://www.booli.se/slutpriser/nina+einhorns+gata/973959/",
                 paste0("https://www.booli.se/slutpriser/nina+einhorns+gata/973959/?page=", 2))

page_urls45 <- c("https://www.booli.se/slutpriser/nordenflychtsvagen/106952/",
                 paste0("https://www.booli.se/slutpriser/nordenflychtsvagen/106952/?page=", 2))

page_urls46 <- c("https://www.booli.se/slutpriser/observatoriegatan/107439/",
                 paste0("https://www.booli.se/slutpriser/observatoriegatan/107439/?page=", 2:4))

page_urls47 <- c("https://www.booli.se/slutpriser/pepparvagen/428280/",
                 paste0("https://www.booli.se/slutpriser/pepparvagen/428280/?page=", 2))

page_urls48 <- c("https://www.booli.se/slutpriser/petrejusvagen/107880/",
                 paste0("https://www.booli.se/slutpriser/petrejusvagen/107880//?page=", 2:3))

page_urls49 <- c("https://www.booli.se/slutpriser/pilotgatan/107916/",
                 paste0("https://www.booli.se/slutpriser/pilotgatan/107916/?page=", 2:4))

page_urls50 <- c("https://www.booli.se/slutpriser/p+o+hallmans+gata/90978/")

page_urls51 <- c("https://www.booli.se/slutpriser/polhemsgatan/108008/",
                 paste0("https://www.booli.se/slutpriser/polhemsgatan/108008/?page=", 2:8))

page_urls52 <- c("https://www.booli.se/slutpriser/reimersholmsgatan/90953/",
                 paste0("https://www.booli.se/slutpriser/reimersholmsgatan/90953/?page=", 2:3))

page_urls53 <- c("https://www.booli.se/slutpriser/responsgatan/296729/",
                 paste0("https://www.booli.se/slutpriser/responsgatan/296729/?page=", 2))

page_urls54 <- c("https://www.booli.se/slutpriser/rosterigrand/941659/")

page_urls55 <- c("https://www.booli.se/slutpriser/rackstavagen/108832/",
                 paste0("https://www.booli.se/slutpriser/rackstavagen/108832/?page=", 2:3))

page_urls56 <- c("https://www.booli.se/slutpriser/salagatan/109127/",
                 paste0("https://www.booli.se/slutpriser/salagatan/109127/?page=", 2:3))

page_urls57 <- c("https://www.booli.se/slutpriser/skedviksvagen/109733/",
                 paste0("https://www.booli.se/slutpriser/skedviksvagen/109733/?page=", 2))

page_urls58 <- c("https://www.booli.se/slutpriser/skyllbergsgatan/110031/")

page_urls59 <- c("https://www.booli.se/slutpriser/skontorpsvagen/110126/",
                 paste0("https://www.booli.se/slutpriser/skontorpsvagen/110126/?page=", 2:12))

page_urls60 <- c("https://www.booli.se/slutpriser/slattervallsgatan/899047/",
                 paste0("https://www.booli.se/slutpriser/slattervallsgatan/899047/?page=", 2))

page_urls61 <- c("https://www.booli.se/slutpriser/starrangsringen/110774/",
                 paste0("https://www.booli.se/slutpriser/starrangsringen/110774/?page=", 2:3))

page_urls62 <- c("https://www.booli.se/slutpriser/studentbacken/111309/",
                 paste0("https://www.booli.se/slutpriser/studentbacken/111309/?page=", 2))

page_urls63 <- c("https://www.booli.se/slutpriser/svardlangsvagen/90869/",
                 paste0("https://www.booli.se/slutpriser/svardlangsvagen/90869/?page=", 2:4))

page_urls64 <- c("https://www.booli.se/slutpriser/torsgatan/112642/",
                 paste0("https://www.booli.se/slutpriser/torsgatan/112642/?page=", 2:15))

page_urls65 <- c("https://www.booli.se/slutpriser/torvsatravagen/948559/")

page_urls66 <- c("https://www.booli.se/slutpriser/trollesundsvagen/112793/",
                 paste0("https://www.booli.se/slutpriser/trollesundsvagen/112793/?page=", 2:9))

page_urls67 <- c("https://www.booli.se/slutpriser/ture+wennerholms+torg/383061/")

page_urls68 <- c("https://www.booli.se/slutpriser/vintrosagatan/113898/",
                 paste0("https://www.booli.se/slutpriser/vintrosagatan/113898/?page=", 2:4))

page_urls69 <- c("https://www.booli.se/slutpriser/varmlandsvagen/114174/",
                 paste0("https://www.booli.se/slutpriser/varmlandsvagen/114174/?page=", 2:8))

page_urls70 <- c("https://www.booli.se/slutpriser/multragatan/106536/",
                 paste0("https://www.booli.se/slutpriser/multragatan/106536/?page=", 2:4))

page_urls71 <- c("https://www.booli.se/slutpriser/skagafjordsgatan/400022/",
                 paste0("https://www.booli.se/slutpriser/skagafjordsgatan/400022/?page=", 2))

page_urls72 <- c("https://www.booli.se/slutpriser/carl+akrells+gata/98843/")

page_urls73 <- c("https://www.booli.se/slutpriser/eksatravagen/99589/",
                 paste0("https://www.booli.se/slutpriser/eksatravagen/99589/?page=", 2:3))

page_urls74 <- c("https://www.booli.se/slutpriser/lovangsgatan/912995/")

page_urls75 <- c("https://www.booli.se/slutpriser/vantorsvagen/113445/",
                 paste0("https://www.booli.se/slutpriser/vantorsvagen/113445/?page=", 2:4))

page_urls76 <- c("https://www.booli.se/slutpriser/algrytevagen/114622/",
                 paste0("https://www.booli.se/slutpriser/algrytevagen/114622/?page=", 2:4))

page_urls77 <- c("https://www.booli.se/slutpriser/pilottorget/149416/",
                 paste0("https://www.booli.se/slutpriser/pilottorget/149416/?page=", 2))

page_urls78 <- c("https://www.booli.se/slutpriser/skarpnacks+all%C3%A9/109706/",
                 paste0("https://www.booli.se/slutpriser/skarpnacks+all%C3%A9/109706/?page=", 2:3))

page_urls79 <- c("https://www.booli.se/slutpriser/kungsholms+strand/104506/",
                 paste0("https://www.booli.se/slutpriser/kungsholms+strand/104506/?page=", 2:10))

page_urls80 <- c("https://www.booli.se/slutpriser/langelandsgatan/104955/",
                 paste0("https://www.booli.se/slutpriser/langelandsgatan/104955/?page=", 2:3))

page_urls81 <- c("https://www.booli.se/slutpriser/lilla+bantorget/417281/")

page_urls82 <- c("https://www.booli.se/slutpriser/dalagatan/99012/",
                 paste0("https://www.booli.se/slutpriser/dalagatan/99012/?page=", 2:14))

page_urls83 <- c("https://www.booli.se/slutpriser/kungstensgatan/90970/",
                 paste0("https://www.booli.se/slutpriser/kungstensgatan/90970/?page=", 2:5))

page_urls84 <- c("https://www.booli.se/slutpriser/vastmannagatan/90888/",
                 paste0("https://www.booli.se/slutpriser/vastmannagatan/90888/?page=", 2:17))

page_urls85 <- c("https://www.booli.se/slutpriser/munstycksvagen/428291/")

page_urls86 <- c("https://www.booli.se/slutpriser/liljeholmsgrand/384740/",
                 paste0("https://www.booli.se/slutpriser/liljeholmsgrand/384740/?page=", 2))

page_urls87 <- c("https://www.booli.se/slutpriser/liljeholmsvagen/105164/",
                 paste0("https://www.booli.se/slutpriser/liljeholmsvagen/105164/?page=", 2:3))

page_urls88 <- c("https://www.booli.se/slutpriser/lindevagen/105334/",
                 paste0("https://www.booli.se/slutpriser/lindevagen/105334/?page=", 2))

page_urls89 <- c("https://www.booli.se/slutpriser/fridhemsgatan/90959/",
                 paste0("https://www.booli.se/slutpriser/fridhemsgatan/90959/?page=", 2:15))

page_urls90 <- c("https://www.booli.se/slutpriser/mitisgatan/106386/")

page_urls91 <- c("https://www.booli.se/slutpriser/hallovagen/427529/",
                 paste0("https://www.booli.se/slutpriser/hallovagen/427529/?page=", 2:3))

page_urls92 <- c("https://www.booli.se/slutpriser/fallvindsgatan/99952/",
                 paste0("https://www.booli.se/slutpriser/fallvindsgatan/99952/?page=", 2))

page_urls93 <- c("https://www.booli.se/slutpriser/tengdahlsgatan/112242/")

page_urls94 <- c("https://www.booli.se/slutpriser/svarvargatan/90961/",
                 paste0("https://www.booli.se/slutpriser/svarvargatan/90961/?page=", 2:5))

page_urls95 <- c("https://www.booli.se/slutpriser/korsbarsvagen/104879/",
                 paste0("https://www.booli.se/slutpriser/korsbarsvagen/104879/?page=", 2:3))

page_urls96 <- c("https://www.booli.se/slutpriser/spikskogatan/957644/")

page_urls97 <- c("https://www.booli.se/slutpriser/norrtullsgatan/107163/",
                 paste0("https://www.booli.se/slutpriser/norrtullsgatan/107163/?page=", 2:10))

page_urls98 <- c("https://www.booli.se/slutpriser/glidflyktsgatan/101025/")

page_urls99 <- c("https://www.booli.se/slutpriser/segelflygsgatan/109361/",
                 paste0("https://www.booli.se/slutpriser/segelflygsgatan/109361/?page=", 2:3))




page_urls <-c(page_urls1, page_urls2,page_urls3, page_urls4, page_urls5,
              page_urls6, page_urls7, page_urls8, page_urls9,
              page_urls10, page_urls11, page_urls12, page_urls13,
              page_urls14, page_urls15, page_urls16, page_urls17,
              page_urls18, page_urls19, page_urls20, page_urls21, 
              page_urls22, page_urls23, page_urls24, page_urls25,
              page_urls26, page_urls27, page_urls28, page_urls29,
              page_urls30, page_urls31, page_urls32, page_urls33,
              page_urls34, page_urls35, page_urls36, page_urls37,
              page_urls38, page_urls39, page_urls40, page_urls41,
              page_urls42, page_urls43, page_urls44, page_urls45,
              page_urls46, 
              page_urls47, 
              #page_urls48, 
              page_urls49,
              page_urls50, page_urls51, page_urls52, page_urls53,
              page_urls54, page_urls55, page_urls56, page_urls57,
              page_urls58, page_urls59, page_urls60, page_urls61,
              page_urls62, page_urls63, page_urls64, page_urls65,
              page_urls66, page_urls67, page_urls68, page_urls69,
              page_urls70, page_urls71, page_urls72, page_urls73,
              page_urls74, page_urls75, page_urls76, page_urls77,
              page_urls78, page_urls79, page_urls80, page_urls81,
              page_urls82, page_urls83, page_urls84, page_urls85,
              page_urls86, page_urls87, page_urls88, page_urls89,
              page_urls90, page_urls91, page_urls92, page_urls93,
              page_urls94, page_urls95, page_urls96, page_urls97,
              page_urls98, page_urls99)


# custom function which scrapes data on each peage
# Input:
# - url: link to the webpage to scrape
# Output: tibble with the following columns: 
# - street, date of sale, price per kvm

scrape_data_booli <- function(url){
  
  webpage<-read_html(url)
  
  
  adress <- webpage %>%
    html_nodes(".search-list__row--address") %>%
    html_text() 
  
  
  kvmpris <- webpage %>%
    html_nodes(".search-list__row--price+ .search-list__row") %>%
    html_text() 
  
  
  datum <- webpage %>%
    html_nodes(".search-list__row--sold-date") %>%
    html_text() 
  
  tibble(adress, datum, kvmpris)
}



datan <- map_df(page_urls, scrape_data_booli)
  

#View(datan)  
#rio::export(datan, "raw_data.xlsx")
  
  

  
  

  
