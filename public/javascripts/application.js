// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function initOnLoad()
{
    $('#notices').hide();
    $('#notices').slideDown('slow');
}

function confirmarDelEvento(event)
{
    if (confirm("Tem certeza que deseja apagar este evento e todas as suas informações?")) {
        if (!confirm("Esta ação é irreversível. Deseja realmente continuar?"))
            event.stop();
    }
    else
    {
        event.stop();
    }
}

$(function () {
  // Sorting and pagination links.
  $('#instituicoes th a, .pagination a').live('click', function () {
    $.getScript(this.href);
    return false;
  });

  // Search form.
  $("#instituicao_search input").keyup(function() {
    $.get($("#instituicao_search").attr("action"), $("#instituicao_search").serialize(), null, "script");
    return false;
  });
});

$(function () {
  // Sorting and pagination links.
  $('#estagiarios th a, .pagination a').live('click', function () {
    $.getScript(this.href);
    return false;
  });

  // Search form.
  $("#estagiario_search input").keyup(function() {
    $.get($("#estagiario_search").attr("action"), $("#estagiario_search").serialize(), null, "script");
    return false;
  });
});

