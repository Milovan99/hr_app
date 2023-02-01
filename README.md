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

<img src="https://user-images.githubusercontent.com/29107405/216129601-1f668c23-798a-414e-bb99-efe6bb4b3192.png" width="200" height="350"><img src="https://user-images.githubusercontent.com/29107405/216129651-32f59271-d841-4414-986a-f6675c7c0f69.png" width="200" height="350"><img src="https://user-images.githubusercontent.com/29107405/216129671-a66e9fdb-b8fa-4150-95b4-a8bb2c465f27.png" width="200" height="350">

Ispod app bara se nalazi kalendar koji može biti prikazan na tri načina: prikaz čitavog meseca (svih dana u mesecu), prikaz dve sedmice i prikaz jedne sedmice. Pomoću strelica korisnik može da pređe na sledeći mesec ili da ode na prethodni. Na svakom danu će se nalaziti mali kružić koji označava da postoje događaji u tom danu. Prilikom klika na određeni dan pojaviće se plavi krug oko tog datuma i ispod kaledara biće prikazana lista svih događaja u tom danu. Svetlo plavom bojom će biti selektovan dan koji je u tom momentu kad je aplikacija pokrenuta.

Da bi se dodao novi događaj mora se selektovati dan za koji korisnik želi da unese novi događaj. U slučaju da korisnik pokuša da unese novi događaj bez da selektuje dan, dobiće poruku u dnu ekrana da mora selektovati određeni dan. U slučaju da se neki događaj doda u međuvremenu od strane drugog korisnika, automatski će se kalendar ažurirati i moći će se taj događaj videti.

Na slici Screenshot aplikacije 8 – Imenik, se nalazi sadržaj imenika na početnom ekranu. Podaci o korisnicima se isčitavaju i ispisuju u vidu liste. Svaki korisnik koji je u listi ima svoju sliku, ime i prezime, opis posla i grad. U Search baru korisnik može da traži korisnika preko bilo kojih od pređašnje napomenutih argumenata i lista podataka će se automatski ažurirati.

Klikom na nekog od korisnika otvoriće se ekran Profil i ispisaće se svi podaci o korisniku koji je izabran. Funkcija imenika je posebno pogodna za nove članove tima koji koristi aplikaciju i nije još upoznat sa svima.

Na slici Screenshot aplikacije 9 – Poruke, se nalazi sadržaj poruka koje je korisnik razmenio sa drugim korisnicima. Podaci o porukama se iščitavaju i ispisuje se ime i prezime korisnika, slika korisnika i poslednja poruka. U Search baru korisnik može da traži korisnika preko njegovog imena radi lakšeg pronalaska. Klikom na određenu poruku otvoriće se ekran Poruka na kojem će se ispisati sadržaj svih poruka između ta dva korisnika.

<img src="https://user-images.githubusercontent.com/29107405/216129971-88855162-4612-4c29-8485-96aaf0e542e8.png" width="200" height="350"><img src="https://user-images.githubusercontent.com/29107405/216130008-57a4c247-42dd-44df-a0c0-87f32833391c.png" width="200" height="350">

Na slici Screenshot aplikacije 10 – Aktivnosti, prikazan je sadržaj aktivnosti koji omogućava korisniku da isplanira svoj dan. Ispod app bara prikazana su tri dana sa početnim danom kada je aplikacija pokrenuta i zatim dva sledeća dana.

Ispod dana prikazan je raspored aktivnosti. Aktivnosti se učitavaju iz baze podataka tako da je moguće da korisnik sam doda nove podatke ili da neko drugi isplanira dan za njega. Dodavanje novog događaja se vrši pomoću plavog dugmeta sa znakom plus iznad navigacionog menija koji se nalazi u dnu aplikacije. Klikom na to dugme otvara se prozor koji omogućava korisniku da unese potrebne podatke za kreiranje novog zadatka. Da bi kreirao novi zadatak korisnik mora da unese naziv zadatka, u koliko sati želi da zadatak bude izvršen, dan kada želi da zadatak bude obavljen i vremensko trajanje zadatka. Na osnovu tih podataka kreira se ljubičasti blok sa nazivom koji je korisnik odabrao, pozicioniran je u rasporedu tako da njegova visina odgovara vremenskom intervalu i veličina odgovara vremenskom trajanju.

Na slici Screenshot aplikacije 11 – Poruka ekran, se nalazi ekran na kome su prikazane poruke između dva korisnika. App bar se sastoji od dugmeta koji će odvesti korisnika nazad na prethodni ekran, slike korisnika sa kojim se vodi kominikacija i njegovo ime i prezime. Ispod app bara biće prikazane sve poruke koje su korisnici razmenili. Na desnoj strani se nalaze poruke koje šalje korisnik koji je trenutno ulogovan i koji koristi aplikaciju, a na levoj stani se nalaze poruke korisnika sa kojim se vodi komunikacija. Ispod poruka nalazi se polje za unos nove poruke.






