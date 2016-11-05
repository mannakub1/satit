var myJsCourse = angular.module('myJsCourse', ['ngRoute']);
var address = sessionStorage.getItem('address');

myJsCourse.controller('courses', function($scope, $http){
	$scope.token = localStorage.getItem('token');
	teacher_list_path = address + 'api/subject/courses'

	var course_list = sessionStorage.getItem('course_lists');
	var course_list_id = sessionStorage.getItem('course_list_id');
	var subject = sessionStorage.getItem('subjects');
	var room = sessionStorage.getItem('rooms');
	var students = sessionStorage.getItem('students');
	var student = sessionStorage.getItem('student')

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

	if( students !== null) {
		$scope.students = JSON.parse(students);
		console.log($scope.students);
	}

	if( student !== null) {
		$scope.student = JSON.parse(student);
		console.log($scope.student);
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


	$scope.selectCourse = function() {
		var e = document.getElementById("selectCourse").value;

		$scope.getCourseList(e)
		setTimeout(function() {$scope.selectCourseList()}, 500);
	}

	$scope.selectCourseList = function() {
		var e = document.getElementById("selectCourseList").value;
		$scope.getSubject(e)	
		$scope.showTable = true;	
	}


	$scope.getCourseList = function(data) {
		var get_course_list_path = address + "api/subject/course_lists?id=" + data

		$http.get(get_course_list_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			var newData = JSON.stringify(data.course_list)
			sessionStorage.setItem('course_lists', newData)
			$scope.course_lists = data.course_list
			// window.location.href = 'CourseDashboard.html'
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
		sessionStorage.setItem('course_list_id', data)
		console.log(data)
		var get_subject_path = address + "api/subject/list?id=" + data

		$http.get(get_subject_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			var newData = JSON.stringify(data.subjects)
			sessionStorage.setItem('subjects', newData)
			$scope.subjects = data.subjects

			$scope.getRoom($scope.course_list_id)

			// window.location.href = 'SubjectDashboard.html'
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

			$scope.rooms = data.rooms
		}).error(function(data, status, headers, config) {
       		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
    	});
	}

	$scope.getRoomList = function(data) {
		var get_room_path = address + "api/subject/room?id=" + data
		
		$http.get(get_room_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			console.log(data)
			var newData = JSON.stringify(data.room)
			sessionStorage.setItem('room', newData)

			$scope.room = data.room
			$scope.getStudentList(data.room.id)
			window.location.href = 'RoomList.html'
		}).error(function(data, status, headers, config) {
       		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
    	});
	}

	$scope.getStudentList = function(data) {
		var get_student_path = address + "api/subject/students?id=" + data
		
		$http.get(get_student_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			console.log(data)
			var newData = JSON.stringify(data.students)
			sessionStorage.setItem('students', newData)

			$scope.students = data.students
		}).error(function(data, status, headers, config) {
       		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
    	});
	}

	$scope.sendDataAddSubject = function() {
		var code = $scope.subject.code
		var name = $scope.subject.name
		var credit = $scope.subject.credit
		var hour_per_year = $scope.subject.hour_per_year
		var course_list_id = sessionStorage.getItem('course_list_id')
		var status = document.getElementById("status").value;

		var subject_action_add = address + "api/subject/add"
		params = { course_list_id: course_list_id, name: name, code: code, hour_per_year: hour_per_year, status: status, credit: credit}
		
		$http.post(subject_action_add, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}})
			.success(function(data, status, header, config){
				sessionStorage.setItem('subject_id', data.subject.id)

				window.location.href = 'SubjectList.html'
			})
			.error(function(data, status, headers, config) {
        		if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
		});
	}


	$scope.getStudent = function(data) {
		var newData = JSON.stringify(data)
		sessionStorage.setItem('student', newData)


		window.location.href = 'StudentList.html';
	}
});