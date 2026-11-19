# Viikko 2 – Python-verkkosovellus

Pythonilla ja Flaskilla toteutettu verkkosovellus.

## Teknologiat
- Python
- Flask
- Gunicorn
- MariaDB
- Nginx

## Ominaisuudet
- Tietokantaan tallentuva kävijälaskuri
- Kolme sovellusinstanssia
- Nginx-kuormantasaus
- Automaattinen käynnistys systemd-palveluna

## Osoite
http://193.166.24.23/viikko2/

-------------------------------------------------------------

#Viikko 3 - Linux palvelinraportti

## Ominaisuudet
- Bash-skripti kerää palvelimen tietoja.
- HTML-raportti näyttää levyn käytön, vapaan RAM-muistin ja käyttöajan.
- CSS-tyylit vaihdettu dashboard.
- Systemd-palvelu suorittaa raportin luonnin.
- Systemd-ajastin päivittää raportin minuutin välein.

## Linux-komennot
- date - päivämäärä ja kellonaika.
- uptime - palvelimen käyttöaika.
- df - levytilan käyttö.
- free - RAM-muistin tiedot.
- awk ja grep - tietojen käsittely.
- Putki (|) - komentojen tulosteiden välittäminen.

## Levytilan tarkistus
- Alle 80% - OK.
- Vähintään 80% - WARNING / VAROITUS.

## Tiedostot
- viikko3/raportti.sh
- viikko3/systemd/viikko3.service
- viikko3/systemd/viikko3.timer

## Verkkosivu
http://193.166.24.23/viikko3/
