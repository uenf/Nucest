function formatarMascara(src, mascara, tecla) {
	var campo = src.value.length;
	var saida = mascara.substring(0,1);
	var texto = mascara.substring(campo);

	if (tecla.keyCode != 8) {
        if (src.name == "instituicao[telefone]") {
            if (campo >= 1) {
                if (src.value.indexOf("(") == -1 && campo == 1)
                    src.value = "(" + src.value
                if (src.value.indexOf(")") == -1 && src.value.length == 3)
                    src.value = src.value.substring(0,3) + ") ";
                if (src.value.indexOf(" ") == -1 && src.value.length >= 4) {
                    indice_do_parenteses = src.value.indexOf(")");
                    src.value = src.value.substring(0, indice_do_parenteses + 1) + " " + src.value.substring(indice_do_parenteses + 2)
                }
           }
	    }

	    if(texto.substring(0,1) != saida) {
		    src.value += texto.substring(0,1);

	    }
	}
}

