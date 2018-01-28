myApp.controller('teacherChangPasswordController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    $scope.token = localStorage.getItem('token');

	$scope.sendDataEditPassword = function() {
		var newPassword = $scope.teacher.newPassword;
		var rePassword = $scope.teacher.rePassword;
		var teacher_edit_password_path = address + 'api/teacher/edit_password';
		var teacher_id = sessionStorage.getItem('teacher_id');
		if( newPassword === rePassword ){
			var params = { id: teacher_id, password: newPassword };

			$http.post(teacher_edit_password_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
			})
			.success(function(data, status, header, config){
				alert("เปลี่ยนรหัสผ่านสำเร็จ");
				$location.path('teacher');

			})
			.error(function(data, status, headers, config) {
        		static_function.token_expired_check(data.error);

			});
		}
		
	}
});