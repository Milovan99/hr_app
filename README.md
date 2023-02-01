# HR App

Flutter project.

## O aplikaciji

Naziv aplikacije je „Ofis“ i reč je o aplikaciji koja omogućava efikasnije upravljanje resursima i jednostavniju komunikaciju između korisnika. Cilj aplikacije je da omogući praćenje vremena provedenog radeći određenu aktivnost, lak kalendarski prikaz bitnih događaja korisnicima, olakšavanje procesa slanja zahteva za odmor, pregled radnih sati u određenom vremenskom intervalu, pregled bitnih dokumenata u samoj aplikaciji, pregled informacija o drugim korisnicima i komunikaciju sa njima i planiranje dnevnih aktivnosti pomoću rasporeda zadataka.

<img src="https://user-images.githubusercontent.com/29107405/216125021-7b195391-25ca-44cb-b6b1-85efd7e13b7e.png" width="200" height="350">      <img src="https://user-images.githubusercontent.com/29107405/216125818-2a74d8be-48bc-4c02-b35a-c6bf755dd6e4.png" width="200" height="350">      <img src="https://user-images.githubusercontent.com/29107405/216126015-ef14d060-4d59-4912-9622-362c336254c4.png" width="200" height="350">


Na slici Screenshot aplikacije 1 - Log in ekran ,prikazan je prvi ekran koji će korisnik videti kada se aplikacija pokrene. U app baru nalazi se tekst sa nazivom aplikacije. Ispod app bara se nalazi forma u kojoj je moguće da korisnik unese svoje podatke koji će se poslati bazi podataka i ako su podaci autentični otvoriće se početni ekran sa slike Screenshot aplikacije 2 - Početni ekran. Ako podaci nisu autentični pojaviće se poruka da podaci nisu ispravni.

Na slici Screenshot aplikacije 2 - Početni ekran, prikazan je početni ekran aplikacije. On se sastoji od App bara, horizontalnog skroll menija,dve kartice i u dnu aplikacije se nalazi navigacioni meni.

App bar se satoji od dugmeta koji će klikom na njega odvesti na ekran prikaza obaveštenja, takođe ako korisnik dobije novo obaveštenje ikonica će promeniti boju u crvenu da bi se nagovestilo da je stiglo novo obaveštenje. U sredini app bara nalazi se tekst sa nazivom aplikacije i zatim slika korisnika koja pri klikom na nju otvara ekran profila sa slike Screenshot aplikacije 4 - Profil ekran.

Ispod app bara nalazi se horizontalni skroll meni koji ima tri elementa. Prvi element sa nazivom Zatraži odmor će korisnika odvesti na ekran Odmor sa slike Screenshot aplikacije 5 - Odmor ekran, drugi element sa nazivom Radni sati će korisnika odvesti na ekran Radni sati sa slike Screenshot aplikacije 6 – Radni sati ekran i poslednji element sa nazivom Dokumenti će korisnika odvesti na ekran Dokumenti sa slike Screenshot aplikacije 6 - Dokumenti ekran.

Ispod menija se nalazi check in kartica. Ova kartica omogućuje korisniku da klikom na ikonicu sata obeleži početak rada. Kada je ikonica kliknuta ona će promeniti svoju boju i vreme početka rada će biti ispisano ispod teksta Početak rada. Ponovnim klikom na ikonicu biće ispisano vreme kraja rada i u delu Današnja aktivnost biće ispisana razlika između kraja radnog vremena i početka.

Ispod check in kartice nalazi se kartica Kalendar. Klikom na ikonicu kalendara korisnik će biti odveden na ekran Kalendar sa slike Screenshot aplikacije 7 - Kalendar ekran. U ovoj kartici biće ispisana maksimalno dva događaja koja su najbliža u odnosu na datum koji je kada korisnik otvori aplikaciju.

