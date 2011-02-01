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

