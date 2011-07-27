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

