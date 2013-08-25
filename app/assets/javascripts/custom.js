$(document).ready(function() {
  $('.dropdown-toggle').dropdown();
});

$(function(){
    $.ajaxSetup({
        beforeSend: function( xhr ) {
            var token = $('meta[name="csrf-token"]').attr('content');
            if (token) xhr.setRequestHeader('X-CSRF-Token', token);
        }
    });
});