myApp.controller('teacherPasswordController', function($scope, $http, static_function, $location)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    $scope.token = localStorage.getItem('token');
	teacher_list_path = address + 'api/teacher/present'

	$http.get( teacher_list_path , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.teacher_lists = data.teacher;
	})
		.error(function (data) {
			static_function.token_expired_check(data.error);
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


	$scope.sendDataEditPassword = function() {
		var newPassword = $scope.teacher.newPassword;
		var rePassword = $scope.teacher.rePassword;
		var teacher_id = sessionStorage.getItem('teacher_id');
		var teacher_edit_password_path = address + 'api/teacher/edit_password';

		if( newPassword === rePassword ){
			var params = { id: teacher_id, password: newPassword };
			$http.post(teacher_edit_password_path, angular.toJson(params), {
			transformRequest: angular.identity,
			headers: {'token': $scope.token, 'Content-Type': "application/json"}
			})
			.success(function(data, status, header, config){
				$location.path('admin/teacher');
			})
			.error(function(data, status, headers, config) {
        		static_function.token_expired_check(data.error);
			});
		}
		else {
			alert("password incorrect");
		}
		
	}

});