var myApp = angular.module('myApp', ['ngRoute']);
var address = sessionStorage.getItem('address');

myApp.controller('logout', function($scope, $http){
	$scope.logout = function(){
		path = address + "api/logout";
		$http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
        })
		.success(function(data, status, headers, config) {
			window.location.href = 'login.html';	
      	})
		.error(function(data, status, headers, config) {
			console.log('test');
      	});
	}

}