# <a name="0ef2b901-350c-416f-941f-3296395b79b9"></a>BibliotekHændelseOpdater

|Egenskaber:||
|----|----|
| Servicekategori: | Webservice |  
| Servicetype: | REST |  
| Sikkerhedsmodel: | JWT Token |  
| Source: | Fælles Bibliotekssystem |  
| Contact name: | Britt Montesinos |  
| Contact url: | http://www.kombit.dk |  
| Contact email: | bibsys@kombit.dk |  
  
##### Short description
Servicen giver mulighed for at opdatere Bibliotekernes Logistiksystemer (BLS) med bibliotekshændelser fra det Fælles Bibliotekssystem (FBS). I forbindelse med fuld synkronisering af biblioteksdata fra FBS til BLS anvendes operationerne hvis navne starter med Synkronisering. Synkronisering kan være aktuelt ved opstart af nyt BLS, samt hvis BLS og FBS ikke længere er synkroniseret. FBS initiere synkroniseringen gennem operationen SynkroniseringOpstart, hvis BLS kvitterer med 204, starter synkroniseringen. FBS sender alle data grupperet i følgende beskedgrupper; Manifiestationer, Materialer, Rekvisitioner, Fratagne rekvisitioner, Lokationer og Koder. Når alle data er overført til BLS, sender FBS besked om dette gennem operationen SynkroniseringDataOverført. FBS tilbageholder alle nye opdateringer indtil BLS har processeret hele udtrækket, og kaldt operationen SynkroniseringProcesseringAfsluttet gennem servicen LogistikHændelseOpdateret.

## <a name="05dded0f-c17d-4440-ac09-26e042ba9813"></a>Operation: SynkroniseringDataOverført
### Signal: <a name="2819eaea-c61e-47c6-bc94-0fbb288a12e3"></a>post
*HTTP Method:* POST

Format: application/json

### Signal: <a name="bb049df4-c30a-4a2e-9514-2a24c6057884"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="17527f2a-7120-4f7d-a7ef-b15dee7e3e62"></a>Operation: MaterialeSorteret
##### Short description
Operationen benyttes af BLS til at informere FBS om, at et materiale er sorteret.

### Signal: <a name="ab23b22f-cccb-4a21-9502-803c9643683f"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [MaterialeSorteret_I](#03b26516-3a21-412c-8ff7-7045878db5ab)  
### Signal: <a name="d6b1e1af-d004-4ee3-a35d-30c0be0c7c7d"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="1b786ac5-ad83-48b1-9355-3f5fe91c932f"></a>Operation: LokationSlettet
##### Short description
Operationen benyttes af FBS for at informere BLS om, at en lokation er slettet.

### Signal: <a name="981a452e-9e65-43ff-b42f-d32e338b5d40"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [LokationSlettet_I](#54f65433-cf14-425b-a7dc-6503f11b3cf1)  
### Signal: <a name="193216c2-dd7f-406b-b041-b82e868c6c38"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="2d43c411-0254-4a97-97c0-a25b9ed48137"></a>Operation: RekvisitionFratagetOpdateret
##### Short description
Operationen benyttes af FBS for at informere BLS om, at en rekvisition er frataget. Når materialet er i transit kaldes operationen første gang med "KlarTilAfhentning" sat til Falsk. Status" sat til "I transit". Når materialet er sat på afhentningshylden sættes KlarTilAfhentning til "sand"

### Signal: <a name="ebd16dc7-bfbe-4425-a99a-b3c0557657c2"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [RekvisitionFratagetOpdateret_I](#c83bdf8f-0195-439f-91fb-f28c30bb8020)  
### Signal: <a name="495b12fd-1fe6-4496-866f-1dc9ab753f5f"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="4dfcbdc6-dcb7-4ed8-9a66-82c03c97886d"></a>Operation: MaterialeNummerSkiftet
##### Short description
Operationen benyttes af FBS for at informere BLS om, at et materiale har skiftet MaterialeNummer.

### Signal: <a name="2db67a87-aded-4e1a-b8d1-80ee20341b5f"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [MaterialeNummerSkiftet_I](#670e2459-720d-4ff5-a6e6-d2754f3e84f3)  
### Signal: <a name="ed8716e6-838c-4fa3-8e83-c5ee2a47f82d"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="6d34cc45-c634-4628-af8e-fdcf899fc593"></a>Operation: MaterialeUdlånt
##### Short description
Operationen benyttes af FBS for at informere BLS om, at et materiale er udlånt.

### Signal: <a name="b1bf7569-2cd6-445f-a9f1-7937592c3125"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [MaterialeUdlånt_I](#7d5cb1ad-a7fa-434b-9b33-27650bb3a2ee)  
### Signal: <a name="99eafba7-58c3-4315-af16-bf7c9d068b61"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="77aeedff-51fb-40ec-8f7c-30f57d65e4b2"></a>Operation: MaterialeKasseret
##### Short description
Operationen benyttes af FBS for at informere BLS om, at et materiale er kasseret.

