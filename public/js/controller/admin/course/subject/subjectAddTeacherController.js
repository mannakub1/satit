myApp.controller('subjectAddTeacherController', function($scope, $http, static_function, $location) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    var address = sessionStorage.getItem('address');
    var teacher_list_path = address + 'api/teacher/teacher_spec';

    $http.get( teacher_list_path , {headers: {'token': $scope.token}})
        .success(function(data, status, header, config) {
            $scope.teacher_lists = data.teacher;
        }).error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
        });

    $scope.subject_id = sessionStorage.getItem('subject_id');

    $scope.addTeacherCourse = function(data) {
        var add_teacher_course_path = address + 'api/subject/add_teacher';
        var params = { subject_id: $scope.subject_id, teacher_id: data };

        $http.post(add_teacher_course_path, angular.toJson(params), {
            transformRequest: angular.identity,
            headers: {'token': $scope.token, 'Content-Type': "application/json"}
        })
            .success(function(data, status, header, config){
                alert('เพิ่มอาจารย์เรียบร้อย');
            }).error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
                alert('มีอาจารย์ท่านนี้อยู่แล้ว');
        });
    }
});
