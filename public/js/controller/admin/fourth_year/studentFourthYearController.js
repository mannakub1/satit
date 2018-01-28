

myApp.controller('fourthYearRoomController', function($scope, $http, static_function, $location)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
	$scope.table = false;
	$scope.negative = false;
	pathRoom = address + "api/room/year_room_all";
	$http.get(pathRoom, {headers: {'token':token} })
		.success(function(data, status, headers, config) {
			$scope.yearRooms = data.year_rooms;
		})
		.error(function(data, status, headers, config) {
			static_function.token_expired_check(data.error);
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
			$scope.negative = true;
			$scope.table = false;
		}else {
			$scope.table = true;
			$scope.negative = false;
		}

	};

	$scope.selectRoom = function (roomId) {
		sessionStorage.setItem('roomId',JSON.stringify(roomId));
        var pathGetStudent = address + "api/student/student_year_room?"+"year="+ sessionStorage.getItem('year_room_name');
        $http.get(pathGetStudent, {headers: {'token':token} })
            .success(function(data, status, headers, config) {
                $scope.students = data.student;
                if($scope.students.length !== 0){
                    $location.path('admin/add_grade4_student/data');
				}
				else{
                	alert("ไม่มีนักเรียน ป.3 ของปีการศึกษา " + String((parseInt(sessionStorage.getItem('year_room_name')) - 1)));
				}
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });

	}
});

myApp.controller('fourthYearStudentController', function($scope, $http, static_function, $location)  {
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	var room_id = sessionStorage.getItem('roomId');
	var year_name = sessionStorage.getItem('year_room_name');
	
	var pathGetStudent = address + "api/student/student_year_room?"+"year="+year_name;
	$http.get(pathGetStudent, {headers: {'token':token} })
	.success(function(data, status, headers, config) {
		$scope.students = data.student;
	})
	.error(function(data, status, headers, config) {
		static_function.token_expired_check(data.error);
	});

	$scope.addStudentRoom = function(student_id,id) {
		// document.getElementById("bt").className="btn btn-default btn-sm"
		var pathAddStudentRoom = address + 'api/student/add_student_room'
		var params = { id: student_id, room_id: room_id }
		$http.post(pathAddStudentRoom, angular.toJson(params), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			document.getElementById("bt"+id).className="btn btn-default btn-sm"
     	 })
		.error(function(data, status, headers, config) {
	        static_function.token_expired_check(data.error);
      	});

	}

});