Ispod Kalendar kartice nalazi se navigacioni meni sa četri elementa. Klikom na jedan od elemenada sadržaj početnog ekrana će se promeniti. Klikom na element sa nazivom Početna sadržaj će biti kao na slici Screenshot aplikacije 2 - Početni ekran. Klikom na element sa nazivom Imenik sadržaj će se promeniti i biće kao sa slike Screenshot aplikacije 8 – Imenik. Klikom na element sa nazivom Poruke sadržaj će se promeniti i biće kao sa slike Screenshot aplikacije 9 – Poruke. Klikom na element sa nazivom Aktivnosti sadržaj će se promeniti i biće kao sa slike Screenshot aplikacije 10 – Aktivnosti.

Na slici Screenshot aplikacije 3 - Ekran obaveštenja, prikazan je ekran koji prikazuje do deset novih obaveštenja. Kada se ovaj ekran otvori označiće se da su obaveštenja pregledana i u koliko je dugme sa početnog ekrana bilo crveno vratiće se u početno stanje. Obaveštenja mogu biti tri vrste: poruka, događaj i odmor. U zavisnosti koje je obaveštenje vrste, kartica obaveštenja će imati drugačiju ikonicu. Osim ikonice kartica obaveštenja sadrži i naslov i opis obaveštenja i vreme u koje je obaveštenje kreirano. Klikom na obaveštenje vrste događjaj otvoriće se ekran Kalendar. Klikom na obaveštenje vrste odmor otvoriće se ekran Odmor . Klikom na obaveštenje vrste poruka otvoriće se ekran Poruka u kome će sadržaj biti sličan kao sa slike Screenshot aplikacije 11 – Poruka ekran.
Na slici Screenshot aplikacije 4 - Profil ekran, se nalazi ekran koji prikazuje podatke o korisniku. Takođe do ovog ekrana se može doći i preko početnog ekrana sa sadržajem Imenik i tada će biti prikazani podaci drugih korisnika. App bar se sastoji od dugmeta koji će odvesti korisnika nazad na prethodni ekran, tekst sa nazivom aplikacije i dugme za log out koje će odjaviti korisnika iz aplikacije i prikazaće se Log in ekran. Ako je korisnik došao do ekrana Profil iz sadržaja Imenik dume za log out neće biti prikazano.

Ispod podatka o lokaciji korisnika nalazi se dugme za uređivanje podataka koje ima ikonicu olovka. Klikom na ovo dugme otvoriće se prozor sa svim trenutnim podacima koji mogu da se izmene. Ako je korisnik došao do ekrana Profil iz sadržaja Imenik dugme za editovanje neće biti prikazano, umesto njega biće prikazano dugme za slanje poruke koje vodi na ekran Poruka. Ispod tog dugmeta nalaze se sve ostale informacije o korisniku.

<img src="https://user-images.githubusercontent.com/29107405/216127204-4c9ceedb-deed-446b-8713-021c0603a967.png" width="200" height="350">      <img src="https://user-images.githubusercontent.com/29107405/216127354-ed09cd8b-4115-433d-8ba0-9647ea41cb0b.png" width="200" height="350">      <img src="https://user-images.githubusercontent.com/29107405/216127471-a20da82d-e639-4283-a5d1-e26627a68720.png" width="200" height="350">

Na slici Screenshot aplikacije 5 - Odmor ekran, se nalazi ekran koji prikazuje stanja zahteva i informacije o stanju. App bar se sastoji od dugmeta koji će odvesti korisnika nazad na prethodni ekran i teksta sa nazivom aplikacije. Ispod App bara nalazi se kartica koja prikazuje poslednji podneti zahtev. U kartici se nalazi opseg datuma za koje se zahtev podnosi, naslov sa opisom vrste zahteva i stanje zahteva.

Ispod te kartice nalazi se druga kartica koja prikazuje broj neiskorištenih dana, iskorištenih dana, rezervisanih dana i ukupno dana godišnjeg odmora. Takođe u toj kartici nalazi se dugme za slanje zahteva i pri kliku na njega otvoriće se prozor u kome može da se unese opseg dana i opis zahteva.

