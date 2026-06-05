# Supreme Optimization - Interface Grafica WPF
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

$BIN_ID  = "6a21a9f2da38895dfe87a36c"
$API_KEY = '$2a$10$lDjWyLRDqFmCHA76Y4SP6euWeAs8ed5Y6UW74DPskbq5WvGCzYKXe'
$HEADERS = @{
    "X-Master-Key" = $API_KEY
    "Content-Type" = "application/json"
    "X-Bin-Meta"   = "false"
}

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Supreme Optimization" Height="600" Width="900"
        WindowStartupLocation="CenterScreen"
        Background="#0d0d0d" ResizeMode="CanMinimize">

    <Window.Resources>
        <Style x:Key="SupremeBtn" TargetType="Button">
            <Setter Property="Background" Value="#1a1a2e"/>
            <Setter Property="Foreground" Value="#00d4ff"/>
            <Setter Property="BorderBrush" Value="#00d4ff"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Padding" Value="10,6"/>
            <Setter Property="Margin" Value="5"/>
            <Setter Property="FontFamily" Value="Consolas"/>
            <Setter Property="FontSize" Value="12"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}"
                                BorderBrush="{TemplateBinding BorderBrush}"
                                BorderThickness="{TemplateBinding BorderThickness}"
                                CornerRadius="4">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Background" Value="#00d4ff"/>
                                <Setter Property="Foreground" Value="#0d0d0d"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style x:Key="SupremeCheck" TargetType="CheckBox">
            <Setter Property="Foreground" Value="#cccccc"/>
            <Setter Property="FontFamily" Value="Consolas"/>
            <Setter Property="FontSize" Value="12"/>
            <Setter Property="Margin" Value="5,4"/>
        </Style>

        <Style TargetType="TabItem">
            <Setter Property="Background" Value="#1a1a2e"/>
            <Setter Property="Foreground" Value="#00d4ff"/>
            <Setter Property="FontFamily" Value="Consolas"/>
            <Setter Property="FontSize" Value="13"/>
            <Setter Property="Padding" Value="15,8"/>
            <Setter Property="BorderThickness" Value="0"/>
        </Style>
    </Window.Resources>

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="70"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="35"/>
        </Grid.RowDefinitions>

        <Border Grid.Row="0" Background="#1a1a2e" BorderBrush="#00d4ff" BorderThickness="0,0,0,1">
            <Grid>
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center" Margin="20,0">
                    <TextBlock Text="⚡" FontSize="28" Foreground="#00d4ff" VerticalAlignment="Center" Margin="0,0,10,0"/>
                    <StackPanel VerticalAlignment="Center">
                        <TextBlock Text="SUPREME OPTIMIZATION" FontSize="20" FontWeight="Bold"
                                   Foreground="#00d4ff" FontFamily="Consolas"/>
                        <TextBlock Text="supreme-optimization.netlify.app" FontSize="11"
                                   Foreground="#666666" FontFamily="Consolas"/>
                    </StackPanel>
                </StackPanel>
                <TextBlock x:Name="PlanoBadge" Text="" FontSize="13" FontWeight="Bold"
                           Foreground="#00d4ff" FontFamily="Consolas"
                           HorizontalAlignment="Right" VerticalAlignment="Center" Margin="0,0,20,0"/>
            </Grid>
        </Border>

        <Grid x:Name="LoginGrid" Grid.Row="1" Background="#0d0d0d">
            <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center" Width="400">
                <TextBlock Text="🔐 ACESSO RESTRITO" FontSize="22" FontWeight="Bold"
                           Foreground="#00d4ff" FontFamily="Consolas"
                           HorizontalAlignment="Center" Margin="0,0,0,10"/>
                <TextBlock Text="Digite sua chave de acesso para continuar"
                           Foreground="#888888" FontFamily="Consolas" FontSize="12"
                           HorizontalAlignment="Center" Margin="0,0,0,30"/>

                <Border Background="#1a1a2e" BorderBrush="#00d4ff" BorderThickness="1" CornerRadius="6" Padding="15">
                    <StackPanel>
                        <TextBlock Text="CHAVE DE ACESSO" Foreground="#00d4ff"
                                   FontFamily="Consolas" FontSize="11" Margin="0,0,0,8"/>
                        <TextBox x:Name="KeyInput"
                                 Background="#0d0d0d" Foreground="#ffffff"
                                 BorderBrush="#00d4ff" BorderThickness="1"
                                 FontFamily="Consolas" FontSize="14"
                                 Padding="10,8" CaretBrush="#00d4ff"
                                 Text="SUPREME-"/>
                        <TextBlock x:Name="StatusMsg" Text="" FontFamily="Consolas"
                                   FontSize="12" Margin="0,10,0,0" HorizontalAlignment="Center"/>
                        <Button x:Name="BtnValidar" Content="▶  VALIDAR KEY"
                                Style="{StaticResource SupremeBtn}"
                                Height="40" Margin="0,15,0,0" FontSize="14"/>
                        <TextBlock Text="Não tem uma key? Acesse supreme-optimization.netlify.app"
                                   Foreground="#555555" FontFamily="Consolas" FontSize="10"
                                   HorizontalAlignment="Center" Margin="0,15,0,0"/>
                    </StackPanel>
                </Border>
            </StackPanel>
        </Grid>

        <Grid x:Name="MainGrid" Grid.Row="1" Background="#0d0d0d" Visibility="Collapsed">
            <TabControl Background="#0d0d0d" BorderThickness="0" Margin="10">

                <TabItem Header="⚙ Otimizações">
                    <ScrollViewer VerticalScrollBarVisibility="Auto" Background="#0d0d0d">
                        <StackPanel Margin="20">
                            <TextBlock Text="▌ SISTEMA" Foreground="#00d4ff"
                                       FontFamily="Consolas" FontSize="14" FontWeight="Bold" Margin="0,0,0,10"/>
                            <Border Background="#1a1a2e" CornerRadius="6" Padding="15" Margin="0,0,0,15">
                                <StackPanel>
                                    <CheckBox x:Name="chkTemp"  Content="Limpar arquivos temporários" Style="{StaticResource SupremeCheck}" IsChecked="True"/>
                                    <CheckBox x:Name="chkAnim"  Content="Desativar animações do Windows" Style="{StaticResource SupremeCheck}" IsChecked="True"/>
                                    <CheckBox x:Name="chkCPU"   Content="Otimizar prioridade de CPU" Style="{StaticResource SupremeCheck}"/>
                                    <CheckBox x:Name="chkPower" Content="Plano de energia: Alto Desempenho" Style="{StaticResource SupremeCheck}"/>
                                </StackPanel>
                            </Border>

                            <TextBlock Text="▌ SERVIÇOS" Foreground="#00d4ff"
                                       FontFamily="Consolas" FontSize="14" FontWeight="Bold" Margin="0,0,0,10"/>
                            <Border Background="#1a1a2e" CornerRadius="6" Padding="15" Margin="0,0,0,15">
                                <StackPanel>
                                    <CheckBox x:Name="chkSysMain" Content="Desativar SysMain (Superfetch)" Style="{StaticResource SupremeCheck}"/>
                                    <CheckBox x:Name="chkDiag"    Content="Desativar Telemetria (DiagTrack)" Style="{StaticResource SupremeCheck}" IsChecked="True"/>
                                    <CheckBox x:Name="chkSearch"  Content="Desativar Windows Search" Style="{StaticResource SupremeCheck}"/>
                                </StackPanel>
                            </Border>

                            <TextBlock Text="▌ REDE" Foreground="#00d4ff"
                                       FontFamily="Consolas" FontSize="14" FontWeight="Bold" Margin="0,0,0,10"/>
                            <Border Background="#1a1a2e" CornerRadius="6" Padding="15" Margin="0,0,0,15">
                                <StackPanel>
                                    <CheckBox x:Name="chkTCP" Content="Otimizar TCP/IP" Style="{StaticResource SupremeCheck}" IsChecked="True"/>
                                    <CheckBox x:Name="chkDNS" Content="DNS Cloudflare (1.1.1.1) - Mais rápido" Style="{StaticResource SupremeCheck}"/>
                                </StackPanel>
                            </Border>

                            <TextBlock Text="▌ GPU / AVANÇADO" Foreground="#00d4ff"
                                       FontFamily="Consolas" FontSize="14" FontWeight="Bold" Margin="0,0,0,10"/>
                            <Border Background="#1a1a2e" CornerRadius="6" Padding="15" Margin="0,0,0,15">
                                <StackPanel>
                                    <CheckBox x:Name="chkHPET" Content="Desativar HPET (melhor FPS)" Style="{StaticResource SupremeCheck}"/>
                                    <CheckBox x:Name="chkTick" Content="Desativar Dynamic Tick" Style="{StaticResource SupremeCheck}"/>
                                </StackPanel>
                            </Border>

                            <Button x:Name="BtnOtimizar" Content="⚡  APLICAR OTIMIZAÇÕES"
                                    Style="{StaticResource SupremeBtn}" Height="45" FontSize="15" Margin="0,10,0,0"/>
                        </StackPanel>
                    </ScrollViewer>
                </TabItem>

                <TabItem Header="📋 Log">
                    <Grid Background="#0d0d0d" Margin="10">
                        <TextBox x:Name="LogBox"
                                 Background="#0d0d0d" Foreground="#00ff88"
                                 FontFamily="Consolas" FontSize="12"
                                 IsReadOnly="True" TextWrapping="Wrap"
                                 VerticalScrollBarVisibility="Auto"
                                 BorderBrush="#333333" BorderThickness="1"
                                 Padding="10" AcceptsReturn="True"/>
                    </Grid>
                </TabItem>

                <TabItem Header="ℹ Sobre">
                    <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center" Margin="40">
                        <TextBlock Text="⚡ SUPREME OPTIMIZATION" FontSize="24" FontWeight="Bold"
                                   Foreground="#00d4ff" FontFamily="Consolas" HorizontalAlignment="Center" Margin="0,0,0,10"/>
                        <TextBlock Text="Versão 1.0" Foreground="#666666"
                                   FontFamily="Consolas" HorizontalAlignment="Center" Margin="0,0,0,30"/>
                        <TextBlock TextWrapping="Wrap" TextAlignment="Center" Foreground="#aaaaaa"
                                   FontFamily="Consolas" FontSize="12" Margin="0,0,0,20"
                                   Text="Ferramenta profissional de otimização para Windows.&#10;Melhore o desempenho do seu PC com apenas alguns cliques."/>
                        <TextBlock Text="supreme-optimization.netlify.app" Foreground="#00d4ff"
                                   FontFamily="Consolas" HorizontalAlignment="Center" FontSize="13"/>
                        <TextBlock Text="Discord: discord.gg/eHGuVYqgw4" Foreground="#666666"
                                   FontFamily="Consolas" HorizontalAlignment="Center" Margin="0,5,0,0"/>
                    </StackPanel>
                </TabItem>

            </TabControl>
        </Grid>

        <Border Grid.Row="2" Background="#1a1a2e" BorderBrush="#00d4ff" BorderThickness="0,1,0,0">
            <TextBlock x:Name="FooterMsg"
                       Text="© Supreme Optimization — Aguardando autenticação..."
                       Foreground="#555555" FontFamily="Consolas" FontSize="11"
                       VerticalAlignment="Center" Margin="15,0"/>
        </Border>
    </Grid>
