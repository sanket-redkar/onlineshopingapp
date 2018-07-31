// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .


function fetchShopingCard(id){
  if (id != undefined){
    $.ajax({ url: ('/shoping_cards/' + id + '.js') });
  }
}

function showAlerts( type, html, container){
  var $container = _.isEmpty(container) ? $("#content-container") : $(container);
  if ($container.find('ul.alerts-list').length == 0){
    $container.prepend('<ul class="alerts-list"></ul>')
  }

  var struture = '<li class="full-wt-alert alert bounceInDown animated  alert-' + type +' fade in alert-dismissable show">\
    <button type="button" class="close alerts-close" data-dismiss="alert" aria-label="Close">\
      <span aria-hidden="true">×</span>\
    </button>\
  </li>';
  var $container = !_.isEmpty(container) ? $(container) : $("#content-container");
  $container.find('ul.alerts-list').append(struture);
  var $alert = $container.find('.alert:last');
  $alert.append(html);
  //function use to remove animated list
  function remove_alert() {
    $alert.remove();
  }
  //function to animate list
  function hide_alert() {
    $alert.addClass('fadeOutRight');
    //setting delay to remove displayed error
    setTimeout(remove_alert, 400);
  }
  //setting delay to animate displayed error
  setTimeout(hide_alert, 8000);
}