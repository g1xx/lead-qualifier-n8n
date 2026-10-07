# Holdout set: 10 NEW leads the prompt was never tuned on. Sends them, compares the model's category with the expected one, prints accuracy
# Usage: .\check_holdout.ps1          (all leads)
#        .\check_holdout.ps1 -From 5  (only leads 5..10)
param([int]$From = 1)
$uri = "http://localhost:5678/webhook/lead"
$json = @'
[
{
"name": "Joanna Mazur",
"company": "Szko\u0142a J\u0119zykowa Lingua",
"message": "Prowadzimy szko\u0142\u0119 j\u0119zykow\u0105 w Katowicach i chcemy kampani\u0119 na Facebooku od 1 listopada.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "Tomasz Krawczyk",
"company": "Hotel Pod Giewontem",
"message": "Interesuje nas pozycjonowanie strony naszego hotelu w Zakopanem.",
"oczekiwane": "ciep\u0142y"
},
{
"name": "Kuba",
"company": "",
"message": "Ile za logo?",
"oczekiwane": "zimny"
},
{
"name": "Dzia\u0142 handlowy",
"company": "VPS-Pro",
"message": "Oferujemy hosting VPS w promocji -50%! Zam\u00f3w ju\u017c dzi\u015b.",
"oczekiwane": "zimny"
},
{
"name": "Adam Nowicki",
"company": "ElektroMax",
"message": "Mamy sklep z elektronik\u0105, bud\u017cet 8 tys. z\u0142 na kampani\u0119 Google Shopping.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "Mec. Barbara Lis",
"company": "Kancelaria Prawna Lis",
"message": "Chcemy od\u015bwie\u017cy\u0107 wizerunek naszej kancelarii w internecie. Co proponujecie?",
"oczekiwane": "ciep\u0142y"
},
{
"name": "Emma Clarke",
"company": "Bean There Cafe",
"message": "Do you offer social media management? We are a small cafe in Krakow.",
"oczekiwane": "ciep\u0142y"
},
{
"name": "x",
"company": "",
"message": "test",
"oczekiwane": "zimny"
},
{
"name": "Grzegorz Pawlak",
"company": "Meble Pawlak",
"message": "Ile kosztuje kampania Google Ads dla salonu meblowego w Gliwicach? Chcieliby\u015bmy ruszy\u0107 w grudniu.",
"oczekiwane": "gor\u0105cy"
},
{
"name": "\u0412\u0456\u043a\u0442\u043e\u0440",
"company": "\u0410\u0432\u0442\u043e\u0441\u0435\u0440\u0432\u0456\u0441 \u0412\u0456\u043a\u0442\u043e\u0440",
"message": "\u0425\u043e\u0447\u0435\u043c\u043e \u0440\u0435\u043a\u043b\u0430\u043c\u0443 \u0432 Google \u0434\u043b\u044f \u0430\u0432\u0442\u043e\u0441\u0435\u0440\u0432\u0456\u0441\u0443, \u0431\u044e\u0434\u0436\u0435\u0442 4000 \u0437\u043b\u043e\u0442\u0438\u0445 \u043d\u0430 \u043c\u0456\u0441\u044f\u0446\u044c.",
"oczekiwane": "gor\u0105cy"
}
]
'@
$leads = $json | ConvertFrom-Json
$i = 0; $ok = 0; $errors = 0
foreach ($lead in $leads) {
    $i++
    if ($i -lt $From) { continue }
    $body = $lead | ConvertTo-Json -Compress
    $done = $false
    for ($try = 1; $try -le 3 -and -not $done; $try++) {
        try {
            $r = Invoke-RestMethod -Method Post -Uri $uri -ContentType "application/json; charset=utf-8" -Body ([System.Text.Encoding]::UTF8.GetBytes($body))
            $got = $r.output.kategoria
            if (-not $got) { $got = $r.kategoria }
            if (-not $got) { $got = "? (raw: " + ($r | ConvertTo-Json -Compress) + ")" }
            $match = ("$got".Length -ge 3) -and ("$got".Substring(0,3).ToLower() -eq "$($lead.oczekiwane)".Substring(0,3).ToLower())
            if ($match) { $ok++; $mark = "OK  " } else { $mark = "MISS" }
            Write-Host "$mark $i/$($leads.Count) $($lead.name) | expected: $($lead.oczekiwane) | model: $got"
            $done = $true
        } catch {
            if ($try -lt 3) {
                Write-Host "...  $i/$($leads.Count) $($lead.name): error, retry $try/2 in 30 s"
                Start-Sleep -Seconds 30
            } else {
                $errors++
                Write-Host "ERR  $i/$($leads.Count) $($lead.name): $($_.Exception.Message)"
            }
        }
    }
    Start-Sleep -Seconds 10
}
$total = $leads.Count - $From + 1
Write-Host ""
Write-Host "Accuracy: $ok / $($total - $errors)  (errors: $errors)"
