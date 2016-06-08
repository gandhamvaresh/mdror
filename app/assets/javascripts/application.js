// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .

$(document).ready(function(){
	
	console.log('Seomthign');
  $(".slider-100").slider({
    range: "max",
    min: 0,
	step: 1,
    max: 140,
	slide: function( event, ui ) {
	  var sliderval = 0
	  if(ui.value != 0){
		  sliderval = (ui.value || 0) + '+';
	  }
	  $( $(this).parent().find(".sliderValue") ).val( sliderval );
	  $( $(this).parent().find(".slider-value") ).html( sliderval );
	}
  });
  
  $.each($(".sliderValue"), function(idx, val){
  	$(val).parent().find(".slider-value").html( val.value );
	$(val).parent().find(".slider-100").slider("value", parseInt(val.value) || 0);
	$(val).parent().find(".slider-100").slider( "option", "disabled",  $(val).attr('disabled') == 'disabled' ? true : false);
  });
  
  $('#ssn').keyup(function() {
    var val = this.value.replace(/\D/g, '');
    var newVal = '';
	if(val.length > 4) {
	  this.value = val;
	}
	if((val.length > 3) && (val.length < 6)) {
	  newVal += val.substr(0, 3) + '-';
	  val = val.substr(3);
	}
	if (val.length > 5) {
	  newVal += val.substr(0, 3) + '-';
	  newVal += val.substr(3, 2) + '-';
	  val = val.substr(5);
	}
	newVal += val;
    this.value = newVal;
  });
  
})

