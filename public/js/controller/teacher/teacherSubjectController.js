myApp.controller('teacherSubjectController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
	$scope.token = localStorage.getItem('token');
    var address = sessionStorage.getItem('address');

    var teacher_id = sessionStorage.getItem('teacher_id');
	
	var get_subject = address + 'api/teacher/subjects?teacher_id=' + teacher_id;

	$http.get(get_subject , {headers: {'token': $scope.token}})
	.success(function(data, status, header, config) {
		$scope.subjects = data.subjects;

	}).error(function(data, status, headers, config) {
		static_function.token_expired_check(data.error);
	});

	$scope.getRoom = function(subject_index){
		sessionStorage.setItem('subject_index', subject_index);
		sessionStorage.setItem('subject', JSON.stringify($scope.subjects));
		$location.path('teacher/subject/room');
	}
});

