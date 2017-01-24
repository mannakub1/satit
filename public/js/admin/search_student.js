var myApp = angular.module('search', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('student', function($scope, $http)  {

	$scope.selectType = function() {
		var type = document.getElementById("selectType").value
		
		if (type == 'code_number') {
			$scope.serachByCodeNumber($scope.data)
		} else if (type == 'first_name') {
			$scope.serachByFirstName($scope.data)
		} else if (type == 'last_name') {
			$scope.serachByLastName($scope.data)
		}
	}

	$scope.serachByCodeNumber = function(input) {
		get_student = address + 'api/student/code_number?code_number=' + input
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
        	console.log(data)
        }).error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
	            window.location.href = 'login.html';;
	        }
    	});
	}

	$scope.serachByFirstName = function(input) {
		get_student = address + 'api/student/first_name?first_name=' + input
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
        	console.log(data)
        }).error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
	            window.location.href = 'login.html';;
	        }
    	});
	}

	$scope.serachByLastName = function(input) {
		get_student = address + 'api/student/last_name?last_name=' + input
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
        	console.log(data)
        }).error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
	            window.location.href = 'login.html';;
	        }
    	});
	}
});