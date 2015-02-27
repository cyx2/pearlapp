// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require twitter/typeahead.min
//= require jquery.turbolinks
//= require turbolinks
//= require masonry/jquery.masonry
//= require_tree .

$(document).ready(function(){
    $("#show-search-toggle").click(function(){
    	$("#show-search-toggle").hide();
        $("#nav-search-form").show();
        $("#nav-search-text").show().animate({width: "200px"}, 500);
        $("#nav-search-text").focus();
    });
    $("#nav-search-text").blur(function(){
		$("#nav-search-text").hide().animate({width: "0px"}, 500);
		$("#nav-search-form").hide();
      	$("#show-search-toggle").show();
    });

    $("#homelogin-grid").fadeTo('slow', 1)
    $("#homelogin-graphic-1").animate({width: "40%"}, 'slow')
    $("#homelogin-graphic-2").animate({width: "20%"}, 'slow')
    $("#homelogin-graphic-3").animate({width: "60%"}, 'slow')
    $("#homelogin-graphic-4").animate({width: "80%"}, 'slow')

    $('.dropdown-toggle').click(function() {
      $('.dropdown-menu').slideToggle('fast')
        $(document).click(function(){
          $('.dropdown-menu').slideUp('fast')
      });
    });

    // $("#search_text").focusout(function(){
    // if ($("#search_text").val()=="") {
    //     $("#error").addClass("has-error");
    // }
    // });
    // $("#search_text").focusin(function(){
    //     $("#error").removeClass("has-error");
    // });

    var cornellclasses = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      limit: 10,
      prefetch: {
        // url points to a json file that contains an array of country names, see
        // https://github.com/twitter/typeahead.js/blob/gh-pages/data/countries.json
        url: 'coursesjson.json', // ********* TODO: relative path?? ********* 
        // the json file contains an array of strings, but the Bloodhound
        // suggestion engine expects JavaScript objects so this converts all of
        // those strings
        filter: function(cornellclasses) {
            return $.map(cornellclasses, function(cornellclass) { return { name: cornellclass }; });
        }
      }
    });

    // initialize the bloodhound suggestion engine
    cornellclasses.initialize();

    // instantiate the typeahead UI
    $('#prefetch-mainsearch .typeahead-mainsearch').typeahead(null, {
      name: 'cornellclasses',
      displayKey: 'name',
      source: cornellclasses.ttAdapter()
    });

});

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function () {
  $('[data-toggle="popover"]').popover()
})
