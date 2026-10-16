@echo off
chcp 65001 > nul
echo ========================================================
echo   Atualizando Radar de Vagas - Campina Grande (Full Run)
echo ========================================================
cd /d "%~dp0"

python -m vagas_monitor run --force
if %errorlevel% neq 0 (
    echo [ERRO] A execucao falhou.
    pause
    exit /b %errorlevel%
)

git add docs reports state
git commit -m "update: rodada manual"
git push origin main
if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo [SUCESSO] Vagas atualizadas e publicadas no GitHub Pages!
    echo Link: https://felipecjbob.github.io/radar-de-vagas-campina-grande/
    echo ========================================================
) else (
    echo [AVISO] Nao foi possivel enviar para o GitHub.
)

echo.
pause
