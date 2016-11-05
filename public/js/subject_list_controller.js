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
	console.log($scope.subject_id)

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
			alert('อาจารย์ถูกเพิ่มเรียบร้อยแล้ว')
   			console.log(data)
			if(data.error === 'token expired'){
			window.location.href = 'login.html';;
			}
		});
	}
});




mySubject.controller('room', function($scope, $http) {
	$scope.course_list_id = sessionStorage.getItem('course_list_id');
	$scope.token = localStorage.getItem('token');

	year_room_list_path = address + 'api/room/year_room_all'
	console.log($scope.course_list_id)

	$http.get( year_room_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.year_rooms = data.year_rooms;
		console.log($scope.year_rooms)

	}).error(function(data, status, headers, config) {
   		console.log(data)
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
	
	});

	$scope.selectRoom = function() {
		var e = document.getElementById("selectRoom").value;
		$scope.getRoom(e)	
		$scope.showTable = true;	
	}

	$scope.getRoom = function(data) {

		room_list_path = address + 'api/room/room_ids?id=' + data

		$http.get( room_list_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			$scope.rooms = data.rooms;
			console.log(data.rooms)

		}).error(function(data, status, headers, config) {
	   		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
		
		});
	}

	$scope.sendDataSubjectAddRoom = function(data) {
		var add_course_room_path = address + 'api/subject/add_room'
		var params = { course_list_id: $scope.course_list_id, room_id: data }

		$http.post(add_course_room_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
		})
		.success(function(data, status, header, config){
			alert('เพิ่มห้องเรียนเรียบร้อย')
		}).error(function(data, status, headers, config) {
			alert('ห้องเรียนถูกเพิ่มเรียบร้อยแล้ว')
   			console.log(data)
			if(data.error === 'token expired'){
			window.location.href = 'login.html';;
			}
		});

	}
});