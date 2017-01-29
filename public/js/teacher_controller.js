var myApp = angular.module('myApp', ['ngRoute']);
var address = sessionStorage.getItem('address');


myApp.controller('teachers', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.token = localStorage.getItem('token');
	teacher_list_path = address + 'api/teacher/present'

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
			return 'ผู้บริหาร'
		}
	}
	
	$scope.logout = function(){
		path = address + "api/logout";
		$http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			window.location.href = 'login.html';
			
      })
		.error(function(data, status, headers, config) {
      });
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

	$scope.editPasswordPage = function(data) {
		sessionStorage.setItem('teacher_id', data)
		window.location.href = 're_password_teacher.html'
	}

	$scope.sendDataEditPassword = function() {
		var newPassword = $scope.teacher.newPassword
		var rePassword = $scope.teacher.rePassword
		var teacher_id = sessionStorage.getItem('teacher_id')
		var teacher_edit_password_path = address + 'api/teacher/edit_password'

		if( newPassword === rePassword ){
			var params = { id: teacher_id, password: newPassword }

			$http.post(teacher_edit_password_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
			})
			.success(function(data, status, header, config){
				window.location.href = 'Dashboard_Teacher.html'
			})
			.error(function(data, status, headers, config) {
        		if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
		}
		
	}

});