</Window>
"@

$reader = [System.Xml.XmlNodeReader]::new($xaml)
$window = [System.Windows.Markup.XamlReader]::Load($reader)

$LoginGrid   = $window.FindName("LoginGrid")
$MainGrid    = $window.FindName("MainGrid")
$KeyInput    = $window.FindName("KeyInput")
$StatusMsg   = $window.FindName("StatusMsg")
$BtnValidar  = $window.FindName("BtnValidar")
$BtnOtimizar = $window.FindName("BtnOtimizar")
$LogBox      = $window.FindName("LogBox")
$PlanoBadge  = $window.FindName("PlanoBadge")
$FooterMsg   = $window.FindName("FooterMsg")
$chkTemp     = $window.FindName("chkTemp")
$chkAnim     = $window.FindName("chkAnim")
$chkCPU      = $window.FindName("chkCPU")
$chkPower    = $window.FindName("chkPower")
$chkSysMain  = $window.FindName("chkSysMain")
$chkDiag     = $window.FindName("chkDiag")
$chkSearch   = $window.FindName("chkSearch")
$chkTCP      = $window.FindName("chkTCP")
$chkDNS      = $window.FindName("chkDNS")
$chkHPET     = $window.FindName("chkHPET")
$chkTick     = $window.FindName("chkTick")