### Signal: <a name="b5cf5b54-73d2-4f99-83d5-7958399ecac9"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [BibliotekMaterialeKasseret_I](#04c6dff8-8650-444d-ae05-9bd84861e00e)  
### Signal: <a name="27d2809e-1c93-4c37-90f1-e056309753a7"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="7c2e58ec-bede-48f3-8015-1ab32ebb4cb9"></a>Operation: SynkroniseringKoder
##### Short description
Operationen sender en liste på op til 1000 koder ad gangen.

### Signal: <a name="711e5d0b-5930-4578-abf0-65c9740e3519"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [KodeListe_I](#3a11a645-bab5-4f8a-a038-4b89e8b63f2a)  
### Signal: <a name="7471ebcc-ba0e-4165-bf7b-baad0562f8f8"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="8a191aa5-17ed-4ce6-845d-8a6f2922b670"></a>Operation: MaterialeSlettet
##### Short description
Operationen benyttes af FBS for at informere BLS om, at et materiale er slettet.

### Signal: <a name="8a21b015-abc8-488b-8c2e-61e2af937571"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [MaterialeSlettet_I](#5bf0b0ed-5370-4271-98a0-daa16b163844)  
### Signal: <a name="2c8eca19-77c5-45a3-9082-ad5919784569"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="8bbe490a-53f9-494a-b0d2-7e231bda36c9"></a>Operation: SynkroniseringMaterialer
##### Short description
Operationen sender en liste på op til 1000 materialer ad gangen.

### Signal: <a name="951205aa-eada-4dae-ac0c-e3de1ce90b98"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [MaterialeListe_I](#75951676-7c98-4339-88ec-12a1841d315d)  
### Signal: <a name="6621c6da-f3f0-4acc-ade7-bc198de00924"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="9642f44f-bb3b-484a-bc85-4e096eea2c54"></a>Operation: SynkroniseringRekvisitionerFratagne
##### Short description
Operationen sender en liste på op til 1000 fratagne rekvisitioner ad gangen.

### Signal: <a name="122dab7d-1da6-44cc-ab16-35718e976432"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [RekvisitionFratagetListe_I](#6d9f46b3-6a99-4bb9-8619-6991739a948d)  
### Signal: <a name="54833e9e-6b4c-44ec-a594-db5778690aa4"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="968998e4-e604-422f-92f1-4e21ef3feb70"></a>Operation: ManifestationSlettet
##### Short description
Operationen benyttes af FBS for at informere BLS om, at en manifestation er slettet.

### Signal: <a name="60db86fa-4efc-4f14-ab6c-8861416b850a"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [ManifestationSlettet_I](#0afc3d44-b3f4-40b5-a7a0-21cbb9d394b2)  
### Signal: <a name="71f02f70-95c4-4fcb-9cc6-810b58fd694f"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="97df0425-4d71-476a-8384-100f2514288b"></a>Operation: KodeAdministrationOpdateret
##### Short description
Operationen benyttes af FBS for at sende nye eller opdaterede koder for Kassationårsager, Flydekoder og Samlinger til BLS.

### Signal: <a name="c630b383-8db9-4fe4-8b75-05e087da50f0"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [KodeAdministrationOpdateret_I](#85704921-b906-4b5c-ab81-7431effe4af2)  
### Signal: <a name="83f4a187-e58c-4643-9c47-d799ae1dad10"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="98269722-24d8-470d-b88d-f7408706014b"></a>Operation: LokationOpdateret
##### Short description
Operationen benyttes af FBS for at informere BLS om, at en lokation er oprettet, eller når der er ændringer til en lokation.

### Signal: <a name="ffdc4b1e-e218-4809-bb24-546fbd60dafb"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [LokationOpdateret_I](#36a44ae4-ac0b-4de4-95b5-d8a4f3e65e29)  
### Signal: <a name="d46b25cb-cd54-4338-b317-c4240a3b5e57"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="a5965491-77bb-42e9-a161-d3ba6436df27"></a>Operation: SynkroniseringOpstart
##### Short description
Operationen anvendes til at starte synkroniseringsprocessen. FBS kalder operationen, og BLS svarer med 204, hvis BLS er klar til at modtage data. Hvis ikke returneres ###.

### Signal: <a name="68e6fe47-77fe-42f4-9a04-46be3411707f"></a>post
*HTTP Method:* POST

Format: application/json

### Signal: <a name="af1b4961-fa28-4a1e-ae56-a23f08bc9045"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="b7041011-d356-4e5f-89bb-abe92591c3bc"></a>Operation: ManifestationOpdateret
##### Short description
Operationen benyttes af FBS for at informere BLS om, at der er kommet en ny manifestation, eller når der er ændringer til en eksisterende manifestation.

