function buscarCep(value, model){
  $("#label_cep").html("Pesquisando...");
  $.getJSON("/buscar_cep", { cep: value }, function(json) {
    if (json.erro == false) {
      $("#" + model + "_cidade").val(json.cidade);
      $("#" + model + "_estado").val(json.estado);
      $("#" + model + "_bairro").val(json.bairro);
      $("#" + model + "_rua").val(json.rua);
      $("#" + model + "_cep").val(json.cep);
      $("#" + model + "_numero").focus();
    }
    else {
      alert("Cep não encontrado.");
    }
  $("#label_cep").html("CEP")});
}

