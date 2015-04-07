var $p;
var w;
var wid;
var part;
var p_rel; 
$(function () {

  // div surrounding progressbar itself
  $p = $($(".progress")[0]);
  wid = $p.width();
  p_rel = $p.offset(); // p's location on the page

  progressBar($p, wid, p_rel);

  //end progressBar initialization

  //jQuery - UI
  rangeSlider($(".slider"), $("#amount"));
});

//TODO: values
function rangeSlider($s, $a) {
  $s.slider({
    range: true,
    min: 0,
    max: 500,
    values: [ 75, 300 ],
    slide: function(event, ui) {
      //TODO: stuff that happens when slide
    }
  });
  $a.val("$" + $s.slider("values", 0) +
    " - $" + $s.slider("values", 1));
}

//clicking stuff for the progress bar function
//TODO: bug : if zoom in or out, the width is no longer correct
// maybe use on resize event
function progressBar($p, wid, p_rel) {
  var n = 5;
  var inc = wid / n;
  part = [];
  for (var i = 1; i < 6; i++) {
    part.push(i * inc); 
  }

  //TODO: segregate this function
  $p.on("click", function(e) {
    //math!! where cursor is in x-direction minus .progress div in x-direction
    //relative location basically
    w = (e.pageX - p_rel.left);
    for (var i = 0; i < part.length; i++) {
      if (part[i] >= w) {
        w = part[i];
        break;
      } 
    }
    w = (w / wid) * 100; //get the percentage ready
    $('.progress-bar').css("width", w + '%');
  });

}