myApp.controller('subjectDetailController', function($scope, $http, static_function, $location)  {
    $scope.token = localStorage.getItem('token');
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var subject_id = sessionStorage.getItem('subject_id');
    var get_teacher_path = address + "api/subject/teacher_courses?id=" + subject_id;
    var get_subject_path = address + "api/subject/by_ids?id=" + subject_id;
    $scope.subject_id = subject_id;


    $http.get(get_subject_path , {headers: {'token': $scope.token}})
        .success(function(data, status, header, config) {
            var newData = JSON.stringify(data.subject);
            sessionStorage.setItem('subject', newData);
            $scope.subject = data.subject

        }).error(function(data, status, headers, config) {
        static_function.token_expired_check(data.error);
    });


    $http.get(get_teacher_path , {headers: {'token': $scope.token}})
        .success(function(data, status, header, config) {
            $scope.teachers = data.teachers;

        }).error(function(data, status, headers, config) {
        static_function.token_expired_check(data.error);
    });

    $scope.changeStatus = function(data) {
        if ( data === 'admin'){
            return 'แอดมินระบบ';
        }else if( data === 'teacher') {
            return 'ครู';
        }else if( data === 'ceo') {
            return 'ผู้บริหาร';
        }
    }

    $scope.deleteTeacherCourse = function(data) {
        var teacher_delete_path = address + "api/subject/delete_teacher"
        var params = { subject_id: $scope.subject_id, teacher_id: data }

        $http.post(teacher_delete_path, angular.toJson(params), {
            transformRequest: angular.identity,
            headers: {'token': $scope.token, 'Content-Type': "application/json"}
        })
            .success(function(data, status, header, config){
                location.reload();
            })
            .error(function (data) {
                static_function.token_expired_check(data.error);
            })
    }
});