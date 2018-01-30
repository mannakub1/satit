myApp.controller('studentSearchController', function($scope, $http, static_function, $location)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
	$scope.selectType = function() {
		var type = document.getElementById("selectType").value;
		
		if (type == 'code_number') {
			$scope.serachByCodeNumber($scope.data)
		} else if (type == 'first_name') {
			$scope.serachByFirstName($scope.data)
		} else if (type == 'last_name') {
			$scope.serachByLastName($scope.data)
		}
	};

	$scope.serachByCodeNumber = function(input) {
		var get_student = address + 'api/student/code_number?code_number=' + input;
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
			$scope.searchData = data.student;
        }).error(function(data, status, headers, config) {
	        static_function.token_expired_check(data.error);
    	});
	};

	$scope.serachByFirstName = function(input) {
		var get_student = address + 'api/student/first_name?first_name=' + input;
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            $scope.searchData = data.student;
        }).error(function(data, status, headers, config) {
	        static_function.token_expired_check(data.error);
    	});
	};

	$scope.serachByLastName = function(input) {
		var get_student = address + 'api/student/last_name?last_name=' + input;
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            $scope.searchData = data.student;
        }).error(function(data, status, headers, config) {
	        static_function.token_expired_check(data.error);
    	});
	};

	$scope.selectStudent = function(index){
		sessionStorage.setItem("student",JSON.stringify($scope.searchData[index]));
		$location.path('admin/search_student/data');
	}
});

