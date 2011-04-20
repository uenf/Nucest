function buscarCep(value, model){
  $("#label_cep").html("Pesquisando...");
  $.getJSON("/instituicoes/buscar_cep", { cep: value }, function(json) {
    if (json.erro == false) {
      $("#instituicao_cidade").val(json.cidade);
      $("#instituicao_estado").val(json.estado);
      $("#instituicao_bairro").val(json.bairro);
      $("#instituicao_rua").val(json.rua);
      $("#instituicao_cep").val(json.cep);
      $("#instituicao_numero").focus();
    }
    else {
      alert("Cep não encontrado.");
    }
  $("#label_cep").html("CEP")});
}

