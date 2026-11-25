@echo off
chcp 65001 >nul

REM === AJUSTE OS DOIS CAMINHOS ABAIXO PARA O SEU COMPUTADOR ===
set "OBSIDIAN=C:\Users\monte\Documents\MEDICINA-BOOK\MEDICINA"
set "QUARTZ_CONTENT=C:\Users\monte\Desktop\Programação\caderno-medicina\content"

echo 🔄 Sincronizando aulas e anexos do Obsidian para o Quartz...

REM Espelha apenas 02 - Medicina e 00 - Anexos (remove o que foi movido no Obsidian)
robocopy "%OBSIDIAN%\02 - Medicina" "%QUARTZ_CONTENT%\02 - Medicina" /MIR /NFL /NDL /NJH /NJS
robocopy "%OBSIDIAN%\00 - Anexos" "%QUARTZ_CONTENT%\00 - Anexos" /MIR /NFL /NDL /NJH /NJS

REM Copia o index.md se ele existir dentro do cofre (opcional)
if exist "%OBSIDIAN%\index.md" (
  copy /Y "%OBSIDIAN%\index.md" "%QUARTZ_CONTENT%\index.md" >nul
)

echo 🚀 Enviando atualizacoes para o GitHub...
git add .
git commit -m "Atualiza aulas do caderno"
git push

echo ✅ Tudo pronto! O site sera atualizado em ~50 segundos.
pause