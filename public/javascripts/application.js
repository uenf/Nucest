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
    $('.tree .show_sub').click(function () {
        $(this).parent().parent().parent('ul > ul').slideToggle('fast');
    });
});

