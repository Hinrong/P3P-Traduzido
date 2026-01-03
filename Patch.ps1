# --- Configuração de Cores e Estética ---
$Host.UI.RawUI.WindowTitle = "P3P Patching Tool ~ Meow! ^-^"
Clear-Host

$cat = @"
      |\      _,,,---,,_
ZZZzz /,`.-'`'    -.  ;-;;,_
     |,4-  ) )-,_. ,\ (  `'-'
    '---''(_/--'  `-'\_)
"@

Write-Host $cat -ForegroundColor Magenta
Write-Host "`n ✨ Bem-vindo ao instalador mais fofinho do mundo! UwU ✨ `n" -ForegroundColor Cyan

# --- Início do Script ---

$PEditor = ".\PersonaEditor\PersonaEditorCMD.exe"

if (Test-Path -Path ".\CPK_Patched\CPK"){
    Write-Host " [🧹] Limpando a bagunça antiga... Puff!" -ForegroundColor Gray
	Remove-Item -Path ".\CPK_Patched\CPK" -Recurse
}

Write-Host " [🐍] Rodando o script Python... Sparkle sparkle! ✨" -ForegroundColor Yellow
& python P3P-PC.py

Write-Host " [📂] Copiando arquivos com todo amor... 💖" -ForegroundColor Magenta
Copy-Item -Path .\CPK\ -Destination .\CPK_Patched\ -Recurse

Write-Host " [📝] Começando a patchear os textos... Meow! 🐾" -ForegroundColor Cyan

# --- Comandos do Persona Editor ---
Write-Host "  > Processando battle... ⚔️" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\battle -impalltexts .\Texts\battle.txt -save /ovrw

Write-Host "  > Processando camp... 🏕️" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\camp -impalltexts .\Texts\camp.txt -save /ovrw

Write-Host "  > Processando commu... 🤝" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\commu -impalltexts .\Texts\commu.txt -save /ovrw

Write-Host "  > Processando event... 🎭" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\event -impalltexts .\Texts\event.txt -save /ovrw

Write-Host "  > Processando facility... 🏥" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\facility -impalltexts .\Texts\facility.txt -save /ovrw

Write-Host "  > Processando field... 🌿" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\field -impalltexts .\Texts\field.txt -save /ovrw

Write-Host "  > Processando field2d... 🗺️" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\field2d -impalltexts .\Texts\field2d.txt -save /ovrw

Write-Host "  > Processando help... ❓" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\help -impalltexts .\Texts\help.txt -save /ovrw

Write-Host "  > Processando lmap... 📍" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\lmap -impalltexts .\Texts\lmap.txt -save /ovrw

Write-Host "  > Processando title... 👑" -ForegroundColor White
& $PEditor .\CPK_Patched\CPK\title -impalltexts .\Texts\title.txt -save /ovrw

Write-Host " [💎] Aplicando bins especiais... Quase lá! " -ForegroundColor Yellow
& $PEditor .\CPK_Patched\CPK\init.bin -impalltexts .\Texts\init.txt -save /ovrw
& $PEditor .\CPK_Patched\CPK\init_2.bin -impalltexts .\Texts\init_2.txt -save /ovrw
& $PEditor .\CPK_Patched\CPK\init_2F.bin -impalltexts .\Texts\init_2F.txt -save /ovrw
& $PEditor .\CPK_Patched\CPK\init_free.bin -impalltexts .\Texts\init_free.txt -save /ovrw

Write-Host " [🏷️] Renomeando coisinhas... Nya!" -ForegroundColor Cyan
& $PEditor .\CPK_Patched\CPK\ -imptext .\Texts\Names.txt /sub /map "%OLDNM %NEWNM" -save /ovrw

Write-Host "`n ⭐ TUDO PRONTO! O patch foi aplicado com sucesso! UwU ⭐ " -ForegroundColor Green
Write-Host "      (づ｡◕‿‿◕｡)づ  Aproveite o jogo! `n" -ForegroundColor Red

pause