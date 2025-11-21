# <a name="bfe8c7f4-2286-4e54-bc2b-e5c415424d2f"></a>KlassifikationListHentGQL

|Egenskaber:||
|----|----|
| Servicekategori: | Webservice |  
| Servicetype: | GraphQL |  
| Sikkerhedsmodel: | JWT Token |  
  
## <a name="c7ccbdc7-068f-49e2-b9d5-4c16792ecb09"></a>Operation: KlassifikationListeHentGQL
### Signal: <a name="5ad52345-6993-46e1-a6d1-4b1db7279880"></a>post
*Query parameters:*

	KlassifikationListeHent_I


*HTTP Method:* POST

### Signal: <a name="3252d63e-f3e2-4b45-bc50-106e696d468b"></a>post_200
*HTTP Method:* POST

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
| FacetBeskrivelse| Tekst10K: GraphQL - TBD |  |  
| FacetBrugervendtNøgle| Tekst50: GraphQL - TBD |  |  
| FacetEjer| Tekst100: GraphQL - TBD |   En tekstuel beskrivelse af facettens ejer.  Hvis ejeren er en myndighed registreret i ORG, indeholder feltet  Organisationsnavn          |  
| FacetEjerCVRNummer| CVRNummer: GraphQL - TBD |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| FacetIdentifikation| UUID: GraphQL - TBD |  |  
| FacetPubliceretFraDato| Dato: GraphQL - TBD |   Facetten er først gyldig fra og med denne dato.          |  
| FacetPubliceretTilDato| Dato: GraphQL - TBD |   Facetten er kun gyldig før denne dato          |  
| FacetRetskilde| Tekst4096: GraphQL - TBD |  |  
| FacetSidstÆndretTidspunkt| DatoTid: GraphQL - TBD |  |  
| FacetTitel| Tekst300: GraphQL - TBD |  |  
| KlasseBeskrivelse| Tekst10K: GraphQL - TBD |   Kortfattet tekst for klassifikation der kan anvendes i brugergrænsefladen som ledetekst eller tooltip, alt afhængigt af det grafiske design.          |  
| KlasseBrugervendtNøgle| Tekst50: GraphQL - TBD |  |  
| KlasseEjer| Tekst100: GraphQL - TBD |   En tekstuel beskrivelse af klassens ejer.  Hvis ejeren er en myndighed registreret i ORG, indeholder feltet  Organisationsnavn          |  
| KlasseEjerCVRNummer| CVRNummer: GraphQL - TBD |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| KlasseIdentifikation| Tekst30: GraphQL - TBD |   Klassifikation for bevilling/ydelse          |  
| KlasseMapningVirkningFra| Dato: GraphQL - TBD |   Startdato for mapning til en anden klasse          |  
| KlasseMapningVirkningTil| Dato: GraphQL - TBD |   Slutdato for mapning til en anden klasseMapningen er kun gyldig før Slutdato, ikke på Slutdato.          |  
| KlassePubliceretFraDato| Dato: GraphQL - TBD |   Startdato for klassens gyldighed. Hvis datoen ikke er udfyldt, er klassen altid gyldig.           |  
| KlassePubliceretTilDato| Dato: GraphQL - TBD |   Klassen er kun gyldig før denne dato.          |  
| KlasseRetskilde| Tekst4096: GraphQL - TBD |  |  
| KlasseSidstÆndretTidspunkt| DatoTid: GraphQL - TBD |  |  
| KlasseSortering| TalHel1Til100: GraphQL - TBD |   Angiver klassens anbefalede sorteringsrækkefølge, når den vises for brugere. Anvendes typisk hvis nogle klasser ønskes fremhævet i lister med mange klasser.  Kan udfyldes med et positivt tal. Hvis der ikke er taget stilling til klassens sortering, bør den vises efter klasse med udfyldt sortering. Klasse med sortering sorteres i stigende rækkefølge, så 1 eksempelvis vises før 10.          |  
| KlasseTitel| Tekst300: GraphQL - TBD |   Klassens titel          |  
| KlasseUrnReference| URN: GraphQL - TBD |   Reference til en klasse uden for det fælleskommunale klassifikationssystem. F.eks. en klasse i en international sundhedsklassifikation          |  
| KlasseÆndringsnotat| Tekst4096: GraphQL - TBD |  |  
| KlassifikationBeskrivelse| Tekst10K: GraphQL - TBD |  |  
| KlassifikationBrugervendtNøgle| Tekst50: GraphQL - TBD |  |  
| KlassifikationEjer| Tekst100: GraphQL - TBD |   En tekstuel beskrivelse af klassifikationens ejer.  Hvis ejeren er en dansk myndighed eller virksomhed, indeholder feltet  Organisationsnavn          |  
| KlassifikationEjerCVRNummer| CVRNummer: GraphQL - TBD |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| KlassifikationIdentifikation| UUID: GraphQL - TBD |  |  
| KlassifikationPubliceretFraDato| Dato: GraphQL - TBD |   En klassifikation er gyldig fra og med denne dato.Som søgekriterie er dette startdato for klassifikationen og dens tilhørende facetter og klassers publicering. Hvis datoen ikke udfyldes, betragtes den som minus-uendelig          |  
| KlassifikationPubliceretTilDato| Dato: GraphQL - TBD |   Klassifikationen er kun gyldig før denne dato. Anvendes dette som søgekriterie er det sluttdato for klassifikationen og dens tilhørende facetter og klassers publicering. Udfyldes datoen ikke betragtes det som plus uendelig          |  
| KlassifikationRetskilde| Tekst4096: GraphQL - TBD |  |  
| KlassifikationSidstÆndretTidspunkt| DatoTid: GraphQL - TBD |  |  
| KlassifikationTitel| Tekst300: GraphQL - TBD |  |  
| KunAktuelle| Markering: GraphQL - TBD |   Angiver om der skal medtages historiske/fremtidige data, eller alene aktuelle, dvs. data publiceret pr dags datoHvis der ikke vælges KunAktuelle, kan tidsintevallet afgrænses med KlassifikationPubliceretDatoFra og KlassifikationPubliceretDatoTil          |  
| KunFælleskommunaleKlasser| Markering: GraphQL - TBD |   Angiver om resultatet kun skal indeholde fælleskommunale data. Hvis Falsk eller udeladt medtages alle data som kalderen har adgang til. F.eks. lokale udvidelser af KLE.          |  
| SagKLEEmne| KLEEmne: GraphQL - TBD |   Sagens primære klasse udfyldes med KLE-emne og anvendes som primær dataafgrænsning. KLE-emne udfyldes med 6-cifre i formatet ’99.99.99’. Tilladte værdier:99.*, 99.99.*, 99.99.99          |  
| SøgeordTitel| Tekst50: GraphQL - TBD |   Søgerord relateret til en Klasse          |  



