$(document).ready(function() {
  $.ajax({url:'/class_names.json'})
  .done(function(response){
    console.log('Got', response)
  })
  // var $objRelSelects = $('.obj-rel');
  // console.log('$objRelSelects are ', $objRelSelect);
  // $objRelSelects.forEach(function(current, index, array){
  //   console.log(current);
  // })
});
