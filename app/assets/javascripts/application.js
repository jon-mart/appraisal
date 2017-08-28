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
//= require turbolinks
//= require_tree .

//= require bootstrap-sprockets

var app = angular.module('app', []);

var ajax_on = app.factory('ajaxFactroy', function($http){
	return {
		get: function(url){
			return $http.get(url).then(function(res){
				return res.data
			});
		}
	}
});

var an_app_controller = app.controller('anAppController', ['$scope', 'ajaxFactroy',function($scope, ajaxFactroy){
   ajaxFactroy.get('/managers').then(function(data){
   	$scope.managers = data;
   });
   ajaxFactroy.get('/user_goals_index').then(function(data){
   	$scope.user_goals = data;
   });

}]);

