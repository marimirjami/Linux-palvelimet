# Viikko 4 – Palvelinreplikointi ja varmuuskopiointi

## Palvelimet ##

~ Palvelin A: 193.166.24.23 (Master)
A: http://193.166.24.23/viikko2/

~ Palvelin B: 195.148.20.62 (Replica)
B: http://195.148.20.62/viikko4/

## Tietokantareplikointi ##

MariaDB-tietokanta replikoituu palvelimelta A palvelimelle B.

Palvelimen B verkkosivu lukee tietoja paikallisesta tietokannasta. B-palvelimen sovelluskäyttäjällä on vain lukuoikeudet.

## Varmuuskopiointi ##

Palvelimella B on Bash-skripti, joka varmuuskopioi verkkosivuston tunnin välein.

Varmuuskopiot tallennetaan hakemistoon:

Lokitiedosto on tää:
/srv/backups/www/backup.log

Varmuuskopioinnin onnistumiset kirjataan lokitiedostoon.

## Testaaminen ##

~ Verkkosivut toimivat julkisessa verkossa.

~ Tietokantareplikointi toimii A:lta B:lle.

~ Varmuuskopiointi toimii automaattisesti.

~ Varmuuskopion palautusta testattiin erillisessä hakemistossa.

~ Palveluiden toiminta tarkistettiin uudelleenkäynnistyksen jälkee