### Signal: <a name="ef0227ce-9837-4896-8f01-81afee2b8216"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [ManifestationOpdateret_I](#e91e6a3e-1a13-4c04-ab64-e4e233472c0c)  
### Signal: <a name="f2948407-5a95-45ff-93d4-30ed653050e5"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="b70d969c-3f1c-4149-ab13-ffba4542a8dd"></a>Operation: SynkroniseringLokationer
##### Short description
Operationen sender en liste på op til 1000 lokationer ad gangen.

### Signal: <a name="bd98f54a-06c0-4407-b222-e291a762b720"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [LokationListe_I](#535ebcdb-f1ef-44ca-a5ef-57d3f9902fd1)  
### Signal: <a name="b63328d1-b8f3-4532-a694-eeb634531b1b"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="b755b82a-4585-41c6-8ca2-1101cbedc343"></a>Operation: SynkroniseringManifestationer
##### Short description
Operationen sender en liste på op til 1000 manifestationer ad gangen.

### Signal: <a name="ce2a15c1-c6ff-4ff1-9865-e9bc9e71f9f0"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [ManifestationListe_I](#675ddb84-1e8d-406e-80e1-5ddc64b8a2f4)  
### Signal: <a name="98e0e7af-b2f4-4aa9-8114-df882d0c926f"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="bd70f077-9da7-4c11-9d12-bb697d4462a9"></a>Operation: RekvisitionSlettet
##### Short description
Operationen benyttes af FBS for at informere BLS om, at en rekvisition er slettet.

### Signal: <a name="33377f40-c919-4ceb-8e62-509dc02cafaf"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [RekvisitionSlettet_I](#37b2b800-efbf-4605-a080-fa9935e5735e)  
### Signal: <a name="7811985a-4375-4d07-8ca2-8bce5a956082"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="c8fe1fb9-ab3f-409a-82f8-72fbbbf7ca8d"></a>Operation: RekvisitionOpdateret
##### Short description
Operationen benyttes af FBS for at informere BLS om, at en rekvisition er oprettet eller ændret. Reservationer bliver angivet i en reservationskæde, hvor hver reservation indeholder information om forrige (ForrigeReservationId) og næste (NæsteReservationId) reservation i reservationskæden. Den reservation, der skal prioriteres først, ligger forrest i reservationskæden, dvs. ForrigeReservationId er ikke angivet.

### Signal: <a name="42ee0bac-aa6f-41a3-a966-0c60111e209a"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [RekvisitionOpdateret_I](#e7c6976b-8258-4be8-904d-1030aa0d1cde)  
### Signal: <a name="9f7418f1-18fc-45e9-8df2-642a27bf923e"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="e703edae-070a-4c5d-9866-774165739b86"></a>Operation: FratagningslisteOprettet
##### Short description
Operationen benyttes af FBS for at sende en fratagningsliste (Samling, Kassation eller Andet) til BLS.

### Signal: <a name="3119f164-aa09-429d-b76c-8b51aebec66d"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [FratagningslisteOprettet_I](#e5d76ea3-9ee6-416d-8e27-2fccc7cb2ec9)  
### Signal: <a name="5f551669-c97a-466f-b16f-3c06a730642a"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="eae34889-f85c-4a98-83e6-a8215f5a8f59"></a>Operation: SynkroniseringRekvisitioner
##### Short description
Operationen sender en liste på op til 1000 rekvisitioner ad gangen.

### Signal: <a name="4bdfa111-ff85-47e2-ae5b-588e22590488"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [RekvisitionListe_I](#4e4e33a0-cbdb-4dc4-8acd-8a10a22db041)  
### Signal: <a name="372bdaba-ade7-45fe-a9a3-93cd01cbee37"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="ec1c4453-87ae-416b-9035-98ee0741fcb4"></a>Operation: MaterialeOpdateret
##### Short description
Operationen benyttes af FBS for at informere BLS om, at der er kommer nyt materiale, eller når der er ændringer til et eksisterende materiale.

### Signal: <a name="f154f125-bfa1-41d4-9b8b-8f562f2f71e3"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [BibliotekMaterialeOpdateret_I](#12e7ca0e-e19c-4cad-9e28-c87bf445bb4a)  
### Signal: <a name="fde3b0d0-f689-46e8-a4b1-7b789f644fb2"></a>post_200
*HTTP Method:* POST

Format: application/json

## <a name="f2a66060-6db5-4258-a274-00a8ca004199"></a>Operation: KodeAdministrationSlettet
##### Short description
Operationen benyttes af FBS for at informere BLS om, at en kode er slettet.

### Signal: <a name="d45df8a3-b214-47be-aaf2-457c185f3e58"></a>post
*HTTP Method:* POST

Format: application/json

#### Datastruktur: [KodeAdministrationSlettet_I](#dc10061d-ed7d-48a9-89d3-6937b50cf0b3)  
### Signal: <a name="69ce0723-fe01-4b45-b1a2-6c0a35f6367b"></a>post_200
*HTTP Method:* POST

