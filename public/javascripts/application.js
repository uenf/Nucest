function initOnLoad() {
    $('#notices').hide();
    $('#notices').slideDown('slow');
}

$(function () {
//   Sorting and pagination links.
  $('#instituicoes th a, .pagination a').live('click', function () {
    $.getScript(this.href);
    return false;
  });

//   Search form.
  $("#instituicao_search input").keyup(function() {
    $.get($("#instituicao_search").attr("action"), $("#instituicao_search").serialize(), null, "script");
    return false;
  });
});

$(function () {
//   Sorting and pagination links.
  $('#estagiarios th a, .pagination a').live('click', function () {
    $.getScript(this.href);
    return false;
  });

//   Search form.
  $("#estagiario_search input").keyup(function() {
    $.get($("#estagiario_search").attr("action"), $("#estagiario_search").serialize(), null, "script");
    return false;
  });
});

$(function () {
    setTimeout(function () {
        $('#flash_messages li').fadeOut(1000);
    }, 5000);
});

$(function() {
  var theTable = $('table.filterable');
  $("#filter").keyup(function() {
    $.uiTableFilter( theTable, this.value );
  });
});

/*
** Tree
*/

$(function () {
    $('.tree input[type="checkbox"]').click(function () {
        checkbox = $(this);

        if (checkbox.is(':checked')) {
            $.each(checkbox.parents('li'), function (index, element) {
                $(element).children('input[type="checkbox"]').
                        attr('checked', 'checked');
            });

            $.each(checkbox.parent().find('li input[type="checkbox"]'),
                function (index, element) {
                $(element).attr('checked', 'checked');
            });
        } else {
            $.each(checkbox.parent().find('li input[type="checkbox"]'),
                function (index, element) {
                $(element).removeAttr('checked');
            });

//            $.each(checkbox.parents('li'), function (index, element) {
//                if ($(element).find('input[type="checkbox"]:checked').empty())
//                    $(element).children('input[type="checkbox"]').
//                        removeAttr('checked');
//            });
        }
    });
});


/*
** Máscaras
*/

$(function () {
   $(".mask-data").mask("99/99/9999");
   $(".mask-telefone").mask("(99) 9999-9999");
   $(".mask-cep").mask("99.999-999");
   $(".mask-cnpj").mask("99.999.999/9999-99");
   $(".mask-cpf").mask("999.999.999-99");
});


/*
** Chosen para instituição no cadastro de estagiario
*/

//$(".chzn-select").chosen();


/*
** Esconder campo matrícula do estagiário se instituição selecionada for diferente de UENF
*/

$(function () {
    var instituicao = $('#estagiario_instituicao_id');
    var uenf_id = instituicao.attr('uenf-id');
    var uenf_option = $('#estagiario_instituicao_id option[value=' + uenf_id + ']')

    instituicao.trigger("liszt:updated");

    if ($('#new_estagiario #estagiario_instituicao_id option:selected').val() == '')
        uenf_option.attr('selected', 'selected');

    instituicao.change(function (id) {
        mostrarEsconderMatricula(uenf_id);
    });
});

function mostrarEsconderMatricula(uenf_id) {
    var selecionado = $('#estagiario_instituicao_id option:selected').attr('value');
    if (selecionado != uenf_id) {
        $('#estagiario_matricula').parent().slideUp();
    } else {
        $('#estagiario_matricula').parent().slideDown();
    }
}

