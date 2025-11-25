# <a name="e1ca1f8b-0783-49d4-9665-71b7539ec488"></a>KlassifikationListeHent

|Egenskaber:||
|----|----|
| Servicekategori: | Webservice |  
| Servicetype: | SOAP/WSDL |  
| Version: | 2.0 |  
| Gældende fra: | 2022 03 30 01.01:00 |  
  
##### Short description
Servicen benyttes til at hente hele eller dele af klassifikationshierarkier. Servicen har én operation af samme navn som servicen.

## <a name="544be68f-7c7a-42e0-8fda-7eecf3d9f5a4"></a>Operation: KlassifikationListeHent
### Signal: <a name="fb4f46b4-f921-4b5f-a0f7-8d52f20f82a8"></a>KlassifikationListeHentRequest
#### Datastruktur: [KlassifikationListeHent_I](#e1d2c614-71b5-480f-9bac-5c172dfa6e22)  
### Signal: <a name="9264e2c6-35ce-4928-86dd-82c70fc959ee"></a>KlassifikationListeHentResponse
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
| FacetBeskrivelse| Tekst10K: </br>*restriction base: string*, </br>*xs:maxLength: 10000* |  |  
| FacetBrugervendtNøgle| Tekst50: </br>*restriction base: string*, </br>*xs:maxLength: 50* |  |  
| FacetEjer| Tekst100: </br>*restriction base: string*, </br>*xs:maxLength: 100* |   En tekstuel beskrivelse af facettens ejer.  Hvis ejeren er en myndighed registreret i ORG, indeholder feltet  Organisationsnavn          |  
| FacetEjerCVRNummer| CVRNummer: </br>*restriction base: string*, </br>*xs:pattern: [0-9]{8}* |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| FacetIdentifikation| UUID: </br>*restriction base: string*, </br>*xs:pattern: [a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}* |  |  
| FacetPubliceretFraDato| Dato: </br>*restriction base: date* |   Facetten er først gyldig fra og med denne dato.          |  
| FacetPubliceretTilDato| Dato: </br>*restriction base: date* |   Facetten er kun gyldig før denne dato          |  
| FacetRetskilde| Tekst4096: </br>*restriction base: string*, </br>*xs:maxLength: 4096* |  |  
| FacetSidstÆndretTidspunkt| DatoTid: </br>*restriction base: dateTime* |  |  
| FacetTitel| Tekst300: </br>*restriction base: string*, </br>*xs:maxLength: 300* |  |  
| KlasseBeskrivelse| Tekst10K: </br>*restriction base: string*, </br>*xs:maxLength: 10000* |   Kortfattet tekst for klassifikation der kan anvendes i brugergrænsefladen som ledetekst eller tooltip, alt afhængigt af det grafiske design.          |  
| KlasseBrugervendtNøgle| Tekst50: </br>*restriction base: string*, </br>*xs:maxLength: 50* |  |  
| KlasseEjer| Tekst100: </br>*restriction base: string*, </br>*xs:maxLength: 100* |   En tekstuel beskrivelse af klassens ejer.  Hvis ejeren er en myndighed registreret i ORG, indeholder feltet  Organisationsnavn          |  
| KlasseEjerCVRNummer| CVRNummer: </br>*restriction base: string*, </br>*xs:pattern: [0-9]{8}* |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| KlasseIdentifikation| Tekst30: </br>*restriction base: string*, </br>*xs:maxLength: 30* |   Klassifikation for bevilling/ydelse          |  
| KlasseMapningVirkningFra| Dato: </br>*restriction base: date* |   Startdato for mapning til en anden klasse          |  
| KlasseMapningVirkningTil| Dato: </br>*restriction base: date* |   Slutdato for mapning til en anden klasseMapningen er kun gyldig før Slutdato, ikke på Slutdato.          |  
| KlassePubliceretFraDato| Dato: </br>*restriction base: date* |   Startdato for klassens gyldighed. Hvis datoen ikke er udfyldt, er klassen altid gyldig.           |  
| KlassePubliceretTilDato| Dato: </br>*restriction base: date* |   Klassen er kun gyldig før denne dato.          |  
| KlasseRetskilde| Tekst4096: </br>*restriction base: string*, </br>*xs:maxLength: 4096* |  |  
| KlasseSidstÆndretTidspunkt| DatoTid: </br>*restriction base: dateTime* |  |  
| KlasseSortering| TalHel1Til100: </br>*restriction base: integer*, </br>*xs:maxInclusive: 100*, </br>*xs:minInclusive: 1* |   Angiver klassens anbefalede sorteringsrækkefølge, når den vises for brugere. Anvendes typisk hvis nogle klasser ønskes fremhævet i lister med mange klasser.  Kan udfyldes med et positivt tal. Hvis der ikke er taget stilling til klassens sortering, bør den vises efter klasse med udfyldt sortering. Klasse med sortering sorteres i stigende rækkefølge, så 1 eksempelvis vises før 10.          |  
| KlasseTitel| Tekst300: </br>*restriction base: string*, </br>*xs:maxLength: 300* |   Klassens titel          |  
| KlasseUrnReference| URN: </br>*restriction base: string*, </br>*xs:maxLength: 4096* |   Reference til en klasse uden for det fælleskommunale klassifikationssystem. F.eks. en klasse i en international sundhedsklassifikation          |  
| KlasseÆndringsnotat| Tekst4096: </br>*restriction base: string*, </br>*xs:maxLength: 4096* |  |  
| KlassifikationBeskrivelse| Tekst10K: </br>*restriction base: string*, </br>*xs:maxLength: 10000* |  |  
| KlassifikationBrugervendtNøgle| Tekst50: </br>*restriction base: string*, </br>*xs:maxLength: 50* |  |  
| KlassifikationEjer| Tekst100: </br>*restriction base: string*, </br>*xs:maxLength: 100* |   En tekstuel beskrivelse af klassifikationens ejer.  Hvis ejeren er en dansk myndighed eller virksomhed, indeholder feltet  Organisationsnavn          |  
| KlassifikationEjerCVRNummer| CVRNummer: </br>*restriction base: string*, </br>*xs:pattern: [0-9]{8}* |   CVRNummer på ejer hvis denne er en dansk virksomhed.          |  
| KlassifikationIdentifikation| UUID: </br>*restriction base: string*, </br>*xs:pattern: [a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}* |  |  
| KlassifikationPubliceretFraDato| Dato: </br>*restriction base: date* |   En klassifikation er gyldig fra og med denne dato.Som søgekriterie er dette startdato for klassifikationen og dens tilhørende facetter og klassers publicering. Hvis datoen ikke udfyldes, betragtes den som minus-uendelig          |  
| KlassifikationPubliceretTilDato| Dato: </br>*restriction base: date* |   Klassifikationen er kun gyldig før denne dato. Anvendes dette som søgekriterie er det sluttdato for klassifikationen og dens tilhørende facetter og klassers publicering. Udfyldes datoen ikke betragtes det som plus uendelig          |  
| KlassifikationRetskilde| Tekst4096: </br>*restriction base: string*, </br>*xs:maxLength: 4096* |  |  
| KlassifikationSidstÆndretTidspunkt| DatoTid: </br>*restriction base: dateTime* |  |  
| KlassifikationTitel| Tekst300: </br>*restriction base: string*, </br>*xs:maxLength: 300* |  |  
| KunAktuelle| Markering: </br>*restriction base: boolean* |   Angiver om der skal medtages historiske/fremtidige data, eller alene aktuelle, dvs. data publiceret pr dags datoHvis der ikke vælges KunAktuelle, kan tidsintevallet afgrænses med KlassifikationPubliceretDatoFra og KlassifikationPubliceretDatoTil          |  
| KunFælleskommunaleKlasser| Markering: </br>*restriction base: boolean* |   Angiver om resultatet kun skal indeholde fælleskommunale data. Hvis Falsk eller udeladt medtages alle data som kalderen har adgang til. F.eks. lokale udvidelser af KLE.          |  
| SagKLEEmne| KLEEmne: </br>*restriction base: string*, </br>*xs:pattern*: *`(([0-9]{1}\\*)\|([0-9]{2}\\.\\*)\|([0-9]{2}\\.[0-9]{1}\\*)\|([0-9]{2}\\.[0-9]{2}\\.\\*)\|([0-9]{2}\\.[0-9]{2}\\.[0-9]{1}\\*)\|([0-9]{2}(\\.[0-9]{2}){2}))`* |   Sagens primære klasse udfyldes med KLE-emne og anvendes som primær dataafgrænsning. KLE-emne udfyldes med 6-cifre i formatet ’99.99.99’. Tilladte værdier:99.*, 99.99.*, 99.99.99          |  
| SøgeordTitel| Tekst50: </br>*restriction base: string*, </br>*xs:maxLength: 50* |   Søgerord relateret til en Klasse          |  



