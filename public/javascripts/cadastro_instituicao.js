
function verificarDados() {
    var opcao = document.getElementsByName("instituicao[pais]");
    if (opcao[0].checked) {
        document.getElementById("dados_instituicao_estrangeira").style.display = "none";
        document.getElementById("dados_instituicao_nacional").style.display = "block";
    } else {
        document.getElementById("dados_instituicao_estrangeira").style.display = "block";
        document.getElementById("dados_instituicao_nacional").style.display = "none";
    }
}

