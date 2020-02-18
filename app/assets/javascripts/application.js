// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require jquery.turbolinks
//= require turbolinks
//= require popper
//= require cocoon
//= require bootstrap
//= require_tree .

// $(function(){

// //URLファイル名取得
// var path = location.href;
// var url = path.split('/')[5];
// //ブラウザバック対象ページ
// var pathTarget = "complete";
// //var check =  pathTarget.indexOf(url);
// console.log(url)
// console.log(pathTarget)
// //console.log(check)
// if(pathTarget == url){
//     //pathTargetに入っているページだけ実行される
//     $(function(){
// 	 history.pushState(null, null, null); //ブラウザバック無効化
// 	 //ブラウザバックボタン押下時
// 	 $(window).on("popstate", function (event) {
// 	   history.pushState(null, null, null);
// 	   window.alert('前のページに戻る場合、前に戻るボタンから戻ってください。');
// 	 });
// 	});
// }
// });