Format: application/json

## Datastrukturer:


#### Datastruktur: <a name="04c6dff8-8650-444d-ae05-9bd84861e00e"></a>BibliotekMaterialeKasseret_I  
**UUID:** 04c6dff8-8650-444d-ae05-9bd84861e00e  

~~~
  TransaktionInformation  
  MaterialeNummer  
  KassationÅrsagKode  
  
~~~
#### Datastruktur: <a name="12e7ca0e-e19c-4cad-9e28-c87bf445bb4a"></a>BibliotekMaterialeOpdateret_I  
**UUID:** 12e7ca0e-e19c-4cad-9e28-c87bf445bb4a  

~~~
  TransaktionInformation  
  Materiale  
  
~~~
#### Datastruktur: <a name="e5d76ea3-9ee6-416d-8e27-2fccc7cb2ec9"></a>FratagningslisteOprettet_I  
**UUID:** e5d76ea3-9ee6-416d-8e27-2fccc7cb2ec9  

~~~
  TransaktionInformation  
  FratagningListeNavn  
  FratagningListeType  
  FratagningListeNote  
  *MaterialeListe*  
  {  
    *Materiale*  
      [  
        MaterialeNummer  
        (  
          KassationÅrsagKode  
        )  
        (  
          EDepotTilArkiv  
        )  
      ]  
  }  
  
~~~
#### Datastruktur: <a name="418b3fff-cf63-45d2-8eec-ad0a6c14afc8"></a>Kode  
**UUID:** 418b3fff-cf63-45d2-8eec-ad0a6c14afc8  

~~~
  (  
    *Materialegruppe*  
      [  
        MaterialegruppeNummer  
        MaterialegruppeNavn  
        MaterialegruppeForkortelse  
      ]  
  )  
  (  
    *Kassationsårsag*  
      [  
        KassationÅrsagKode  
        KassationÅrsagNavn  
        KassationÅrsagForkortelse  
      ]  
  )  
  (  
    *Flydegruppekode*  
      [  
        FlydegruppeKode  
        FlydegruppeNavn  
        FlydegruppeForkortelse  
      ]  
  )  
  
~~~
#### Datastruktur: <a name="85704921-b906-4b5c-ab81-7431effe4af2"></a>KodeAdministrationOpdateret_I  
**UUID:** 85704921-b906-4b5c-ab81-7431effe4af2  

~~~
  TransaktionInformation  
  Kode  
  
~~~
#### Datastruktur: <a name="dc10061d-ed7d-48a9-89d3-6937b50cf0b3"></a>KodeAdministrationSlettet_I  
**UUID:** dc10061d-ed7d-48a9-89d3-6937b50cf0b3  

~~~
  TransaktionInformation  
  (  
    KassationÅrsagKode  
  )  
  (  
    MaterialegruppeNummer  
  )  
  (  
    FlydegruppeKode  
  )  
  
~~~
#### Datastruktur: <a name="3a11a645-bab5-4f8a-a038-4b89e8b63f2a"></a>KodeListe_I  
**UUID:** 3a11a645-bab5-4f8a-a038-4b89e8b63f2a  
##### Short description
Liste bestående af agancy'ets materialegruppe-, kassationsårsags- og flydegruppekoder.


~~~
  TransaktionInformation  
  *Koder*  
  {  
    *Kode*  
      [  
        Kode  
      ]  
  }  
  1000   
  
~~~
#### Datastruktur: <a name="3d0a7e08-5423-40c4-82a6-5104b647d310"></a>Lokation  
**UUID:** 3d0a7e08-5423-40c4-82a6-5104b647d310  

~~~
  (  
    *Filial*  
      [  
        FilialForkortelse  
        FilialISILNummer  
        FilialNavn  
      ]  
  )  
  (  
    *Afdeling*  
      [  
        PlaceringAfdelingNummer  
        PlaceringAfdelingNavn  
        PlaceringAfdelingForkortelse  
      ]  
  )  
  (  
    *Sektion*  
      [  
        PlaceringSektionNummer  
        PlaceringSektionNavn  
        PlaceringSektionForkortelse  
      ]  
  )  
  (  
    *Opstilling*  
      [  
        PlaceringOpstillingNummer  
        PlaceringOpstillingNavn  
        PlaceringOpstillingForkortelse  
      ]  
  )  
  (  
    *Delopstilling*  
      [  
        PlaceringDelopstillingNummer  
        PlaceringDelopstillingNavn  
        PlaceringDelopstillingForkortelse  
      ]  
  )  
  
~~~
#### Datastruktur: <a name="535ebcdb-f1ef-44ca-a5ef-57d3f9902fd1"></a>LokationListe_I  
**UUID:** 535ebcdb-f1ef-44ca-a5ef-57d3f9902fd1  
##### Short description
Liste bestående af lokationsangivelser.


