var myJsCourse = angular.module('myJsCourse', ['ngRoute']);
var address = sessionStorage.getItem('address');

myJsCourse.controller('courses', function($scope, $http){
	$scope.token = localStorage.getItem('token');
	teacher_list_path = address + 'api/subject/courses'

	var course_list = sessionStorage.getItem('course_lists');
	var subject = sessionStorage.getItem('subjects');
	var room = sessionStorage.getItem('rooms');

	if( course_list !== null ) {
		$scope.course_lists = JSON.parse(course_list);
		console.log($scope.course_lists);
	}

	if( subject !== null ) {
		$scope.subjects = JSON.parse(subject);
		console.log($scope.subjects);
	}

	if( room !== null) {
		$scope.rooms = JSON.parse(room);
		console.log($scope.rooms);
	}

	$http.get( teacher_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.courses = data.courses;
	}).error(function(data, status, headers, config) {
   		console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
    });

	$scope.getCourseList = function(data) {
		var get_course_list_path = address + "api/subject/course_lists?id=" + data

		$http.get(get_course_list_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			var newData = JSON.stringify(data.course_list)
			sessionStorage.setItem('course_lists', newData)
			window.location.href = 'CourseListDashboard.html'
		}).error(function(data, status, headers, config) {
       		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
    	});
	}

	$scope.getSubjectList = function(data) {
		sessionStorage.setItem('subject_id', data)
		window.location.href = 'SubjectList.html'
	}

	$scope.getSubject = function(data) {
		$scope.course_list_id = data
		var get_subject_path = address + "api/subject/list?id=" + data

		$http.get(get_subject_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			var newData = JSON.stringify(data.subjects)
			sessionStorage.setItem('subjects', newData)

			$scope.getRoom($scope.course_list_id)

			window.location.href = 'SubjectDashboard.html'
		}).error(function(data, status, headers, config) {
       		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
    	});

	}

	$scope.getRoom = function(data) {
		var get_room_path = address + "api/subject/rooms?id=" + data
		console.log(get_room_path)

		$http.get(get_room_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			console.log(data)
			var newData = JSON.stringify(data.rooms)
			sessionStorage.setItem('rooms', newData)
		}).error(function(data, status, headers, config) {
       		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
    	});
	}
});