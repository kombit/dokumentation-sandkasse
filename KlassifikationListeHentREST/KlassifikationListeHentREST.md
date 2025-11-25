# <a name="7e630de5-045d-4222-8ce0-34cfc1c9225d"></a>KlassifikationListeHentREST

|Egenskaber:||
|----|----|
| Servicekategori: | Webservice |  
| Servicetype: | REST |  
| Sikkerhedsmodel: | JWT Token |  
  
## <a name="c23fa574-f50c-44a9-ab2b-5ce06e3d0300"></a>Operation: KlassifikationListeHentREST
### Signal: <a name="0fc684dc-7fe8-4a3b-9dac-1306c645352f"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [KlassifikationListeHent_I](#e1d2c614-71b5-480f-9bac-5c172dfa6e22)  
### Signal: <a name="e13ce7c1-08be-4248-828e-7cbf6979b422"></a>post_200
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [KlassifikationListeHent_O](#34665beb-5da1-4af2-8706-de0716d9b279)  
## Datastrukturer:


#### Datastruktur: <a name="d4956eb2-b613-4acf-8d53-0ebcb3606b8e"></a>FacetStruktur  
**UUID:** d4956eb2-b613-4acf-8d53-0ebcb3606b8e  
##### Short description
En facet angiver en bestemt synsvinkel på klassificering af de objekter, som klassifikationssystemet udgør taxonomien for. Facetten grupper klasser i klassifikationssystemet. Samme klasse kan kun tilhører en facet - i hele klassens gyldighedsperiode. Facetten er fastlagt sammen med klassifikationssystemet og har derved samme ejer, som klassifikationssystemet og derved samme gyldighedsperiode som klassifikation. Facetter kan opstå og nedlukkes under klassifikationssystemets gyldighedsperiode.


~~~
  FacetIdentifikation  
  FacetBrugervendtNøgle  
  FacetTitel  
  FacetBeskrivelse  
  (  
    FacetRetskilde  
  )  
  (  
    FacetEjer  
  )  
  (  
    FacetEjerCVRNummer  
  )  
  (  
    FacetPubliceretFraDato  
  )  
  (  
    FacetPubliceretTilDato  
  )  
  FacetSidstÆndretTidspunkt  
  *KlasseListe*  
  {  
    KlasseStruktur  
  }  
  
~~~
#### Datastruktur: <a name="1a03cb53-e719-4ed1-8bd2-6eadb0a55504"></a>KlasseStruktur  
**UUID:** 1a03cb53-e719-4ed1-8bd2-6eadb0a55504  
##### Short description
En klasse er en mængde hvori de indgående objekter har en eller flere egenskaber til fælles. Klassen er den specifikke reference, nøgle, til denne mængde.Hvis der ingen begrænsninger er i klassens gyldighed, returneres en tom KlassePubliceretListeHvis der søges data med publicerings-historik (KlassifikationPubliceretMarkering= AktuelMedHistorik), returneres en liste af klassePubliceringer. Der returneres senest gyldige attributter og relationer i den søgte periode (KlassifkationPubliceretFraDato til KlassifikationPubliceretTilDato )Et klassifikationssystem udgøres af klasser. Et objekt kan beskrives gennem flere klasser i klassifikationssystemet, hver af disse klasser skal være ordnet i forskellige facetter under klassifikationssystemet. * Klasseregel * Angiver typen af reglen, dvs. et udtryk for den forretningsmæssige betydning af reglen. * ForældreKlasse *Unik identifikation og brugervendt nøgle af den klasse, som er et niveau op i klassehierarkiet ift. nærværende klasse, forældreklassen (UUID). Vil være blank, såfremt klassen er top niveau under facetten.


~~~
  KlasseIdentifikation  
  KlasseBrugervendtNøgle  
  KlasseTitel  
  KlasseBeskrivelse  
  (  
    KlasseSortering  
  )  
  (  
    KlasseRetskilde  
  )  
  (  
    KlasseÆndringsnotat  
  )  
  (  
    KlasseEjer  
  )  
  (  
    KlasseEjerCVRNummer  
  )  
  KlasseSidstÆndretTidspunkt  
  *KlassePubliceretListe*  
  {  
    *KlassePubliceret*  
      [  
        (  
          KlassePubliceretFraDato  
        )  
        (  
          KlassePubliceretTilDato  
        )  
      ]  
  }  
  (  
    *KlasseSøgeordListe*  
    {  
      *KlasseSøgeord*  
        [  
          SøgeordTitel  
        ]  
    }  
  )  
  (  
    *ForældreKlasse*  
      [  
        KlasseIdentifikation  
        KlasseBrugervendtNøgle  
      ]  
  )  
  (  
    *KlasseMapningListe*  
    {  
      *KlasseMapning*  
        [  
          (  
            KlasseEjer  
          )  
          (  
            KlasseEjerCVRNummer  
          )  
          *KlasseMapningRolle*  
            [  
              KlasseIdentifikation  
              KlasseBrugervendtNøgle  
            ]  
          *KlasseIdentifiktionValg*  
            [  
              *KlasseIdenitifkationStruktur*  
                [  
                  KlasseIdentifikation  
                  KlasseBrugervendtNøgle  
                  FacetIdentifikation  
                  FacetBrugervendtNøgle  
                  KlassifikationIdentifikation  
                  KlassifikationBrugervendtNøgle  
                ]  
            ]  
            |  
            [  
              KlasseUrnReference  
            ]  
          (  
            KlasseMapningVirkningFra  
          )  
          (  
            KlasseMapningVirkningTil  
          )  
        ]  
    }  
  )  
  
~~~
#### Datastruktur: <a name="e1d2c614-71b5-480f-9bac-5c172dfa6e22"></a>KlassifikationListeHent_I  
**UUID:** e1d2c614-71b5-480f-9bac-5c172dfa6e22  
##### Short description
Der kan hentes klassifikationer ud fra en liste af UUID'er ellerbrugervendte nøgler.Hvis KunAktuelle sættes til SAND eller ikke er udfyldt, returneres data publiceret pr dags dato, KlassifikationPubliceretDatoFra og -Til ignoreres.Hvis KunAktuelle sættes til FALSK returneres alle data, eller data mellem KlassifikationPubliceretDatoFra og -DatoTil, hvis de er udfyldt.


~~~
  *KlassifikationKriterieListe*  
  {  
    *IdentifikationKriterie*  
      [  
        KlassifikationIdentifikation  
      ]  
      |  
      [  
        FacetIdentifikation  
      ]  
      |  
      [  
        KlasseIdentifikation  
      ]  
      |  
      [  
        *BrugervendtNøgleKriterie*  
          [  
            KlassifikationBrugervendtNøgle  
            (  
              FacetBrugervendtNøgle  
            )  
            (  
              KlasseBrugervendtNøgle  
            )  
          ]  
      ]  
  }  
  (  
    KunAktuelle  
  )  
  (  
    KlassifikationPubliceretFraDato  
  )  
  (  
    KlassifikationPubliceretTilDato  
  )  
  (  
    KunFælleskommunaleKlasser  
  )  
  
~~~
#### Datastruktur: <a name="34665beb-5da1-4af2-8706-de0716d9b279"></a>KlassifikationListeHent_O  
**UUID:** 34665beb-5da1-4af2-8706-de0716d9b279  
##### Short description
Ouput af søgning efter klassifikationer


~~~
  *KlassifikationListe*  
  {  
    KlassifikationStruktur  
  }  
  
~~~
#### Datastruktur: <a name="dbf268b9-3cf5-4f09-b361-8a0bb2efb32c"></a>KlassifikationStruktur  
**UUID:** dbf268b9-3cf5-4f09-b361-8a0bb2efb32c  
##### Short description
Klassifikation er det abstrakte objekt som samler et klassifikationssystem. Klassifikation holder klassifikationssystemets metadata. Klassifikationssystemet tjener et bestemt forretningsmæssigt formål (fx holder taxonomier for opmarkering af sager). Klassifikationssystemet er udgøres af et hierarki af klasser, taxonomi. Klassifikationssystemet grupper sine klasser i facetter. Et klassifikationssystem har mindst en facet. Klassifikationssystemet har en ejer, som fastlægger reglerne for taxonomien, fx opdeling i facetter. Ejeren af klassifikationssystemet kan tillade at andre anvendere af / interessenter i klassifikationssystemet tilføjer egne klasser, som specialisering af klassifikationssystemets klasser.


~~~
  KlassifikationIdentifikation  
  KlassifikationBrugervendtNøgle  
  KlassifikationTitel  
  KlassifikationBeskrivelse  
  (  
    KlassifikationRetskilde  
  )  
  KlassifikationEjer  
  (  
    KlassifikationEjerCVRNummer  
  )  
  (  
    KlassifikationPubliceretFraDato  
  )  
  (  
    KlassifikationPubliceretTilDato  
  )  
  KlassifikationSidstÆndretTidspunkt  
  *FacetListe*  
  {  
    FacetStruktur  
  }  
  
~~~

## Dataelementer:

| Element navn: | Datatype: | Beskrivelse: |
|----|----|----|
| FacetBeskrivelse| Tekst10K: string, maxLength:10000 |  |  
| FacetBrugervendtNøgle| Tekst50: string, maxLength:50 |  |  
| FacetEjer| Tekst100: string, maxLength:100 |   En tekstuel beskrivelse af facettens ejer.  Hvis ejeren er en myndighed registreret i ORG, indeholder feltet  Organisationsnavn          |  
| FacetEjerCVRNummer| CVRNummer: string[0-9]{8} |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| FacetIdentifikation| UUID: string[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12} |  |  
| FacetPubliceretFraDato| Dato: string, format: date |   Facetten er først gyldig fra og med denne dato.          |  
| FacetPubliceretTilDato| Dato: string, format: date |   Facetten er kun gyldig før denne dato          |  
| FacetRetskilde| Tekst4096: string, maxLength:4096 |  |  
| FacetSidstÆndretTidspunkt| DatoTid: string, format: date-time |  |  
| FacetTitel| Tekst300: string, maxLength:300 |  |  
| KlasseBeskrivelse| Tekst10K: string, maxLength:10000 |   Kortfattet tekst for klassifikation der kan anvendes i brugergrænsefladen som ledetekst eller tooltip, alt afhængigt af det grafiske design.          |  
| KlasseBrugervendtNøgle| Tekst50: string, maxLength:50 |  |  
| KlasseEjer| Tekst100: string, maxLength:100 |   En tekstuel beskrivelse af klassens ejer.  Hvis ejeren er en myndighed registreret i ORG, indeholder feltet  Organisationsnavn          |  
| KlasseEjerCVRNummer| CVRNummer: string[0-9]{8} |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| KlasseIdentifikation| Tekst30: string, maxLength:30 |   Klassifikation for bevilling/ydelse          |  
| KlasseMapningVirkningFra| Dato: string, format: date |   Startdato for mapning til en anden klasse          |  
| KlasseMapningVirkningTil| Dato: string, format: date |   Slutdato for mapning til en anden klasseMapningen er kun gyldig før Slutdato, ikke på Slutdato.          |  
| KlassePubliceretFraDato| Dato: string, format: date |   Startdato for klassens gyldighed. Hvis datoen ikke er udfyldt, er klassen altid gyldig.           |  
| KlassePubliceretTilDato| Dato: string, format: date |   Klassen er kun gyldig før denne dato.          |  
| KlasseRetskilde| Tekst4096: string, maxLength:4096 |  |  
| KlasseSidstÆndretTidspunkt| DatoTid: string, format: date-time |  |  
| KlasseSortering| TalHel1Til100: integer, maximum:100, minimum: 1 |   Angiver klassens anbefalede sorteringsrækkefølge, når den vises for brugere. Anvendes typisk hvis nogle klasser ønskes fremhævet i lister med mange klasser.  Kan udfyldes med et positivt tal. Hvis der ikke er taget stilling til klassens sortering, bør den vises efter klasse med udfyldt sortering. Klasse med sortering sorteres i stigende rækkefølge, så 1 eksempelvis vises før 10.          |  
| KlasseTitel| Tekst300: string, maxLength:300 |   Klassens titel          |  
| KlasseUrnReference| URN: string, maxLength:4096 |   Reference til en klasse uden for det fælleskommunale klassifikationssystem. F.eks. en klasse i en international sundhedsklassifikation          |  
| KlasseÆndringsnotat| Tekst4096: string, maxLength:4096 |  |  
| KlassifikationBeskrivelse| Tekst10K: string, maxLength:10000 |  |  
| KlassifikationBrugervendtNøgle| Tekst50: string, maxLength:50 |  |  
| KlassifikationEjer| Tekst100: string, maxLength:100 |   En tekstuel beskrivelse af klassifikationens ejer.  Hvis ejeren er en dansk myndighed eller virksomhed, indeholder feltet  Organisationsnavn          |  
| KlassifikationEjerCVRNummer| CVRNummer: string[0-9]{8} |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| KlassifikationIdentifikation| UUID: string[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12} |  |  
| KlassifikationPubliceretFraDato| Dato: string, format: date |   En klassifikation er gyldig fra og med denne dato.Som søgekriterie er dette startdato for klassifikationen og dens tilhørende facetter og klassers publicering. Hvis datoen ikke udfyldes, betragtes den som minus-uendelig          |  
| KlassifikationPubliceretTilDato| Dato: string, format: date |   Klassifikationen er kun gyldig før denne dato. Anvendes dette som søgekriterie er det sluttdato for klassifikationen og dens tilhørende facetter og klassers publicering. Udfyldes datoen ikke betragtes det som plus uendelig          |  
| KlassifikationRetskilde| Tekst4096: string, maxLength:4096 |  |  
| KlassifikationSidstÆndretTidspunkt| DatoTid: string, format: date-time |  |  
| KlassifikationTitel| Tekst300: string, maxLength:300 |  |  
| KunAktuelle| Markering: boolean |   Angiver om der skal medtages historiske/fremtidige data, eller alene aktuelle, dvs. data publiceret pr dags datoHvis der ikke vælges KunAktuelle, kan tidsintevallet afgrænses med KlassifikationPubliceretDatoFra og KlassifikationPubliceretDatoTil          |  
| KunFælleskommunaleKlasser| Markering: boolean |   Angiver om resultatet kun skal indeholde fælleskommunale data. Hvis Falsk eller udeladt medtages alle data som kalderen har adgang til. F.eks. lokale udvidelser af KLE.          |  
| SagKLEEmne| KLEEmne: string, `(([0-9]{1}\\*)|([0-9]{2}\\.\\*)|([0-9]{2}\\.[0-9]{1}\\*)|([0-9]{2}\\.[0-9]{2}\\.\\*)|([0-9]{2}\\.[0-9]{2}\\.[0-9]{1}\\*)|([0-9]{2}(\\.[0-9]{2}){2}))` |   Sagens primære klasse udfyldes med KLE-emne og anvendes som primær dataafgrænsning. KLE-emne udfyldes med 6-cifre i formatet ’99.99.99’. Tilladte værdier:99.*, 99.99.*, 99.99.99          |  
| SøgeordTitel| Tekst50: string, maxLength:50 |   Søgerord relateret til en Klasse          |  



