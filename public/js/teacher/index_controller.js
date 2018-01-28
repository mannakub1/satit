var myApp = angular.module('teacher', ['ngRoute']);
var address = sessionStorage.getItem('address');


myApp.controller('teacher_controller', function($scope, $http)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
});

myApp.controller('student_list', function($scope, $http)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
	$scope.token = localStorage.getItem('token');
	var teacher_id = sessionStorage.getItem('teacher_id')
	get_room = address + 'api/teacher/rooms?teacher_id=' + teacher_id


	$http.get(get_room , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.room_list = data.room;

	}).error(function(data, status, headers, config) {
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
	});

	$scope.getStudentList = function(room_id) {
		sessionStorage.setItem('room_id', room_id);
		window.location.href = '../teacher/student/index.html'
	}
	
});

myApp.controller('course', function($scope, $http)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
	$scope.token = localStorage.getItem('token');
	var teacher_id = sessionStorage.getItem('teacher_id')
	
	get_subject = address + 'api/teacher/subjects?teacher_id=' + teacher_id

	$http.get(get_subject , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		console.log(data.subjects)
		$scope.subjects = data.subjects;

	}).error(function(data, status, headers, config) {
		if(data.error === 'token expired'){
			window.location.href = 'login.html';
		}
	});

	$scope.getRoom = function(subject_index){
		sessionStorage.setItem('subject_index', subject_index)
		sessionStorage.setItem('subject', JSON.stringify($scope.subjects));
		window.location.href = '../teacher/course/index.html'
	}
});

myApp.controller('changPassword', function($scope, $http)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
	$scope.token = localStorage.getItem('token');

	$scope.sendDataEditPassword = function() {
		var newPassword = $scope.teacher.newPassword
		var rePassword = $scope.teacher.rePassword
		var teacher_edit_password_path = address + 'api/teacher/edit_password'
		var teacher_id = sessionStorage.getItem('teacher_id')
		if( newPassword === rePassword ){
			var params = { id: teacher_id, password: newPassword }

			$http.post(teacher_edit_password_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
			})
			.success(function(data, status, header, config){
				window.location.href = '../teacher/change_password.html'

			})
			.error(function(data, status, headers, config) {
        		if(data.error === 'token expired'){
					window.location.href = '../login.html';;
				}

			});
		}
		
	}
});