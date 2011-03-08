
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

function marcarInputsNaTag(id, areaAtual) {
    if (areaAtual.checked == true) {
      inputAtual = areaAtual;
      while (inputAtual.className != "super_area") {
          pai = "area_" + inputAtual.className.split('_')[3];
          inputAtual = document.getElementById(pai);
          inputAtual.checked = true;
          inputAtual = document.getElementById(pai);
      }
      var inputs = document.getElementById(id).getElementsByTagName("input");
        for (var i = 0, len = inputs.length; i < len; i++) {
          inputs[i].checked = true;
        }
    }
    if (areaAtual.checked == false) {
      var inputs = document.getElementById(id).getElementsByTagName("input");
        for (var i = 0, len = inputs.length; i < len; i++) {
          inputs[i].checked = false;
        }
    }
}

function esconderSubAreas(ul, img) {
    var ul = document.getElementById(ul);
    if (ul.style.display == "none"){
        ul.style.display="block";
        img.src = ("/images/back-end/arrow_down.png");
    }
    else{
        ul.style.display="none";
        img.src = ("/images/back-end/arrow_right.png");
    }

}
