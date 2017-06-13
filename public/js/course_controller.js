var myJsCourse = angular.module('myJsCourse', ['ngRoute']);
var address = sessionStorage.getItem('address');

myJsCourse.controller('courses', function($scope, $http){
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.token = localStorage.getItem('token');
	$scope.showButtonManageCourse = true;
	teacher_list_path = address + 'api/subject/courses'



	$scope.index_current_course = sessionStorage.getItem('index_current_course');
	$scope.index_current_course_list = sessionStorage.getItem('index_current_course_list');
	$scope.show_course = $scope.index_current_course;

	$http.get( teacher_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		console.log("get data " + data.courses);
		$scope.courses = data.courses;
			
		// console.log(data.courses);
		// console.log('test index_current_course = ' + $scope.index_current_course);
		// console.log('test courses = ' + $scope.courses);

		console.log('test index_current_course_list = ' + $scope.index_current_course_list);
		console.log('test courses_list  = ' + $scope.courses[$scope.index_current_course].course_lists[$scope.index_current_course_list].id);

		if ($scope.show_course == null) {

			$scope.show_course = "---Please select---"
			$scope.show_course_list = "";

		}else {

			$scope.course_lists = $scope.courses[$scope.index_current_course].course_lists;
			$scope.course_list_id = $scope.courses[$scope.index_current_course].course_lists[$scope.index_current_course_list].id;
			
			$scope.show_course = "หลักสูตรปีการศึกษา"+$scope.courses[$scope.index_current_course].year;
			$scope.show_course_list = $scope.courses[$scope.index_current_course].course_lists[$scope.index_current_course_list].room_level;
			// console.log("progress on if else");
			$scope.selectComplete();	
		}
	}).error(function(data, status, headers, config) {
   		console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
    });




	
	// var course_list = sessionStorage.getItem('course_lists');
	// var course_list_id = sessionStorage.getItem('course_list_id');
	// var subject = sessionStorage.getItem('subjects');
	// var room = sessionStorage.getItem('rooms');
	// if( course_list !== null ) {
	// 	$scope.course_lists = JSON.parse(course_list);
	// 	console.log($scope.course_lists);
	// }


	// if( subject !== null ) {
	// 	$scope.subjects = JSON.parse(subject);
	// 	console.log($scope.subjects);
	// }

	// if( room !== null) { 
	// 	$scope.rooms = JSON.parse(room);
	// 	console.log($scope.rooms);
	// }


	

	$scope.AddTextInput = function() {
		$scope.showButtonManageCourse = false;
		$scope.showInputTextAddCourse = true;
	}
	$scope.selectCourse = function() {
		$scope.course_lists = $scope.courses[document.getElementById("selectCourse").value].course_lists
		var e = document.getElementById("selectCourse").value;
		$scope.showButtonManageCourse = false;
		$scope.showInputTextAddCourse = false;
		
		$scope.current_course = $scope.courses[e].year;
		console.log('test data e = ' + e);
		sessionStorage.setItem('index_current_course', e);
		$scope.index_current_course = e;
		$scope.selectCourseList();
		// $scope.getCourseList(e)
		// setTimeout(function() {$scope.selectCourseList()}, 500);
	}

	$scope.deleteSubject = function(data) {
		subject_id = data
		course_list_id = $scope.course_list_id

		subject_delete_action = address + "api/subject/delete"
		params = { course_list_id: course_list_id, subject_id: subject_id }

		$http.post(subject_delete_action, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
		})
		.success(function(data, status, header, config){
			window.location.href = 'CourseDashboard.html'
		})
		.error(function(data, status, headers, config) {
    		if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
		});
	}

	$scope.deleteRoom = function(data) {
		room_id = data
		course_list_id = $scope.course_list_id

		room_delete_action = address + "api/subject/delete_room"
		params = { course_list_id: course_list_id, room_id: room_id }

		$http.post(room_delete_action, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}})
			.success(function(data, status, header, config){
				window.location.href = 'CourseDashboard.html'
			})
			.error(function(data, status, headers, config) {
        		if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
		});
	}

	$scope.sendDataAddCourse = function() {
		var year = $scope.course.year

		var course_action_add = address + "api/subject/add_course"
		params = { year: year }
		
		$http.post(course_action_add, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}})
			.success(function(data, status, header, config){
				window.location.href = 'CourseDashboard.html'
			})
			.error(function(data, status, headers, config) {
        		if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
		});
	}

	$scope.selectCourseList = function() {
		var e = document.getElementById("selectCourseList").value;
		$scope.show_course_list = $scope.courses[$scope.index_current_course].course_lists[e].room_level;
		$scope.index_current_course_list = e
		$scope.course_list_id = $scope.courses[$scope.index_current_course].course_lists[e].id
		sessionStorage.setItem('index_current_course_list', e);

		// console.log("progress on selectCourseList");

		$scope.selectComplete();
	}

	$scope.selectComplete = function() {
		$scope.getSubject($scope.course_list_id )
		$scope.getRoom($scope.course_list_id )	
		$scope.showButtonManageCourse = false;
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
		var get_subject_path = address + "api/subject/list?id=" + data

		$http.get(get_subject_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			var newData = JSON.stringify(data.subjects)
			sessionStorage.setItem('subjects', newData)
			$scope.subjects = data.subjects

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

		$http.get(get_room_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
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

	$scope.getRoomList = function(room_id) {
		// var get_room_path = address + "api/subject/room?id=" + room_id
		
		// $http.get(get_room_path , {headers: {'token': $scope.token}})
		// .success(function(data, status, header, config) {
		// 	var newData = JSON.stringify(data.room)
		// 	sessionStorage.setItem('room', newData)
		// 	console.log(data.room)
		// 	$scope.room = data.room
			
			sessionStorage.setItem('room_id', room_id)
		// 	// $scope.getStudentList(data.room.id)

			window.location.href = 'RoomList.html'
		// }).error(function(data, status, headers, config) {
  //      		console.log("error")
		// 	if(data.error === 'token expired'){
		// 		window.location.href = 'login.html';;
		// 	}
  //   	});
	}

	$scope.getStudentList = function(data) {
		var get_student_path = address + "api/subject/students?id=" + data
		
		$http.get(get_student_path , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
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
		console.log('test functuin')
		console.log('test data course_list_id =' + course_list_id)
		console.log(params)
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
});



myJsCourse.controller('students', function($scope, $http){
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.token = localStorage.getItem('token');
	room_id = sessionStorage.getItem('room_id');
	student = sessionStorage.getItem('student')
	console.log(room_id)
	if( student !== null) {
		$scope.student = JSON.parse(student);
	
		if($scope.student.father.id !== null) {
			$scope.hasFather = true 
		}
		if($scope.student.mother.id !== null) {
			$scope.hasMother = true 
		}
		if($scope.student.guardian.id !== null) {
			$scope.hasGuardian = true 
		}

	}

	get_student = address + 'api/teacher/students?room_id='+ room_id  

	$http.get(get_student , {headers: {'token': $scope.token}})
		.success(function(data, status, header, config) {
			$scope.students = data.student_list
			console.log($scope.students)
		})
		.error(function(data, status, headers, config) {
       		console.log("error")
			if(data.error === 'token expired'){
				window.location.href = 'login.html';
			}
    	}
    );

	$scope.getStudent = function(data) {
		var newData = JSON.stringify(data)
		sessionStorage.setItem('student', newData)


		window.location.href = 'StudentList.html';
	}


});