Na slici Screenshot aplikacije 6 – Radni sati ekran, se nalazi ekan koji prikazuje informacije o količini radnih sati. App bar se sastoji od dugmeta koji će odvesti korisnika nazad na prethodni ekran i teksta sa nazivom aplikacije.Ispod app bara nalazi se kartica koja pri klikom na nju omogućuva korisniku da izabere opseg dana za koje želi da pregleda aktivnosti.

Ispod te kartice nalazi se kartica koja prikazuje zbir vremenskih aktivnost za selektovane dane.

Ispod te kartice biće prikazana lista svih pojedinačnih aktivnosti. Ona sadži datum kada je aktivnost napravljena, naziv akrivnosti i koliko je ta aktivnost trajala.

Na slici Screenshot aplikacije 7 - Kalendar ekran, se nalazi ekran koji prikazuje kalendar sa dešavanjima kreiranih od strane korisnika. App bar se sastoji od dugmeta koji će odvesti korisnika nazad na prethodni ekran, tekst sa nazivom aplikacije i dugmetom za dodavanje novih događaja. Kada je dugme za dodavanje novih događaja kliknuto otvoriće se novi prozor koji će omogućiti korisniku da unese novi događaj.

Kada korisnik unese novi događaj on će biti dodat svim ostalim kalendarima drugih korisnika i svako će dobiti obaveštenje o novom događaju.

<img src="https://user-images.githubusercontent.com/29107405/216129601-1f668c23-798a-414e-bb99-efe6bb4b3192.png" width="200" height="350">      <img src="https://user-images.githubusercontent.com/29107405/216129651-32f59271-d841-4414-986a-f6675c7c0f69.png" width="200" height="350">      <img src="https://user-images.githubusercontent.com/29107405/216129671-a66e9fdb-b8fa-4150-95b4-a8bb2c465f27.png" width="200" height="350">

Ispod app bara se nalazi kalendar koji može biti prikazan na tri načina: prikaz čitavog meseca (svih dana u mesecu), prikaz dve sedmice i prikaz jedne sedmice. Pomoću strelica korisnik može da pređe na sledeći mesec ili da ode na prethodni. Na svakom danu će se nalaziti mali kružić koji označava da postoje događaji u tom danu. Prilikom klika na određeni dan pojaviće se plavi krug oko tog datuma i ispod kaledara biće prikazana lista svih događaja u tom danu. Svetlo plavom bojom će biti selektovan dan koji je u tom momentu kad je aplikacija pokrenuta.

Da bi se dodao novi događaj mora se selektovati dan za koji korisnik želi da unese novi događaj. U slučaju da korisnik pokuša da unese novi događaj bez da selektuje dan, dobiće poruku u dnu ekrana da mora selektovati određeni dan. U slučaju da se neki događaj doda u međuvremenu od strane drugog korisnika, automatski će se kalendar ažurirati i moći će se taj događaj videti.

Na slici Screenshot aplikacije 8 – Imenik, se nalazi sadržaj imenika na početnom ekranu. Podaci o korisnicima se isčitavaju i ispisuju u vidu liste. Svaki korisnik koji je u listi ima svoju sliku, ime i prezime, opis posla i grad. U Search baru korisnik može da traži korisnika preko bilo kojih od pređašnje napomenutih argumenata i lista podataka će se automatski ažurirati.

Klikom na nekog od korisnika otvoriće se ekran Profil i ispisaće se svi podaci o korisniku koji je izabran. Funkcija imenika je posebno pogodna za nove članove tima koji koristi aplikaciju i nije još upoznat sa svima.

