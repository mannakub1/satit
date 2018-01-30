myApp.controller('roomDetailController', function($scope, $http, static_function, $location) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    var address = sessionStorage.getItem('address');
    var room_id = sessionStorage.getItem('room_id');
    var student = sessionStorage.getItem('student');
    var get_student = address + 'api/teacher/students?room_id='+ room_id;

    $http.get(get_student , {headers: {'token': $scope.token}})
        .success(function(data, status, header, config) {
            $scope.students = data.student_list
        })
        .error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
        });

    $scope.getStudent = function(data) {
        var newData = JSON.stringify(data);
        sessionStorage.setItem('student', newData);
        $location.path('/admin/course/room/student');
    }
});