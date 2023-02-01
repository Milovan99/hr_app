# HR App

Flutter project.

## O aplikaciji

Naziv aplikacije je „Ofis“ i reč je o aplikaciji koja omogućava efikasnije upravljanje resursima i jednostavniju komunikaciju između korisnika. Cilj aplikacije je da omogući praćenje vremena provedenog radeći određenu aktivnost, lak kalendarski prikaz bitnih događaja korisnicima, olakšavanje procesa slanja zahteva za odmor, pregled radnih sati u određenom vremenskom intervalu, pregled bitnih dokumenata u samoj aplikaciji, pregled informacija o drugim korisnicima i komunikaciju sa njima i planiranje dnevnih aktivnosti pomoću rasporeda zadataka.

<img src="https://user-images.githubusercontent.com/29107405/216125021-7b195391-25ca-44cb-b6b1-85efd7e13b7e.png" width="200" height="300"> <img src="https://user-images.githubusercontent.com/29107405/216125818-2a74d8be-48bc-4c02-b35a-c6bf755dd6e4.png" width="200" height="300"> <img src="https://user-images.githubusercontent.com/29107405/216126015-ef14d060-4d59-4912-9622-362c336254c4.png" width="200" height="300">


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

![Screenshot aplikacije 4 – Profil ekran](https://user-images.githubusercontent.com/29107405/216127204-4c9ceedb-deed-446b-8713-021c0603a967.png)

![Screenshot aplikacije 5 - Odmor ekran](https://user-images.githubusercontent.com/29107405/216127354-ed09cd8b-4115-433d-8ba0-9647ea41cb0b.png)

![Screenshot aplikacije 6 - Radni sati ekran](https://user-images.githubusercontent.com/29107405/216127471-a20da82d-e639-4283-a5d1-e26627a68720.png)