Na slici Screenshot aplikacije 9 – Poruke, se nalazi sadržaj poruka koje je korisnik razmenio sa drugim korisnicima. Podaci o porukama se iščitavaju i ispisuje se ime i prezime korisnika, slika korisnika i poslednja poruka. U Search baru korisnik može da traži korisnika preko njegovog imena radi lakšeg pronalaska. Klikom na određenu poruku otvoriće se ekran Poruka na kojem će se ispisati sadržaj svih poruka između ta dva korisnika.

<img src="https://user-images.githubusercontent.com/29107405/216129971-88855162-4612-4c29-8485-96aaf0e542e8.png" width="200" height="350">      <img src="https://user-images.githubusercontent.com/29107405/216130008-57a4c247-42dd-44df-a0c0-87f32833391c.png" width="200" height="350">

Na slici Screenshot aplikacije 10 – Aktivnosti, prikazan je sadržaj aktivnosti koji omogućava korisniku da isplanira svoj dan. Ispod app bara prikazana su tri dana sa početnim danom kada je aplikacija pokrenuta i zatim dva sledeća dana.

Ispod dana prikazan je raspored aktivnosti. Aktivnosti se učitavaju iz baze podataka tako da je moguće da korisnik sam doda nove podatke ili da neko drugi isplanira dan za njega. Dodavanje novog događaja se vrši pomoću plavog dugmeta sa znakom plus iznad navigacionog menija koji se nalazi u dnu aplikacije. Klikom na to dugme otvara se prozor koji omogućava korisniku da unese potrebne podatke za kreiranje novog zadatka. Da bi kreirao novi zadatak korisnik mora da unese naziv zadatka, u koliko sati želi da zadatak bude izvršen, dan kada želi da zadatak bude obavljen i vremensko trajanje zadatka. Na osnovu tih podataka kreira se ljubičasti blok sa nazivom koji je korisnik odabrao, pozicioniran je u rasporedu tako da njegova visina odgovara vremenskom intervalu i veličina odgovara vremenskom trajanju.

Na slici Screenshot aplikacije 11 – Poruka ekran, se nalazi ekran na kome su prikazane poruke između dva korisnika. App bar se sastoji od dugmeta koji će odvesti korisnika nazad na prethodni ekran, slike korisnika sa kojim se vodi kominikacija i njegovo ime i prezime. Ispod app bara biće prikazane sve poruke koje su korisnici razmenili. Na desnoj strani se nalaze poruke koje šalje korisnik koji je trenutno ulogovan i koji koristi aplikaciju, a na levoj stani se nalaze poruke korisnika sa kojim se vodi komunikacija. Ispod poruka nalazi se polje za unos nove poruke.

## Dokumentacija koda

<img src="https://user-images.githubusercontent.com/29107405/216132611-6bbf0ee2-1a86-4046-9e77-af483c5ebac4.PNG">

Prva funkcija koja se izvršava pri pokretanju aplikacije je main() funkcija. Iz prikazanog koda se vidi da je asinhronog tipa što znači da će biti potrebno određeno vreme da se dobije rezultat .

Flutter framework koristi widgetbinding da bi bio u mogućnosti da komunicira sa flutter engine-om. Kada je pozvana funkcija ensureInitialized() to je kreiralo instancu WidgetsFlutterBinding  i pošto Firebase.initalizeApp() treba da koristi kanale platforme da bi pozvao native treba se inicijalizirati vezivanje.

Zatim se pojavljuje funkcija runApp() koja će pokrenuti widget koji joj je prosleđen u argumentu i prikazaće ga preko celog ekrana. Widget koji će biti prikazan je MyApp(); proširuje StatelesWidget koji nema promenjiva stanja. Widget build(BuildContext context) opisuje deo korisničkog interfejsa i framework poziva ovu metodu kada je widget ubačen u tree u datom BuildContext i kada se ovisnosti ovog widgeta promene.