function Add-Log($msg) {
    $timestamp = Get-Date -Format "HH:mm:ss"
    $LogBox.AppendText("[$timestamp] $msg`n")
    $LogBox.ScrollToEnd()
}

$BtnValidar.Add_Click({
    $key = $KeyInput.Text.Trim().ToUpper()
    $StatusMsg.Text = "Verificando..."
    $StatusMsg.Foreground = "#ffcc00"
    $BtnValidar.IsEnabled = $false

    try {
        $response = Invoke-RestMethod -Uri "https://api.jsonbin.io/v3/b/$BIN_ID/latest" -Headers $HEADERS -Method GET
        $keys = $response.record.keys
    } catch {
        $StatusMsg.Text = "❌ Erro ao conectar ao servidor!"
        $StatusMsg.Foreground = "#ff4444"
        $BtnValidar.IsEnabled = $true
        return
    }

    $found = $null
    foreach ($k in $keys) { if ($k.key -eq $key) { $found = $k; break } }

    if (-not $found) {
        $StatusMsg.Text = "❌ Key inválida! Verifique e tente novamente."
        $StatusMsg.Foreground = "#ff4444"
        $BtnValidar.IsEnabled = $true
        return
    }

    if ($found.usada -eq $true) {
        $StatusMsg.Text = "❌ Essa key já foi utilizada!"
        $StatusMsg.Foreground = "#ff4444"
        $BtnValidar.IsEnabled = $true
        return
    }

    $found.usada = $true
    $bodyJson = (@{ keys = $keys } | ConvertTo-Json -Depth 10)
    try {
        Invoke-RestMethod -Uri "https://api.jsonbin.io/v3/b/$BIN_ID" -Method PUT -Headers $HEADERS -Body $bodyJson | Out-Null
    } catch {
        $StatusMsg.Text = "❌ Erro ao registrar key. Tente novamente."
        $StatusMsg.Foreground = "#ff4444"
        $BtnValidar.IsEnabled = $true
        return
    }

    $script:planoAtual = $found.plano.ToLower()
    $PlanoBadge.Text = "PLANO: $($found.plano.ToUpper())"
    $FooterMsg.Text = "✔ Autenticado — Plano $($found.plano.ToUpper()) ativo"
    $FooterMsg.Foreground = "#00d4ff"

    if ($script:planoAtual -eq "starter") {
        $chkCPU.IsEnabled = $false; $chkPower.IsEnabled = $false
        $chkSysMain.IsEnabled = $false; $chkSearch.IsEnabled = $false
        $chkDNS.IsEnabled = $false; $chkHPET.IsEnabled = $false; $chkTick.IsEnabled = $false
    }

    $LoginGrid.Visibility = "Collapsed"
    $MainGrid.Visibility  = "Visible"
    Add-Log "✔ Key validada! Plano: $($found.plano.ToUpper())"
})

