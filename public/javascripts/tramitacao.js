$(function () {
    $('#form_item_tramitacao .actions input').click(function () {
        data_br = $('#item_tramitacao_data_br').attr('value');
        origem_do_contato = $('#item_tramitacao_origem_do_contato').attr('value');
        forma_de_contato = $('#item_tramitacao_forma_de_contato').attr('value');
        descricao = $('#item_tramitacao_descricao').attr('value');
        convenio_id = $('#item_tramitacao_convenio_id').attr('value');

        $.ajax({
            type: 'POST',
            url: '/itens_tramitacao',
            data: ({
                item_tramitacao: {
                    data_br: data_br,
                    origem_do_contato: origem_do_contato,
                    forma_de_contato: forma_de_contato,
                    descricao: descricao,
                    convenio_id: convenio_id
                },
                success: function () {}
            })
        });
    });
});

$(function () {
    $('#window_tramitacao .slide_toggle').click(function () {
        $('#window_tramitacao #form_item_tramitacao').slideToggle('fast');
        if ($('#window_tramitacao .slide_toggle').hasClass('down')) {
            $('#window_tramitacao .slide_toggle').removeClass('down');
            $('#window_tramitacao .slide_toggle').addClass('up');
        } else {
            $('#window_tramitacao .slide_toggle').removeClass('up');
            $('#window_tramitacao .slide_toggle').addClass('down');
        }
    });

//    $('#window_tramitacao input.save').click(function () {
//        $('#window_tramitacao #form_item_tramitacao').slideToggle('fast');
//        $('#window_tramitacao .slide_toggle').removeClass('up');
//        $('#window_tramitacao .slide_toggle').addClass('down');
//    });
});

function visualizarTramitacao(convenio_id) {
    $('#window_tramitacao .window_header h3').text('Tramitação do convênio #' + convenio_id);
    $.get('/itens_tramitacao', { convenio_id: convenio_id }, null, 'script');

    return false;
}

$(function () {
    $('#window_tramitacao .jqmClose').click(function () {
        var display = $('#window_tramitacao #form_item_tramitacao').css('display');

//        if (display != 'none') {
//            $('#window_tramitacao #form_item_tramitacao').slideToggle('fast');
//            $('#window_tramitacao .slide_toggle').removeClass('up');
//            $('#window_tramitacao .slide_toggle').addClass('down');
//            $('.inline_form .input input, .inline_form .input textarea')
//            .attr('value', '');
//        }
    });
});


//$(function () {
//    $('.inline_form .actions input.save').click(function () {
//        $('.inline_form .input input, .inline_form .input textarea')
//        .attr('value', '');
//    });
//});