StramProvider sluša vrednost toka podataka Korisnik i vraća je. Vredost koja će biti prosleđena svim widget-ima je AuthUsluga().korsinik . U klasi AuthUsluga()  , korisnik  koristi funkciju authStateChanges() koja obaveštava o promena informacija o prijavljenom korisniku i zatim se na osnovu tih informacija vraća ili null vrednost ili korisnikov id. MaterialApp je widget koji obuhvata brojne widgete koji su obično potrebni za aplikacije materijalnog dizajna. DebugShowCheckedModeBanner: false  , uklanja baner koji naznačava da je aplikacija još u procesu izrade. Theme definiše vizualne vrednosti kao što su boja, fontovi i oblici. Korišćen je ThemeData za konfiguraciju Theme-e u kom je podešen font Hubballi, veličina fonta je 19 i boja je približna sivoj. Konfigurisan je widget Omot() kao početna ruta aplikacije. 

<img src="https://user-images.githubusercontent.com/29107405/216133106-333b478a-d360-47bc-84d1-a62af1e520a0.PNG">

Kada se aplikacija pokrene widget Omot odlučuje na osnovu toga da li je korisnik prijavljen ili ne, da li će vratiti Log in ekran(Prijava widet) ili Pocetni ekrana (Kostur widget) aplikacije. Pomoću Provider-a koji šalje vrednost statusa korisnika svim widget-ima može se proveriti da li je korisnik prijavljen ili ne.

<img src="https://user-images.githubusercontent.com/29107405/216133268-470faada-fb7d-4140-b8b6-615ac3844843.PNG">
<img src="https://user-images.githubusercontent.com/29107405/216133373-30ef456b-99e2-4ab7-9cdc-b8c34e7d0065.PNG">
<img src="https://user-images.githubusercontent.com/29107405/216133387-4db7bebf-1947-47e8-b278-6ae71d47b617.PNG">

Widget Prijava proširuje StatefulWidget što znači da može imati promenjiva stanja. Kreirana je instanca klase AuthUsluga() pod nazivom _auth, ucitavanje je bool tip što znači da može imati vrednosti true ili false ; u ovom slučaju je dodeljena vrednost false, string parametar ima vrednosti UTF-16 i taj tip je dodeljen email-u, password-u, error-u i na kraju _formKljuc ima vrednost ključa forme koja će biti napravljena za prijavu korisnika. Ako ucitavanje ima vrednost true biće prikazan widget Ucitavanje koji vraća SpinKit koji je napravljen kao animacija za učitavanje, a ako ucitavanje ima vrednost false biće vraćen Scaffold. Scaffold je widget koji će obično biti prikazan preko čitavog ekrana i implementira obični vizualni layout sturkture  materijalnog dizajna.

<img src="https://user-images.githubusercontent.com/29107405/216133779-c823d3b0-76f7-4993-a013-d9965ac45a3e.PNG">

Boja pozadine Scaffold-a u ovom slučaju je definisana kao boja slična sivoj. AppBar se nalazi na vrhu ekrana i parametri koji su definisani u njemu su elevation koji kontroliše veličinu senke koja se nalazi ispod app bara, boja bara je slična plavoj, title je komponenta koja se obično nalazi na srediti bara i tipično je definisan kao Text widget koji opisuje trenutni sadržaj aplikacije. Body Scaffold-a je primarni sadržaj koji je prikazan ispod app bara, iznad donjeg dela i iza floatingActionButton-a. U njemu se u ovom primeru nalazi Padding widget koji umeće svoj child element. EdgeInsets.symmetric(horizontal: 25) kreira umetanje elementa koji će biti odvojeni sa leve i desne strane od elementa koji ga okružuje za 25 piksela.

