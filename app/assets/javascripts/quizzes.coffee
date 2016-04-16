$(document).ready ->
  $("[type=radio]").change ->
    selections = (item.value for item in $( "[type=radio]:checked" ))
    trues = (item for item in selections when item == 'true')
    console.log(selections.length, trues.length)
    $('#trues').html(trues.length)
    $('#selections').html(selections.length)
