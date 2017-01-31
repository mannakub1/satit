var myApp = angular.module('room', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('rooms', function($scope, $http)  {

	$scope.table = false
	$scope.negative = false
	pathRoom = address + "api/room/year_room_all";
	$http.get(pathRoom, {headers: {'token':token} })
		.success(function(data, status, headers, config) {
			console.log('test call api');
			console.log(data);
			$scope.yearRooms = data.year_rooms;
		})
		.error(function(data, status, headers, config) {
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
			else{
				console.log("error");
			}
		});

	$scope.selectCourse = function () {
		var index = document.getElementById("selectCourse").value;
		sessionStorage.setItem('year_room_name',$scope.yearRooms[index].name);

		$scope.rooms = [];
		var count = 0;
		for( var i = 0 ; i < $scope.yearRooms[index].rooms.length ; i++) {
			if($scope.yearRooms[index].rooms[i].level == 'ป.4') {
				$scope.rooms[count++] = $scope.yearRooms[index].rooms[i]
			}
		}
		if(count == 0) {
			$scope.negative = true
			$scope.table = false
		}else {
			$scope.table = true
			$scope.negative = false
		}

	}

	$scope.selectRoom = function (roomId) {
		sessionStorage.setItem('roomId',JSON.stringify(roomId));
		window.location.href = "add_fourth_student.html";
	}
});

myApp.controller('fourth_student', function($scope, $http)  {
	
	
	room_id = sessionStorage.getItem('roomId')
	year_name = sessionStorage.getItem('year_room_name')
	
	pathGetStudent = address + "api/student/student_year_room?"+"year="+year_name;
	console.log("path = " + pathGetStudent)
	$http.get(pathGetStudent, {headers: {'token':token} })
	.success(function(data, status, headers, config) {
		console.log(data.student)
		$scope.students = data.student
	})
	.error(function(data, status, headers, config) {
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
		else{
			console.log("error");
		}
	});

	$scope.addStudentRoom = function(student_id,id) {
		// document.getElementById("bt").className="btn btn-default btn-sm"
		pathAddStudentRoom = address + 'api/student/add_student_room'
		params = { id: student_id, room_id: room_id }
		$http.post(pathAddStudentRoom, angular.toJson(params), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			document.getElementById("bt"+id).className="btn btn-default btn-sm"
     	 })
		.error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
      	});

	}

});

