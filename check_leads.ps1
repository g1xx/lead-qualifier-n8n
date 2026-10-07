# Self-contained: sends 21 test leads, compares the model's category with the expected one, prints accuracy
$uri = "http://localhost:5678/webhook/lead"
$json = @'
[
{
"name": "Jan Kowalski",
"company": "AutoSerwis Kowalski",
"message": "Chcemy uruchomi\u0107 kampani\u0119 Google Ads dla 3 warsztat\u00f3w, bud\u017cet ok. 5000 z\u0142 miesi\u0119cznie, start w listopadzie.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "Anna Nowak",
"company": "Piekarnia Z\u0142oty K\u0142os",
"message": "Interesuje nas reklama w social mediach dla naszej piekarni. Jakie macie pakiety?",
"oczekiwane": "ciep\u0142y"
},
{
"name": "Tomek",
"company": "",
"message": "Ile kosztuje strona internetowa?",
"oczekiwane": "zimny"
},
{
"name": "SEO Linki",
"company": "SEO-Linki24",
"message": "Promocja! 1000 link\u00f3w SEO za 99 z\u0142, tylko dzi\u015b!",
"oczekiwane": "zimny"
},
{
"name": "Marek Wi\u015bniewski",
"company": "Sklep Rowerowy Wi\u015bniewski",
"message": "Potrzebujemy kampanii na Black Friday, start za 2 tygodnie, bud\u017cet do ustalenia.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "Kasia Lewandowska",
"company": "Moda Online",
"message": "Prowadzimy sklep internetowy z odzie\u017c\u0105. Chcemy kampani\u0119 na Facebooku i Instagramie, bud\u017cet 3000 z\u0142 miesi\u0119cznie.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "Dr Piotr Zieli\u0144ski",
"company": "Klinika Dentystyczna U\u015bmiech",
"message": "Otwieramy now\u0105 klinik\u0119 stomatologiczn\u0105 w Gliwicach 1 grudnia, potrzebujemy kampanii Google Ads przed otwarciem.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "Ewa Kami\u0144ska",
"company": "Biuro Rachunkowe Kami\u0144ska",
"message": "Jeste\u015bmy biurem rachunkowym i chcieliby\u015bmy pozyskiwa\u0107 wi\u0119cej klient\u00f3w przez internet. Co mo\u017cecie zaproponowa\u0107?",
"oczekiwane": "ciep\u0142y"
},
{
"name": "Pawe\u0142 D\u0105browski",
"company": "TransLog",
"message": "Szukamy agencji do prowadzenia naszego profilu na LinkedIn dla firmy transportowej.",
"oczekiwane": "ciep\u0142y"
},
{
"name": "Ola",
"company": "",
"message": "Jaka jest cena?",
"oczekiwane": "zimny"
},
{
"name": "Krzysztof",
"company": "",
"message": "Dzie\u0144 dobry, prosz\u0119 o kontakt.",
"oczekiwane": "zimny"
},
{
"name": "Dzia\u0142 sprzeda\u017cy",
"company": "LeadBaza",
"message": "Oferujemy tanie leady B2B z bazy 50 000 firm. Zainteresowani?",
"oczekiwane": "zimny"
},
{
"name": "Specjalista SEO",
"company": "TopPozycja",
"message": "Zapraszamy do wsp\u00f3\u0142pracy przy pozycjonowaniu Waszej strony, gwarancja TOP3!",
"oczekiwane": "zimny"
},
{
"name": "Agnieszka W\u00f3jcik",
"company": "Restauracje Smakosz",
"message": "Potrzebujemy kampanii wizerunkowej dla sieci 5 restauracji, bud\u017cet ok. 10 tys. z\u0142.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "Monika",
"company": "Salon Fryzjerski Monika",
"message": "Planujemy wkr\u00f3tce kampani\u0119 dla naszego salonu fryzjerskiego, chcemy wi\u0119cej klient\u00f3w z okolicy.",
"oczekiwane": "ciep\u0142y"
},
{
"name": "John Smith",
"company": "TechParts Ltd",
"message": "We need a Google Ads campaign for the Polish market starting in January, budget 2000 EUR per month.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "\u041e\u043b\u0435\u043d\u0430",
"company": "\u041c\u0430\u0433\u0430\u0437\u0438\u043d \u041e\u043b\u0435\u043d\u0430",
"message": "\u041c\u0438 \u0432\u0456\u0434\u043a\u0440\u0438\u0432\u0430\u0454\u043c\u043e \u043c\u0430\u0433\u0430\u0437\u0438\u043d \u0443 \u041a\u0430\u0442\u043e\u0432\u0456\u0446\u0435 \u0456 \u0445\u043e\u0447\u0435\u043c\u043e \u0440\u0435\u043a\u043b\u0430\u043c\u0443 \u0432 \u0441\u043e\u0446\u043c\u0435\u0440\u0435\u0436\u0430\u0445. \u0429\u043e \u0432\u0438 \u043c\u043e\u0436\u0435\u0442\u0435 \u0437\u0430\u043f\u0440\u043e\u043f\u043e\u043d\u0443\u0432\u0430\u0442\u0438?",
"oczekiwane": "ciep\u0142y"
},
{
"name": "Rafa\u0142",
"company": "Warsztat Rafa\u0142",
"message": "Ile kosztuje kampania Google Ads dla warsztatu samochodowego w Sosnowcu?",
"oczekiwane": "ciep\u0142y"
},
{
"name": "Firma XYZ",
"company": "Firma XYZ",
"message": "",
"oczekiwane": "zimny"
},
{
"name": "\u0141ukasz",
"company": "",
"message": "Dzie\u0144 dobry, chcia\u0142bym aplikowa\u0107 na stanowisko grafika w Waszej agencji.",
"oczekiwane": "zimny"
},
{
"name": "Natalia Koz\u0142owska",
"company": "NovaTech",
"message": "Potrzebujemy landing page i kampanii na premier\u0119 produktu do ko\u0144ca miesi\u0105ca.",
"oczekiwane": "gor\u0105cy"
}
]
'@
$leads = $json | ConvertFrom-Json
$i = 0; $ok = 0; $errors = 0
foreach ($lead in $leads) {
    $i++
    $body = $lead | ConvertTo-Json -Compress
    try {
        $r = Invoke-RestMethod -Method Post -Uri $uri -ContentType "application/json; charset=utf-8" -Body ([System.Text.Encoding]::UTF8.GetBytes($body))
        $got = $r.output.kategoria
        if (-not $got) { $got = $r.kategoria }
        if (-not $got) { $got = "? (raw: " + ($r | ConvertTo-Json -Compress) + ")" }
        $match = ("$got".Length -ge 3) -and ("$got".Substring(0,3).ToLower() -eq "$($lead.oczekiwane)".Substring(0,3).ToLower())
        if ($match) { $ok++; $mark = "OK  " } else { $mark = "MISS" }
        Write-Host "$mark $i/$($leads.Count) $($lead.name) | expected: $($lead.oczekiwane) | model: $got"
    } catch {
        $errors++
        Write-Host "ERR  $i/$($leads.Count) $($lead.name): $($_.Exception.Message)"
    }
    Start-Sleep -Seconds 5
}
Write-Host ""
Write-Host "Accuracy: $ok / $($leads.Count - $errors)  (errors: $errors)"
