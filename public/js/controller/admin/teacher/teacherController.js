myApp.controller('adminTeacherController', function($scope, $http, static_function, $location)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
	var teacher_list_path = address + 'api/teacher/present'

	$http.get( teacher_list_path , {headers: {'token': token}})
	.success(function(data, status, header, config) {
		$scope.teacher_lists = data.teacher;
	});

	$scope.changeStatus = function(data) {
		console.log(data);
		if ( data === 'admin'){
			return 'แอดมินระบบ'
		}else if( data === 'teacher') {
			return 'ครู'
		}else if( data === 'ceo') {
			return 'ผู้บริหาร'
		}
	}

	$scope.deleteTeacher = function(data) {
		var teacher_action_delete_path = address + 'api/teacher/delete'
		var params = {id: data}
		var con = confirm("Do you want to delete this teacher?");
		if(con){
            $http.post(teacher_action_delete_path, angular.toJson(params), {
                transformRequest: angular.identity,
                headers: {'token': token, 'Content-Type': "application/json"}
            })
                .success(function(data, status, header, config){
                    location.reload();
                })
                .error(function (data) {
                    static_function.token_expired_check(data.error);
                })
		}

	}

	$scope.editPasswordPage = function(data) {
		sessionStorage.setItem('teacher_id', data);
		$location.path('admin/teacher/change_password');
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
			headers: {'token': token, 'Content-Type': "application/json"}
			})
			.success(function(data, status, header, config){
				$location.path('admin/teacher');
			})
			.error(function(data, status, headers, config) {
        		static_function.token_expired_check(data.error);
			});
		}
	}

});