var box;
var slide;
var $p;
var $d;
var w;
var wid;
$(function() {
  // function mySlide(){
  //   box = $(".output");
  //   slide = $(".slider");

  //   box.text('250');
  //   $( ".slider" ).slider({
  //   range: "min",
  //   value: 250,
  //   min: 100,
  //   max: 500,
  //   step : 50,
  //   slide: function( event, ui ) {
  //     box.text(ui.value );
  //   }
  //   });


  //   function fillBox() {
  //     console.log("called");
  //     box.text(slide.slider("value"));
  //   }

  // }
  // selector on the progress bar
  $d = $("#btn_enabled");
  $p = $($(".progress")[0]);
  wid = $p.width();
  p_rel = $p.offset(); // p's location on the page
  $p.on("click", function(e) {
    w = ((e.pageX - p_rel.left) / wid) * 100;
    $('.progress-bar').css("width", w + '%');
    console.log(w);
  });

});