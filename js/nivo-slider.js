$(window).load(function() {
 $('#slider').nivoSlider({
  effect:'sliceDown', //Specify sets like: random'sliceDownRight','sliceDownLeft','sliceUpRight','sliceUpLeft','sliceUpDown','sliceUpDownLeft','fold','fade','boxRandom','boxRain','boxRainReverse','boxRainGrow','boxRainGrowReverse'
  slices:15,
  animSpeed:500, //Slide transition speed
  pauseTime:4000,
  startSlide:0, //Set starting Slide (0 index)
  directionNav:true, //Next & Prev
  directionNavHide:false, //Only show on hover
  controlNav:true, //1,2,3...
  controlNavThumbs:false, //Use thumbnails for Control Nav
  controlNavThumbsFromRel:false, //Use image rel for thumbs
  controlNavThumbsSearch: '.jpg', //Replace this with...
  controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
  keyboardNav:false, //Use left & right arrows
  pauseOnHover:false, //Stop animation while hovering
  manualAdvance:false, //Force manual transitions
  captionOpacity:0.8, //Universal caption opacity
  beforeChange: function(){},
  afterChange: function(){},
  slideshowEnd: function(){} //Triggers after all slides have been shown
 });
});