~~~
  TransaktionInformation  
  *Lokationer*  
  {  
    *Lokation*  
      [  
        Kode  
      ]  
  }  
  1000   
  
~~~
#### Datastruktur: <a name="36a44ae4-ac0b-4de4-95b5-d8a4f3e65e29"></a>LokationOpdateret_I  
**UUID:** 36a44ae4-ac0b-4de4-95b5-d8a4f3e65e29  

~~~
  TransaktionInformation  
  Lokation  
  
~~~
#### Datastruktur: <a name="54f65433-cf14-425b-a7dc-6503f11b3cf1"></a>LokationSlettet_I  
**UUID:** 54f65433-cf14-425b-a7dc-6503f11b3cf1  

~~~
  TransaktionInformation  
  (  
    FilialISILNummer  
  )  
  (  
    PlaceringAfdelingNummer  
  )  
  (  
    PlaceringSektionNummer  
  )  
  (  
    PlaceringOpstillingNummer  
  )  
  (  
    PlaceringDelopstillingNummer  
  )  
  
~~~
#### Datastruktur: <a name="9201281d-03d8-46fd-90b0-fc36caf65bbd"></a>Manifestation  
**UUID:** 9201281d-03d8-46fd-90b0-fc36caf65bbd  

~~~
  ManifestationFAUSTNummer  
  ManifestationKlassifikation  
  ManifestationKlassifikationTekst  
  TitelNavn  
  TitelSorteret  
  MaterialetypeKode  
  MaterialetypeBeskrivelse  
  AktørNavn  
  AktørSorteret  
  (  
    FysiskBeskrivelseAntalSider  
  )  
  (  
    UdgaveBetegnelse  
  )  
  (  
    FysiskBeskrivelseOmfang  
  )  
  (  
    SerieTitel  
  )  
  (  
    MusikKlassifikation  
  )  
  (  
    MusikPlademærke  
  )  
  (  
    MusikPladenummer  
  )  
  (  
    *FørsteManifestationFAUSTNummer*  
      [  
        ManifestationFAUSTNummer  
      ]  
  )  
  (  
    *InitielLogistikKategori*  
      [  
        LogistikKategoriNavn  
      ]  
  )  
  
~~~
#### Datastruktur: <a name="675ddb84-1e8d-406e-80e1-5ddc64b8a2f4"></a>ManifestationListe_I  
**UUID:** 675ddb84-1e8d-406e-80e1-5ddc64b8a2f4  
##### Short description
En liste bestående af manifestationer.


~~~
  TransaktionInformation  
  *ManifestationListe*  
  {  
    *Manifestation*  
      [  
        Manifestation  
      ]  
  }  
  1000   
  
~~~
#### Datastruktur: <a name="e91e6a3e-1a13-4c04-ab64-e4e233472c0c"></a>ManifestationOpdateret_I  
**UUID:** e91e6a3e-1a13-4c04-ab64-e4e233472c0c  

~~~
  TransaktionInformation  
  Manifestation  
  
~~~
#### Datastruktur: <a name="0afc3d44-b3f4-40b5-a7a0-21cbb9d394b2"></a>ManifestationSlettet_I  
**UUID:** 0afc3d44-b3f4-40b5-a7a0-21cbb9d394b2  

~~~
  TransaktionInformation  
  ManifestationFAUSTNummer  
  
~~~
#### Datastruktur: <a name="b02a3e83-4160-4834-85d0-9a024ee479fd"></a>Materiale  
**UUID:** b02a3e83-4160-4834-85d0-9a024ee479fd  

~~~
  MaterialeNummer  
  ManifestationFAUSTNummer  
  MaterialeStatus  
  (  
    FlydegruppeKode  
  )  
  *FastFilial*  
    [  
      FilialISILNummer  
    ]  
  *NuværendeFilial*  
    [  
      FilialISILNummer  
    ]  
  (  
    *FastAfdeling*  
      [  
        PlaceringAfdelingNummer  
      ]  
  )  
  (  
    *NuværendeAfdeling*  
      [  
        PlaceringAfdelingNummer  
      ]  
  )  
  (  
    *FastSektion*  
      [  
        PlaceringSektionNummer  
      ]  
  )  
  (  
    *NuværendeSektion*  
      [  
        PlaceringSektionNummer  
      ]  
  )  
  (  
    *FastOpstilling*  
      [  
        PlaceringOpstillingNummer  
      ]  
  )  
  (  
    *NuværendeOpstilling*  
      [  
        PlaceringOpstillingNummer  
      ]  
  )  
  (  
    *FastDelopstilling*  
      [  
        PlaceringDelopstillingNummer  
      ]  
  )  
  (  
    *NuværendeDelopstilling*  
      [  
        PlaceringDelopstillingNummer  
      ]  
  )  
  *FastMaterialegruppe*  
    [  
      MaterialegruppeNummer  
    ]  
  *NuværendeMaterialegruppe*  
    [  
      MaterialegruppeNummer  
    ]  
  (  
    MaterialeAccessionDato  
  )  
  (  
    KassationÅrsagKode  
  )  
  (  
    PeriodikaPublikationNummer  
  )  
  (  
    PeriodikaPublikationVolumen  
  )  
  (  
    PeriodikaPublikationÅrgang  
  )  
  (  
    MaterialeFjernlånMarkering  
  )  
  
