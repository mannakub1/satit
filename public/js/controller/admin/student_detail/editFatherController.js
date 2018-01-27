myApp.controller('adminEditFatherController', function($scope, $http, static_function, $location)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    var student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendEditFather = function(){
        path = address + "api/student/edit_adult";
        $http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}
        })
            .success(function(data, status, headers, config) {
                $scope.student.father[0] = data;
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                setTimeout(function(){
                    $location.path('admin/viewroom/student/data');
                }, 300);
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }


});


