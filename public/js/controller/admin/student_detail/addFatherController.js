myApp.controller('adminAddFatherController', function($scope, $http, $location, static_function)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    var student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendAddFather = function(){
        path = address + "api/student/add_adult";
        $http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}
        })
            .success(function(data, status, headers, config) {
                path = address + "api/student/add_father";
                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : token, 'Content-Type': "application/json"}
                })
                $scope.student.father[0] = data;
                var newData = JSON.stringify($scope.student);
                sessionStorage.setItem('student', newData);
                setTimeout(function(){
                    $location.path('admin/viewroom/student/data');
                }, 300);
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }


});