~~~
#### Datastruktur: <a name="75951676-7c98-4339-88ec-12a1841d315d"></a>MaterialeListe_I  
**UUID:** 75951676-7c98-4339-88ec-12a1841d315d  
##### Short description
En liste bestående af materialer.


~~~
  TransaktionInformation  
  *MaterialeListe*  
  {  
    *Materiale*  
      [  
        Materiale  
      ]  
  }  
  1000   
  
~~~
#### Datastruktur: <a name="670e2459-720d-4ff5-a6e6-d2754f3e84f3"></a>MaterialeNummerSkiftet_I  
**UUID:** 670e2459-720d-4ff5-a6e6-d2754f3e84f3  

~~~
  TransaktionInformation  
  *GammeltMaterialeNummer*  
    [  
      MaterialeNummer  
    ]  
  *NytMaterialeNummer*  
    [  
      MaterialeNummer  
    ]  
  
~~~
#### Datastruktur: <a name="5bf0b0ed-5370-4271-98a0-daa16b163844"></a>MaterialeSlettet_I  
**UUID:** 5bf0b0ed-5370-4271-98a0-daa16b163844  

~~~
  TransaktionInformation  
  MaterialeNummer  
  
~~~
#### Datastruktur: <a name="03b26516-3a21-412c-8ff7-7045878db5ab"></a>MaterialeSorteret_I  
**UUID:** 03b26516-3a21-412c-8ff7-7045878db5ab  

~~~
  TransaktionInformation  
  MaterialeNummer  
  FilialISILNummer  
  SorteringspunktKode  
  AfkastKode  
  
~~~
#### Datastruktur: <a name="7d5cb1ad-a7fa-434b-9b33-27650bb3a2ee"></a>MaterialeUdlånt_I  
**UUID:** 7d5cb1ad-a7fa-434b-9b33-27650bb3a2ee  

~~~
  TransaktionInformation  
  MaterialeNummer  
  (  
    RekvisitionNummer  
  )  
  (  
    RekvisitionType  
  )  
  *Udlånsfilial*  
    [  
      FilialISILNummer  
    ]  
  
~~~
#### Datastruktur: <a name="f734b3ac-5482-424b-a41e-2297507e6a11"></a>Rekvisition  
**UUID:** f734b3ac-5482-424b-a41e-2297507e6a11  

~~~
  RekvisitionNummer  
  *MaterialeNummerListe*  
  {  
    MaterialeNummer  
  }  
  *Afhentningsfilial*  
    [  
      FilialISILNummer  
    ]  
  (  
    ForrigeReservationId  
  )  
  (  
    NæsteReservationId  
  )  
  (  
    RekvisitionType  
  )  
  (  
    RekvisitionNote  
  )  
  RekvisitionOprettelsesDato  
  (  
    RekvisitionSpecialhåndtering  
  )  
  (  
    RekvisitionTilKassation  
  )  
  (  
    ReservationAktiv  
  )  
  (  
    *Booking*  
      [  
        BookingØnsketAntal  
        BookingMinimumAntal  
        BookingStartDato  
        BookingAntalForberedelsesdage  
      ]  
  )  
  (  
    EDepotTilArkiv  
  )  
  
~~~
#### Datastruktur: <a name="85f6546b-488b-425f-810d-2a44893f0b98"></a>RekvisitionFrataget  
**UUID:** 85f6546b-488b-425f-810d-2a44893f0b98  

~~~
  RekvisitionNummer  
  MaterialeNummer  
  *Fremfindingsfilial*  
    [  
      (  
        FilialISILNummer  
      )  
    ]  
  *Afhentningsfilial*  
    [  
      FilialISILNummer  
    ]  
  RekvisitionType  
  RekvisitionOprettelsesDato  
  KlarTilAfhentning  
  (  
    RekvisitionNote  
  )  
  (  
    RekvisitionSpecialhåndtering  
  )  
  
~~~
#### Datastruktur: <a name="6d9f46b3-6a99-4bb9-8619-6991739a948d"></a>RekvisitionFratagetListe_I  
**UUID:** 6d9f46b3-6a99-4bb9-8619-6991739a948d  
##### Short description
En liste bestående af fratagne rekvisitioner.


~~~
  TransaktionInformation  
  *FratagetRekvisitionListe*  
  {  
    *FratagetRekvisition*  
      [  
        RekvisitionFrataget  
      ]  
  }  
  1000   
  
