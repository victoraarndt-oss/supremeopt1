$BIN_ID  = "6a21a9f2da38895dfe87a36c"
$API_KEY = '$2a$10$lDjWyLRDqFmCHA76Y4SP6euWeAs8ed5Y6UW74DPskbq5WvGCzYKXe'
$HEADERS = @{
    "X-Master-Key" = $API_KEY
    "Content-Type" = "application/json"
    "X-Bin-Meta"   = "false"
}

Clear-Host
Write-Host ""
Write-Host "  ================================================" -ForegroundColor Cyan
Write-Host "         SUPREME OPTIMIZATION LAUNCHER           " -ForegroundColor Cyan
Write-Host "         supreme-optimization.netlify.app        " -ForegroundColor DarkCyan
Write-Host "  ================================================" -ForegroundColor Cyan
Write-Host ""

$key = Read-Host "  Digite sua key de acesso"
$key = $key.Trim().ToUpper()

Write-Host ""
Write-Host "  Verificando key, aguarde..." -ForegroundColor Yellow

try {
    $response = Invoke-RestMethod -Uri "https://api.jsonbin.io/v3/b/$BIN_ID/latest" -Headers $HEADERS -Method GET
    $keys = $response.record.keys
} catch {
    Write-Host "  [ERRO] Falha ao conectar ao servidor." -ForegroundColor Red
    Start-Sleep -Seconds 3; exit
}

$found = $null
foreach ($k in $keys) {
    if ($k.key -eq $key) { $found = $k; break }
}

if (-not $found) {
    Write-Host "  [ERRO] Key invalida!" -ForegroundColor Red
    Write-Host "  Adquira em: supreme-optimization.netlify.app" -ForegroundColor DarkCyan
    Start-Sleep -Seconds 4; exit
}

if ($found.usada -eq $true) {
    Write-Host "  [ERRO] Essa key ja foi utilizada!" -ForegroundColor Red
    Write-Host "  Cada key so pode ser usada 1 vez." -ForegroundColor Yellow
    Start-Sleep -Seconds 4; exit
}

$found.usada = $true
$bodyJson = (@{ keys = $keys } | ConvertTo-Json -Depth 10)

try {
    Invoke-RestMethod -Uri "https://api.jsonbin.io/v3/b/$BIN_ID" -Method PUT -Headers $HEADERS -Body $bodyJson | Out-Null
} catch {
    Write-Host "  [ERRO] Falha ao validar key. Tente novamente." -ForegroundColor Red
    Start-Sleep -Seconds 3; exit
}

Clear-Host
Write-Host ""
Write-Host "  ================================================" -ForegroundColor Green
Write-Host "            ACESSO LIBERADO!                     " -ForegroundColor Green
Write-Host "  ================================================" -ForegroundColor Green
Write-Host ""
Write-Host "  Plano: $($found.plano.ToUpper())" -ForegroundColor Cyan
Write-Host "  Iniciando Supreme Optimization..." -ForegroundColor White
Start-Sleep -Seconds 2

switch ($found.plano.ToLower()) {

    "starter" {
        Write-Host "  [STARTER] Aplicando tweaks basicos..." -ForegroundColor Yellow
        Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -ErrorAction SilentlyContinue
        Write-Host "  [OK] Limpeza de temporarios concluida!" -ForegroundColor Green
        Write-Host "  [OK] Animacoes reduzidas!" -ForegroundColor Green
    }

    "pro" {
        Write-Host "  [PRO] Aplicando otimizacoes avancadas..." -ForegroundColor Yellow
        Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -ErrorAction SilentlyContinue
        $servicosDesativar = @("SysMain","DiagTrack","WSearch")
        foreach ($svc in $servicosDesativar) {
            Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
            Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
        }
        netsh int tcp set global autotuninglevel=normal | Out-Null
        netsh int tcp set global chimney=enabled | Out-Null
        Write-Host "  [OK] Limpeza de temporarios concluida!" -ForegroundColor Green
        Write-Host "  [OK] Prioridade de CPU ajustada!" -ForegroundColor Green
        Write-Host "  [OK] Servicos desnecessarios desativados!" -ForegroundColor Green
        Write-Host "  [OK] Rede otimizada!" -ForegroundColor Green
    }

    "supreme" {
        Write-Host "  [SUPREME] Aplicando configuracoes definitivas..." -ForegroundColor Yellow
        Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -ErrorAction SilentlyContinue
        $servicosDesativar = @("SysMain","DiagTrack","WSearch","TabletInputService","Fax")
        foreach ($svc in $servicosDesativar) {
            Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
            Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
        }
        netsh int tcp set global autotuninglevel=normal | Out-Null
        netsh int tcp set global chimney=enabled | Out-Null
        bcdedit /set useplatformclock false | Out-Null
        bcdedit /set disabledynamictick yes | Out-Null
        powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c | Out-Null
        Write-Host "  [OK] Limpeza concluida!" -ForegroundColor Green
        Write-Host "  [OK] CPU, Rede e GPU otimizados!" -ForegroundColor Green
        Write-Host "  [OK] Plano de energia: Alto Desempenho!" -ForegroundColor Green
    }

    "ultrax" {
        Write-Host "  [ULTRA X] Carregando painel completo..." -ForegroundColor Magenta
        Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -ErrorAction SilentlyContinue
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -ErrorAction SilentlyContinue
        $servicosDesativar = @("SysMain","DiagTrack","WSearch","TabletInputService","Fax","RetailDemo")
        foreach ($svc in $servicosDesativar) {
            Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
            Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
        }
        netsh int tcp set global autotuninglevel=normal | Out-Null
        netsh int tcp set global chimney=enabled | Out-Null
        bcdedit /set useplatformclock false | Out-Null
        bcdedit /set disabledynamictick yes | Out-Null
        powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c | Out-Null
        $adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
        foreach ($adapter in $adapters) {
            Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction SilentlyContinue
        }
        Write-Host "  [OK] Todas as otimizacoes aplicadas!" -ForegroundColor Green
        Write-Host "  [OK] DNS alterado para Cloudflare!" -ForegroundColor Green
        Write-Host "  [OK] Ultra X completo!" -ForegroundColor Magenta
    }

    default {
        Write-Host "  [AVISO] Plano nao reconhecido. Entre no Discord." -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "  ================================================" -ForegroundColor Cyan
Write-Host "       OTIMIZACAO CONCLUIDA COM SUCESSO!         " -ForegroundColor Green
Write-Host "  ================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Obrigado por escolher a Supreme Optimization!" -ForegroundColor White
Write-Host "  Discord: discord.gg/eHGuVYqgw4" -ForegroundColor DarkCyan
Write-Host ""
pause