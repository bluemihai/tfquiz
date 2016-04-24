$(document).ready ->
  $("[type=radio]").change ->
    temp = this.parentNode.parentNode.parentNode.parentNode.parentNode.dataset.foo
    console.log temp, typeof temp

    selections = (item.value for item in $( "[type=radio]:checked" ))
    trues = (item for item in selections when item == 'true')
    $('#trues').html(trues.length)
    $('#selections').html(selections.length)
    console.log this