$BtnOtimizar.Add_Click({
    $BtnOtimizar.IsEnabled = $false
    Add-Log "Iniciando otimizações..."

    if ($chkTemp.IsChecked)    { Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue; Add-Log "[OK] Temporários removidos" }
    if ($chkAnim.IsChecked)    { Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -ErrorAction SilentlyContinue; Add-Log "[OK] Animações desativadas" }
    if ($chkCPU.IsChecked)     { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -ErrorAction SilentlyContinue; Add-Log "[OK] Prioridade de CPU ajustada" }
    if ($chkPower.IsChecked)   { powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2>$null; Add-Log "[OK] Alto Desempenho ativado" }
    if ($chkSysMain.IsChecked) { Stop-Service "SysMain" -Force -ErrorAction SilentlyContinue; Set-Service "SysMain" -StartupType Disabled -ErrorAction SilentlyContinue; Add-Log "[OK] SysMain desativado" }
    if ($chkDiag.IsChecked)    { Stop-Service "DiagTrack" -Force -ErrorAction SilentlyContinue; Set-Service "DiagTrack" -StartupType Disabled -ErrorAction SilentlyContinue; Add-Log "[OK] Telemetria desativada" }
    if ($chkSearch.IsChecked)  { Stop-Service "WSearch" -Force -ErrorAction SilentlyContinue; Set-Service "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue; Add-Log "[OK] Windows Search desativado" }
    if ($chkTCP.IsChecked)     { netsh int tcp set global autotuninglevel=normal 2>$null; netsh int tcp set global chimney=enabled 2>$null; Add-Log "[OK] TCP/IP otimizado" }
    if ($chkDNS.IsChecked)     { Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | ForEach-Object { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction SilentlyContinue }; Add-Log "[OK] DNS Cloudflare ativado" }
    if ($chkHPET.IsChecked)    { bcdedit /set useplatformclock false 2>$null; Add-Log "[OK] HPET desativado" }
    if ($chkTick.IsChecked)    { bcdedit /set disabledynamictick yes 2>$null; Add-Log "[OK] Dynamic Tick desativado" }

    Add-Log "✔ Todas as otimizações aplicadas com sucesso!"
    $FooterMsg.Text = "✔ Otimizações aplicadas com sucesso!"
    $BtnOtimizar.IsEnabled = $true
})

$window.ShowDialog() | Out-Null