Element koji Padding umeće je widget Form koji kreira kontener za polja obrasca. Polja su organizovana pomoću widgeta Column koji kreira vertikalni niz elemenata. Parametar mainAxisAlignment: MainAxisAlignment.center osigurava da elementi u widgetu Column budu pozicionirani u sredini. Elementi forme za prijavu korisnika su Text widget sa dobrodošlicom, SizedBox koji omogućava u ovom slučaju odvajanje elemenata onoliko piksela koliko je prosleđeno u argumentu, dva widget-a TextFormField() i FloatingActionButton(). TextFormField() sadrži validatora koji proverava da li je uneta vrednost u polja i ako je vredost null onda će biti ispisane adekvatne poruke. TextFormField() sadrže i onChanged parametar koji će kada se tekst unese u polje pomoću setState() obavestiti framework da je došlo do promene objekta i dodeliće unete vrednosti. Parametar enableSuggestions: false onemogućuje sugestije pri kucanju. Parametar decoration opisuje kako će izgledati samo polje koje u ovom slučaju ima hintText koji objašnjava šta bi trebalo biti uneto u to polje i ikonicu. Boja je postavljena pomoću fillColor i efekat zaokruženja je postignut pomoću borderRadius-a. FloatingActionButton.extended() kreira dugme sa ikonicom i tekstom koje kada se klikne prvo postavlja parametar ucitavanje da bude true što će pokrenuti animaciju, zatim se proverava autentičnost podataka koji su uneti sa podacima iz baze, ako nema podudaranja učitavanje će biti false i animacija će prestati i poruka će biti ispisana o neuspešnom prijavljivanju .Ako su podaci autentični widget Omot će dobiti informaciju o podacima korisnika koji je prijavljen i biće prikazan widget Kostur.


<img src="https://user-images.githubusercontent.com/29107405/216133971-dc83635f-afd4-41f5-aeea-6b8ad0e0b8dd.PNG">
<img src="https://user-images.githubusercontent.com/29107405/216133992-9d2e8548-8d38-4207-84d1-7b0c24cc0314.PNG">

Ako Provider pošalje podatke widgetu Omot o korisniku prikazaće se widget Kostur. Lista je kolekcija objekata koja ima svoju dužinu i indekse. Lista koja je kreirana je _widgetOptions koja sadrži widgete. Lista _widgetOptions biće kasnije od pomoći kad se bude trebalo odlučiti koji od widget-a će biti prikazan u body-ju Scaffold-a.
Zatim je definisana funkcija _onItemTapped koja će postaviti selektovan indeks za onaj koji joj je prosleđen u argumentu kada bude pozvana. Widget Kostur vraća widget Scaffold. Ovaj put u AppBaru parametar automaticallyImplyLeading ima vrednost false, on kontroliše da li se treba pokušati implicirati vodeći widget ako je null. Parametar flexibleSpace omogućava da se ubaci niz elemenata u app bar. Da bi bili horizontalno poredani elementi korišćen je widget Row i mainAxisAlignment: MainAxisAlignment.spaceEvenly da bi se ravnomerno rasporedili elementi u tom redu. Prvo dugme u redu je dugme za obaveštenja koje u zavisnosti da li je poslednje obaveštenje pročitano menja svoj status.

<img src="https://user-images.githubusercontent.com/29107405/216134257-d5fd124f-b846-462c-aa62-135d95f6fa7f.PNG">
<img src="https://user-images.githubusercontent.com/29107405/216134272-6be07bf1-1f27-4a67-9bd6-c525ca0410bc.PNG">

Da bi se izvršio pristup bazi podataka i da bi se dobili podaci u realnom vremenu korišćen je StreamBuilder. Tok podataka StreamBuildera je dobijen kreiranjem instance baze gde je ruta bila kolekcija „korisnici“ koja je skup dokumenata, zatim dokument trenutno ulogovalnog korisnika što se dobije pomoću Provider-a kolekcija „obaveštenja“ i ti podaci trebaju biti prikazani po vremenu kada su kreirani. Ako snapshot ima podatke mapiraće se prvi dokument u obavestenje. Status dobijamo tako sto se pristupi mapi podataka i traži se podatak sa ključem“status“. U zavistnosti kakav je status, ikonica će imati određenu vrednost. Da bi ikonica bila kreirana koristi se CircleAvatar widget koji u ovom slučaju omogućava da se kreira krug sa ikonicom. Ikonica je ubačena pomoću widgeta Icon. Parametar onPresed omogućava da ako se klikne na ikonicu pomoću Navigator.push() funkcije kreira widget Obavestenja() preko widgeta kostur .