~~~
#### Datastruktur: <a name="c83bdf8f-0195-439f-91fb-f28c30bb8020"></a>RekvisitionFratagetOpdateret_I  
**UUID:** c83bdf8f-0195-439f-91fb-f28c30bb8020  

~~~
  TransaktionInformation  
  RekvisitionFrataget  
  
~~~
#### Datastruktur: <a name="4e4e33a0-cbdb-4dc4-8acd-8a10a22db041"></a>RekvisitionListe_I  
**UUID:** 4e4e33a0-cbdb-4dc4-8acd-8a10a22db041  
##### Short description
En liste bestående af rekvisitioner


~~~
  TransaktionInformation  
  *RekvisitionListe*  
  {  
    *Rekvisition*  
      [  
        Rekvisition  
      ]  
  }  
  1000   
  
~~~
#### Datastruktur: <a name="e7c6976b-8258-4be8-904d-1030aa0d1cde"></a>RekvisitionOpdateret_I  
**UUID:** e7c6976b-8258-4be8-904d-1030aa0d1cde  

~~~
  TransaktionInformation  
  Rekvisition  
  
~~~
#### Datastruktur: <a name="37b2b800-efbf-4605-a080-fa9935e5735e"></a>RekvisitionSlettet_I  
**UUID:** 37b2b800-efbf-4605-a080-fa9935e5735e  

~~~
  TransaktionInformation  
  RekvisitionNummer  
  RekvisitionType  
  (  
    AnnulleretÅrsag  
  )  
  
~~~
#### Datastruktur: <a name="9d7efb4c-ebdf-4a28-ba15-fc6a6ebd8eb4"></a>TransaktionInformation  
**UUID:** 9d7efb4c-ebdf-4a28-ba15-fc6a6ebd8eb4  
##### Short description
Hændelsestidspunktet for besked, samt hvilken filial beskeden vedrører.


~~~
  HændelseTidspunktUTC  
  
~~~

## Dataelementer:

| Element navn: | Datatype: | Beskrivelse: |
|----|----|----|
| AfkastKode| Tekst20: string, maxLength:20 |  |  
| AktørNavn| Tekst1000: string, maxLength:1000 |  |  
| AktørSorteret| Tekst1000: string, maxLength:1000 |  |  
| AnnulleretÅrsag| Tekst100: string, maxLength:100 |  |  
| BookingAntalForberedelsesdage| TalHel2: integer, maximum:99 |  |  
| BookingMinimumAntal| TalHel3: integer, maximum:999 |  |  
| BookingStartDato| Dato: string, format: date |  |  
| BookingØnsketAntal| TalHel3: integer, maximum:999 |  |  
| EDepotTilArkiv| Markering: boolean |   Angiver om rekvisitionen omhandler materiale, der skal til e-depot.          |  
| FilialForkortelse| Tekst20: string, maxLength:20 |  |  
| FilialISILNummer| ISIL: string |  |  
| FilialNavn| Tekst100: string, maxLength:100 |  |  
| FlydegruppeForkortelse| Tekst20: string, maxLength:20 |  |  
| FlydegruppeKode| Tekst20: string, maxLength:20 |  |  
| FlydegruppeNavn| Tekst100: string, maxLength:100 |  |  
| ForrigeReservationId| Tekst20: string, maxLength:20 |   ForrigeReservationId bruges sammen med NæsteReservationId til at angive prioritetsrækkefølgen på aktive reservationer af samme manifestation. ForrigeReservationId angiver hvilken reservation, der skal opfyldes før den aktuelle reservation.  Hvis ForrigeReservationId ikke er angive, er der tale om, at den aktuelle reservation er først i listen over reservationer, der skal opfyldes. ForrigeReservationId er et transient element og anvendes kun for reservationer.          |  
| FratagningListeNavn| Tekst100: string, maxLength:100 |  |  
| FratagningListeNote| Tekst1000: string, maxLength:1000 |  |  
| FratagningListeType| FratagningListe: string, enum: "Kassation", "Materialepleje", "Andet" |  |  
| FysiskBeskrivelseAntalSider| Tekst100: string, maxLength:100 |  |  
| FysiskBeskrivelseOmfang| Tekst1000: string, maxLength:1000 |  |  
| HændelseTidspunktUTC| DatoTid: string, format: date-time |   HændelseTidspunktUTC anvendes til at angive tidspunktet for den faktiske hændelse, som beskeden omhandler. HændelseTidspunktUTC skal ikke forveksles med TransaktionsTid, der er kaldstidspunktet set fra kalders perspektiv. HændelseTidspunktUTC er et transient element og angives i UTC-tid          |  
| KassationÅrsagForkortelse| Tekst20: string, maxLength:20 |  |  
| KassationÅrsagKode| Tekst20: string, maxLength:20 |  |  
| KassationÅrsagNavn| Tekst100: string, maxLength:100 |  |  
| KlarTilAfhentning| Markering: boolean |   Angiver om materialet er sat på afhentningshylden, og dermed er klar til afhentning. KlarTilAfhentning er et transient element.          |  
| LogistikKategoriNavn| Tekst100: string, maxLength:100 |  |  
| ManifestationFAUSTNummer| Tekst20: string, maxLength:20 |  |  
| ManifestationKlassifikation| Tekst100: string, maxLength:100 |  |  
| ManifestationKlassifikationTekst| Tekst100: string, maxLength:100 |  |  
| MaterialeAccessionDato| Dato: string, format: date |  |  
| MaterialeFjernlånMarkering| Markering: boolean |  |  
| MaterialeNummer| Tekst20: string, maxLength:20 |  |  
| MaterialeStatus| MaterialeTilstand: string, enum: "NotCheckedOut", "CheckedOut", "Discarded", "NotReceived" |   Materialets tilstand kan have følgende værdier: NotCheckedOut, CheckedOut, Discarded og NotReceived          |  
| MaterialegruppeForkortelse| Tekst20: string, maxLength:20 |  |  
| MaterialegruppeNavn| Tekst100: string, maxLength:100 |  |  
| MaterialegruppeNummer| Tekst20: string, maxLength:20 |  |  
| MaterialetypeBeskrivelse| Tekst100: string, maxLength:100 |  |  
| MaterialetypeKode| Tekst100: string, maxLength:100 |  |  
| MusikKlassifikation| Tekst100: string, maxLength:100 |  |  
| MusikPlademærke| Tekst100: string, maxLength:100 |  |  
| MusikPladenummer| Tekst100: string, maxLength:100 |  |  
| NæsteReservationId| Tekst20: string, maxLength:20 |   NæsteReservationId bruges sammen med ForrigeReservationId til at angive prioritetsrækkefølgen på aktive reservationer af samme manifestation. NæsteReservationId angiver hvilken reservation, der skal opfyldes efter den aktuelle reservation. Hvis NæsteReservationId ikke er angive, er der tale om, at den aktuelle reservation er sidst i listen over reservationer, der skal opfyldes. NæsteReservationID er et transient element og anvendes kun for reservationer.          |  
| PeriodikaPublikationNummer| Tekst100: string, maxLength:100 |  |  
| PeriodikaPublikationVolumen| Tekst50: string, maxLength:50 |   danMARC2 felt 245 *g  numerisk eller alfabetisk betegnelse for bind (bindpost)          |  
| PeriodikaPublikationÅrgang| Tekst50: string, maxLength:50 |  |  
| PlaceringAfdelingForkortelse| Tekst20: string, maxLength:20 |  |  
| PlaceringAfdelingNavn| Tekst100: string, maxLength:100 |  |  
| PlaceringAfdelingNummer| Tekst20: string, maxLength:20 |  |  
| PlaceringDelopstillingForkortelse| Tekst20: string, maxLength:20 |  |  
| PlaceringDelopstillingNavn| Tekst100: string, maxLength:100 |  |  
| PlaceringDelopstillingNummer| Tekst20: string, maxLength:20 |  |  
| PlaceringOpstillingForkortelse| Tekst20: string, maxLength:20 |  |  
| PlaceringOpstillingNavn| Tekst100: string, maxLength:100 |  |  
| PlaceringOpstillingNummer| Tekst20: string, maxLength:20 |  |  
| PlaceringSektionForkortelse| Tekst20: string, maxLength:20 |  |  
| PlaceringSektionNavn| Tekst100: string, maxLength:100 |  |  
| PlaceringSektionNummer| Tekst20: string, maxLength:20 |  |  
| RekvisitionNote| Tekst250: string, maxLength:250 |  |  
| RekvisitionNummer| Tekst20: string, maxLength:20 |  |  
| RekvisitionOprettelsesDato| DatoTid: string, format: date-time |  |  
| RekvisitionSpecialhåndtering| Markering: boolean |  |  
| RekvisitionTilKassation| Markering: boolean |  |  
| RekvisitionType| RekvisitionType: string, enum: "RESERVATION", "BOOKING" |   Angiver typen af rekvisition, der enten kan være en reservation, hvor materialet er udlånt eller undervejs eller en booking, hvor der ønskes et antal af samme materiale på et fremtidigt tidspunkt eller i en fremtidig periode.          |  
| ReservationAktiv| Markering: boolean |   Angiver om en reservation er aktiv. En seriereservation vil altid være passiv, indtil låner er klar til næste materiale i serien. ReservationAktiv er et transient element.          |  
| SerieTitel| Tekst100: string, maxLength:100 |  |  
| SorteringspunktKode| Tekst20: string, maxLength:20 |  |  
| TitelNavn| Tekst1000: string, maxLength:1000 |  |  
| TitelSorteret| Tekst1000: string, maxLength:1000 |  |  
| UdgaveBetegnelse| Tekst100: string, maxLength:100 |  |  
| x-AgencyISIL| ISIL: string |   Transient element, der angiver agency i headeren.          |  



