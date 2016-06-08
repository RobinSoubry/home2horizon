$(document).ready(function() {
  setTab();
});

function setTab(){
  var url = window.location.href
  var lastSegment = "/" + url.split('/').pop();
  $(".navbar-nav li a").each(function() {
    if ($(this).attr('href') == lastSegment) {
      $(this).parent().addClass("active");
    }
  });
}