<img src="https://user-images.githubusercontent.com/29107405/216134501-b3b57854-39f5-462c-8db4-a25236a5cb4b.PNG">

Za poslednje dugme koje treba da pri klikom na njega otvori ekran profil korisnika, koristi se takođe StramBuilder sa razlikom da je tok podatak definisan sa već definisanom rutom do željenog dokumenta. Podaci tog dokumenta se šalju u argumentima widgeta Profil() koji će se kreirati preko Kostur widgeta funkcijom Navigator.push() kada se klikne na CircleAvatar što se prati sa GestureDetector-om. Umesto ikonice ovaj put u CircleAvatar-u koristi se Image.asset() za prikaz slike. Da bi mogla biti korišćena slika, u fajlu pubspec.yaml mora da se definiše ruta slike. Novina u ovom Scaffold widget-u je što je iskorišten bottomNavigationBar koji se koristi za definisanje navigacionog menija u dnu Scaffolda. Svaki item ima definisanu aktivnu ikonicu, neaktivnu ikonicu, naslov i boju. Prilikom klika na neki od elemenata što je definisano u parametru onTap poziva se funkcija koja će promeniti selektovani indeks i samim tim promeniće se i body Scaffolda .


<img src="https://user-images.githubusercontent.com/29107405/216134670-b71fa1b6-a95d-4ec2-a6d1-65fb5db4ccc8.PNG">
<img src="https://user-images.githubusercontent.com/29107405/216134709-c6d7cc55-cd86-489f-a16a-6ea9ab2155e0.PNG">
<img src="https://user-images.githubusercontent.com/29107405/216134736-4ad4df41-b08c-4721-a27f-8b48189df7f6.PNG">

Widget Obaveštenja je zadužen za pristup bazi podataka pomoću StramBuilder-a i prikaz svih obaveštenja u određenom formatu. Da bi se kartice svih obaveštenja mogle napraviti koristi se ListView.builder koji kreira niz objekata sa zadatim instrukcijama. Parametar itemCount označava koliko elemenata će biti u listi, u ovom slučaju taj broj se dobija pomoću snapshot.data!.docs.length koji će vratiti broj dokumenata. U parametru itemBuilder je definisan sadržaj same liste i svi podaci iz snapshot-a se šalju widgetu ListaObavestenja pomoću argumenata. Widget ListaObavestenja je zadužen za kreiranje samo jedne kartice obaveštenja. U widgetu Obavestenja se nalazi funkcija _promeniStatus koja prima dva argumenta: dokument i id korisnika. Na osnovu tih informacija kada se funkcija pozove ona će pristupiti bazi podataka i promeniće status poslednjeg obaveštenja u pročitano što će omogućiti da se dugme u widget- u vrati u normalno stanje.

<img src="https://user-images.githubusercontent.com/29107405/216134969-e6f4d0c3-ae62-4fe2-948f-b539b9188450.PNG">
<img src="https://user-images.githubusercontent.com/29107405/216135222-2b52e7d4-e939-4fc9-b0b4-a28dae397043.png">

Widget RadniSati zadužen je za prikaz podataka iz baze podataka vezane za aktivnosti korisnika u različitim danima. Da bi se izabrao dan ili niz dana koje korisnik želi da pregleda korišćena je funkcija showDataRangePicker() koja pri svom pozivu kreira full screen meni datuma sa materijalnim dizajnom. Parametri firstDate i lastDate označavaju početnu i poslednju godinu kalendara koja će se prikazati. Parametar initialDateRange označava datume koje će prvobitno biti selektovani pri pokretanju kalendara. Ostatak parametra koji su korišćeni su tekstualni delovi kaledara koji su konfigurisani zbog prevoda. Sama funkcija pickDateRange() će, ako su željeni podaci uneti, promeniti vrednost datuma koji će biti ispisan u widgetu RadniSati.

