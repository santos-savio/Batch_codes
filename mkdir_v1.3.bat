@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem Solicitar ao usuário a extensão do arquivo
set /p ext="Digite a extensão do arquivo (sem o ponto): "

rem Verificar se a extensão não está vazia
if "%ext%"=="" (
    echo Extensão não pode estar vazia.
    goto end
)

rem Iterar sobre todos os arquivos com a extensão fornecida no diretório atual
for %%f in (*.%ext%) do (
    rem Verificar se há arquivos com a extensão fornecida
    if not exist "%%f" (
        echo Nenhum arquivo com a extensão .%ext% encontrado.
        goto end
    )
    
    rem Remover a extensão para obter o nome da pasta
    set "dirname=%%~nf"
    
    rem Criar o diretório com o nome obtido
    mkdir "!dirname!"
    
    rem Mover o arquivo para o diretório criado
    move "%%f" "!dirname!\"
    
    echo Arquivo %%f movido para a pasta: !dirname!
)

:end
endlocal
pause
