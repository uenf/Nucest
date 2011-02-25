
function verificarDados() {
    var opcao = document.getElementsByName("instituicao[origem]");
    if (opcao[0].checked) {
        cnpj = document.getElementById("instituicao_cnpj")
        cnpj.disabled = false;
        pais = document.getElementById("instituicao_pais")
        pais.readOnly = true;
        pais.value = "Brasil";
        registro_local = document.getElementById("instituicao_registro_local")
        registro_local.disabled = true;
        registro_local.value = "";
    } else {
        registro_local = document.getElementById("instituicao_registro_local")
        registro_local.disabled = false;
        pais = document.getElementById("instituicao_pais")
        pais.readOnly = false;
        pais.value = "";
        cnpj = document.getElementById("instituicao_cnpj")
        cnpj.disabled = true;
        cnpj.value = "";
    }
}