<img src="https://user-images.githubusercontent.com/29107405/216135380-6246a125-f854-4e48-b655-6e8433a5fa81.png">

Widget PlaniranjeAkrivnosti prikazuje listu aktivnosti i omogućava korisniku da napravi vremenski raspored zadataka koje želi da izvrši. Da bi se uneo datum za koji se želi napraviti aktivnost koristi se funkcija showDatePicker() koja pri svom pozivu kreira meni datuma sa materijalnim dizajnom. Za razliku od showDataRangePicker() , showDatePicker() omogućava biranje samo jednog datuma. Parametri fisrtDate i lastDate su konfigurisani da omoguće selektovanje samo tri dana sa početnim danom koji će imati vrednost datuma koji je u tom trenutku, što je dizajnirano zbog toga što korisnik u svom prikazu rasporeda vidi samo ta tri datuma

Widget Dokumenti zadužen je za pristup Firebase-vom Storage-u i prikaz tih podataka u vidu liste. Da bi se dobila lista tih dokumenta izvršeno je kreiranje instance sa vrednostima Firebase skladišta formatiranim u listi. Funkcija initState() će se pozvati kada je objekat ubačen u tree i framework će je pozvati samo jednom za svako stanje objekta. Da bi se otvorio dokument potrebno je imati njegov url iz skladišta što omogućava funkcija getDownloadURL(). Pri pozivu funkcije dowloadFile() ona na osnovu argumenta koji joj je prosleđen može dobiti url željenog dokumenta i tu informaciju proslediti widget-u PdfCitac .

<img src="https://user-images.githubusercontent.com/29107405/216135585-392bad0d-7c88-46e3-8bdb-b25016a2f65f.png">

Widget PdfCitac zadužen je za preuzimanje dokumenta uz pomoć url-a i prikaz tog dokumenta. To mu omogućuje PDF().cachedFromUrl(). Parametar maxAgeCacheObject će odrediti koliko dana će se dokument čuvati u keš memoriji, parametar placeholder će prikazati procentualno koliko je dokument učitan i parametar errorWidget će ispitati grešku ako dođe do nje.

<img src="https://user-images.githubusercontent.com/29107405/216135720-2df85113-9366-44ff-8c79-2cc5f1e1b010.png">

Widget Odmor je zadužen za prikaz stanja poslatih zahteva za odmor, informacije o stanju i omogućava da se pošalje novi zahtev. Kada se želi poslati novi zahtev otvoriće se AlterDialog koji kreira novi prostor za unos podataka. Parametar content definisan je da sadrži TextFormField widget-e koji su prostor za unos teksta. Parametar controller kontroliše promene u tekstu koji se unosi u polje.

<img src="https://user-images.githubusercontent.com/29107405/216135840-ea7f67c9-4237-4d29-b099-4d284dff8ae3.png">

Widgdet Poruke zadužen je za prikaz poruka iz baze podataka. Da bi se korisniku omogućio lakši pronalazak poruke sa drugim korisnikom, postavljen je upit pri prikazivanju svih poruka iz baze. Pri kreiranju liste svih poruka postavlja se uslov pomoću funkcije contains() koja će ispitati da li parametar ime u dokumentu sadži prosleđenu vrednost. Vrednost koja se prosleđuje se dobija iz widgeta TextField() koji sluša promene i na svaku izmenu će obavestiti framework da je došlo do promene vrednosti koja se prosleđuje. Funkcija contains() omogućava dinamični prikaz liste i omogućuje funkcionalnost pretraživanja.




