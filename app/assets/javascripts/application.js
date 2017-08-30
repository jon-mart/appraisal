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
//= require rails-ujs
//= require_tree .

//= require bootstrap-sprockets

var app = angular.module('app', []);

var ajax_on = app.factory('ajaxFactroy', function($http){
	return {
		get: function(url, params){
		    if (typeof(a)==='undefined') params = {}
			return $http.get(url, params).then(function(res){
				return res.data
			});
		}
	}
});

var an_app_controller = app.controller('anAppController', ['$scope', 'ajaxFactroy',function($scope, ajaxFactroy){
   get_bulk_values = function(){
   	 console.log($(this).value()); 
   	 
   	}
   ajaxFactroy.get('/managers').then(function(data){
   	$scope.managers = data;
   });

}]);




function bulk_user_action(){
	$('#check_bulk_user').change(function(){
		if ($(this).is(':checked')){
			$('.bulk_user_ids').prop("checked", true);
		}
		else{
			$('.bulk_user_ids').prop("checked", false);
		}
	});
}