var myJsCourse = angular.module('myJsCourse', ['ngRoute']);
var address = sessionStorage.getItem('address');

myJsCourse.controller('courses', function($scope, $http){
	$scope.token = localStorage.getItem('token');
	teacher_list_path = address + 'api/subject/courses'

	var course_list = sessionStorage.getItem('course_lists');
	var subject = sessionStorage.getItem('subjects');

	if( course_list !== null ) {
		$scope.course_lists = JSON.parse(course_list);
		console.log($scope.course_lists);
	}

	if( subject !== null ) {
		$scope.subjects = JSON.parse(subject);
		console.log($scope.subjects);
	}

	$http.get( teacher_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.courses = data.courses;
	});

	$scope.getCourseList = function(data) {
		var get_course_list_path = address + "api/subject/course_lists?id=" + data

		$http.get(get_course_list_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			var newData = JSON.stringify(data.course_list)
			sessionStorage.setItem('course_lists', newData)
			window.location.href = 'CourseListDashboard.html'
		});
	}

	$scope.getSubject = function(data) {
		var get_subject_path = address + "api/subject/list?id=" + data

		$http.get(get_subject_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			var newData = JSON.stringify(data.subjects)
			sessionStorage.setItem('subjects', newData)
			window.location.href = 'SubjectDashboard.html'
		});

	}

});