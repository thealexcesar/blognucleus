require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require ../../../vendor/assets/javascript/jquery
//= require jquery_rails
//= require ckeditor/init

// =====================================================================================================================
function loading_alerts_top(class_) {
    var html = "<li class='centered alert_top_loading' style='padding:30px 0;'>";
    html += "<i class=\"fa-2x fa fa-spinner fa-spin\"></i>";
    html += "</li>";
    $(class_).html(html);
}
function end_load_alerts_top() {
    $(".alert_top_loading").remove();
}

