myApp.controller('addRoomController', function($scope, $http, static_function, $location) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.course_list_id = sessionStorage.getItem('course_list_id');
	var address = sessionStorage.getItem('address');
	$scope.token = localStorage.getItem('token');

	year_room_list_path = address + 'api/room/year_room_all'

	$http.get( year_room_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.year_rooms = data.year_rooms;
	}).error(function(data, status, headers, config) {
   		static_function.token_expired_check(data.error);
	
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
		}).error(function(data, status, headers, config) {
	   		static_function.token_expired_check(data.error);
		
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
			static_function.token_expired_check(data.error);
			alert('มีห้องเรียนนี้อยู่แล้ว');
		});

	}
});