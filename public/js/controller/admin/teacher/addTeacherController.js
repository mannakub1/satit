myApp.controller('addTeacherController',  function($scope, $http, static_function, $location) {
    var token = localStorage.getItem("token");
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.sendAddTeacher = function() {
        if($scope.teacher.password === $scope.teacher2.password){
            var path = address + "api/teacher/add";
            $scope.teacher.status = document.getElementById("status").value;
            $scope.teacher.resign = true;
            $http.post(path, angular.toJson($scope.teacher), {
                transformRequest: angular.identity,
                headers: {'token' : token, 'Content-Type': "application/json"}

            })
                .success(function(data, status, headers, config) {
                    $location.path('admin/teacher');
                })
                .error(function(data, status, headers, config) {
                    if(data.error === "this teacher is already"){
                        alert("this teacher is already has");
                    }
                    else if(data.error === "this username is already"){
                        alert("this username is already has");
                    }
                    else{
                        $location.path('login');
                    }
                });
        }
        else if($scope.teacher.password !== $scope.teacher2.password){
            alert("Your password doesn't match");
        }
    }
});
