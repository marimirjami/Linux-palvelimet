#!/usr/bin/env bash

OUT="/var/www/html/viikko3/index.html"

paivays=$(date '+%d.%m.%Y %H:%M:%S %Z')
kayttoaika=$(uptime -p)
levy=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')
ram=$(free -h | awk '/^Mem:/ {print $7}')

levyn_tila() {
    if [ "$1" -lt 80 ]; then
        echo "OK"
    else
        echo "WARNING"
    fi
}

tila=$(levyn_tila "$levy")

mkdir -p /var/www/html/viikko3

cat > "$OUT" <<EOF
<!DOCTYPE html>
<html lang="fi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Week 3 | Linux Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 40px 20px;
    background: #0b1120;
    color: #e2e8f0;
    font-family: 'Inter', Arial, sans-serif;
}

.container {
    max-width: 1050px;
    margin: auto;
}

header {
    margin-bottom: 35px;
}

.label {
    color: #38bdf8;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 3px;
    text-transform: uppercase;
}

h1 {
    font-size: 36px;
    margin: 12px 0;
    color: #ffffff;
}

.subtitle {
    color: #94a3b8;
}

.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 18px;
}

.card {
    background: #151f32;
    border: 1px solid #26344b;
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 18px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.card h2 {
    font-size: 15px;
    color: #94a3b8;
    margin-top: 0;
}

.value {
    font-size: 28px;
    font-weight: 800;
    color: #38bdf8;
    margin: 12px 0;
}

.status {
    display: inline-block;
    padding: 7px 15px;
    border-radius: 20px;
    font-weight: 700;
    font-size: 13px;
    background: #064e3b;
    color: #6ee7b7;
}

.status.warning {
    background: #7f1d1d;
    color: #fca5a5;
}

.description {
    color: #94a3b8;
    font-size: 13px;
}

.section-title {
    margin: 35px 0 18px;
    font-size: 20px;
    color: #ffffff;
}

.info {
    line-height: 1.9;
    color: #cbd5e1;
}

.info strong {
    color: #38bdf8;
}

footer {
    margin-top: 35px;
    padding-top: 20px;
    border-top: 1px solid #26344b;
    color: #64748b;
    font-size: 12px;
    text-align: center;
}

@media (max-width: 600px) {
    h1 {
        font-size: 27px;
    }

    body {
        padding: 25px 15px;
    }
}
</style>
</head>

<body>
<div class="container">

<header>
    <div class="label">Linux system monitoring</div>
    <h1>Week 3 Dashboard</h1>
    <p class="subtitle">Ubuntu-palvelimen reaaliaikainen tilanneraportti</p>
</header>

<div class="card">
    <h2>VIIMEISIN PÄIVITYS</h2>
    <div class="value">$paivays</div>
    <span class="status">● JÄRJESTELMÄ AKTIIVINEN</span>
</div>

<h2 class="section-title">Palvelimen tila</h2>

<div class="grid">

    <div class="card">
        <h2>LEVYTILA</h2>
        <div class="value">$levy%</div>
        <span class="status $([ "$tila" = "WARNING" ] && echo warning)">$tila</span>
    </div>

    <div class="card">
        <h2>VAPAA RAM</h2>
        <div class="value">$ram</div>
    </div>

    <div class="card">
        <h2>KÄYNTIAIKA</h2>
        <div class="value" style="font-size:21px">$kayttoaika</div>
    </div>

</div>

<h2 class="section-title">Linux-komennot</h2>

<div class="card info">
    <p><strong>date:</strong> Näyttää päivämäärän, kellonajan ja aikavyöhykkeen.</p>
    <p><strong>uptime:</strong> Näyttää palvelimen käynnissäoloajan ja kuormituksen.</p>
    <p><strong>df -h /:</strong> Näyttää juuritiedostojärjestelmän levytilan.</p>
    <p><strong>free -h:</strong> Näyttää RAM-muistin käytön ja saatavuuden.</p>
    <p><strong>df -h / | grep vda1:</strong> Putki välittää df-komennon tuloksen grep-komennolle.</p>
</div>

<h2 class="section-title">Raportin automaatio</h2>

<div class="card info">
    <p>Bash-skripti kerää palvelimen tiedot ja muodostaa HTML-raportin.</p>
    <p>Levytilan käyttö alle 80 % = OK.</p>
    <p>Levytilan käyttö vähintään 80 % = WARNING.</p>
    <p>Systemd-ajastin päivittää raportin minuutin välein.</p>
</div>

<h2 class="section-title">Testaus ja opitut asiat</h2>

<div class="card info">
    <p>50 %: OK &nbsp; | &nbsp; 80 %: WARNING &nbsp; | &nbsp; 90 %: WARNING</p>
    <p>Nykyinen levyn käyttö: $levy % – tila $tila.</p>
    <p>Opin käyttämään Bash-skriptejä, putkia ja systemd-ajastinta.</p>
</div>

<footer>
    WEEK 3 PROJECT · UBUNTU LINUX · AUTOMATED SYSTEM REPORT
</footer>

</div>
</body>
</html>
EOF
