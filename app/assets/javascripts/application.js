// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {



//making menu bar highlight current page
$(function(){
  // this will get the full URL at the address bar
  var url = window.location.href;
  // passes on every "a" tag
  $(".dash-links a:link").each(function() {
    // checks if its the same on the address bar
    if(url == (this.href)) {
      //add the id #highlight to the a element that matches
      $(this).closest( 'a' ).attr("id", "highlight");
//      $(this).closest("span").addClass("highlight");
    }
  });
});




});