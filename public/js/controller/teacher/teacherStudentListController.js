myApp.controller('teacherStudentListController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    $scope.token = localStorage.getItem('token');
	var teacher_id = sessionStorage.getItem('teacher_id')
	var get_room = address + 'api/teacher/rooms?teacher_id=' + teacher_id


	$http.get(get_room , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.room_list = data.room;

	}).error(function(data, status, headers, config) {
		static_function.token_expired_check(data.error);
	});

	$scope.getStudentList = function(room_id) {
		sessionStorage.setItem('room_id', room_id);
		$location.path('/teacher/room/student');
	}
	
});
