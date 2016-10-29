var mySubject = angular.module('mySubject', ['ngRoute']);
var address = sessionStorage.getItem('address');


mySubject.controller('subject', function($scope, $http)  {
	$scope.token = localStorage.getItem('token');

	var subject_id = sessionStorage.getItem('subject_id');
	var get_teacher_path = address + "api/subject/teacher_courses?id=" + subject_id
	var get_subject_path = address + "api/subject/by_ids?id=" + subject_id
	$scope.subject_id = subject_id


	$http.get(get_subject_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.subject = data.subject

	}).error(function(data, status, headers, config) {
   		console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
	});


	$http.get(get_teacher_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.teachers = data.teachers

	}).error(function(data, status, headers, config) {
   		console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
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

	$scope.deleteTeacherCourse = function(data) {
		var teacher_delete_path = address + "api/subject/delete_teacher"
		var params = { subject_id: $scope.subject_id, teacher_id: data }

		$http.post(teacher_delete_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
		})
		.success(function(data, status, header, config){
			window.location.href = 'SubjectList.html'
		})
	}
});

mySubject.controller('teacher', function($scope, $http) {
	$scope.token = localStorage.getItem('token');
	teacher_list_path = address + 'api/teacher/teacher_spec'

	$http.get( teacher_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.teacher_lists = data.teacher;
	}).error(function(data, status, headers, config) {
   		console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
	}).error(function(data, status, headers, config) {
   		console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
	});

	$scope.subject_id = sessionStorage.getItem('subject_id');

	$scope.addTeacherCourse = function(data) {
		add_teacher_course_path = address + 'api/subject/add_teacher'
		var params = { subject_id: $scope.subject_id, teacher_id: data }

		$http.post(add_teacher_course_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
		})
		.success(function(data, status, header, config){
			alert('เพิ่มอาจารย์เรียบร้อย')
		}).error(function(data, status, headers, config) {
   		console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
	});
	}

});