var myApp = angular.module('myApp', ['ngRoute']);
var address = "http://localhost:3000/";


myApp.controller('teachers', function($scope, $http)  {
	$scope.token = localStorage.getItem('token');
	teacher_list_path = address + 'api/teacher/all'

	$http.get( teacher_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		console.log(data)
		$scope.teacher_lists = data.teacher;
	});


	$scope.changeStatus = function(data) {
		if ( data === 'super user'){
			return 'แอดมินระบบ'
		}else if( data === 'teacher') {
			return 'ครู'
		}else if( data === 'ceo') {
			return 'ผู้บิรหาร'
		}
	}

	$scope.deleteTeacher = function(data) {
		var teacher_action_delete_path = address + 'api/teacher/delete'
		var params = {id: data}
		console.log(params)
		$http.post(teacher_action_delete_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
		})
		.success(function(data, status, header, config){
			window.location.href = 'Dashboard_Teacher.html'
		})
	}

});