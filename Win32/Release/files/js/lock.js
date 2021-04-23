function lock(orientation) {
  // Go into full screen first
  if (document.documentElement.requestFullscreen) {
    document.documentElement.requestFullscreen();
  } else if (document.documentElement.mozRequestFullScreen) {
    document.documentElement.mozRequestFullScreen();
  } else if (document.documentElement.webkitRequestFullscreen) {
    document.documentElement.webkitRequestFullscreen();
  } else if (document.documentElement.msRequestFullscreen) {
    document.documentElement.msRequestFullscreen();
  }

  // Then lock orientation
  // screen.orientation.lock(orientation);
  screen.orientation.lock(orientation);

}

 // document.getElementById("button").addEventListener("click", 
 // function() {
 // document.documentElement.requestFullScreen();
 // screen.orientation.lock("portrait-primary");

 //},


