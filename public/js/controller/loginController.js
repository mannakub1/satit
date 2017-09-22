/**
 * Created by Deklnwzaza on 22/9/2560.
 */
myApp.controller('loginController',  function($scope, $http, $location) {
    $scope.apiUser = 'canet';
    $scope.apiPass = 'CanetM2017';
    $scope.user = '';
    $scope.pass = '';



    $scope.login = function(){
        path = address + "api/login";
        var authen = {username : $scope.apiUser, password : $scope.apiPass};
        $http.post(path, angular.toJson(authen), {
            transformRequest: angular.identity,
            headers: {'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                if(data.status){
                    $scope.token = data.token;
                    localStorage.setItem('token', data.token);
                    path = address + "api/teacher/login";
                    var authen = {username : $scope.user, password : $scope.pass};
                    console.log(authen);
                    console.log($scope.token);
                    $http.post(path, angular.toJson(authen), {
                        transformRequest: angular.identity,
                        headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                    })
                        .success(function(data, status, headers, config) {
                            sessionStorage.setItem('user', "teacher");
                            if(data.teacher.status === 'teacher') {
                                sessionStorage.setItem('teacher_id', data.teacher.id);
                                sessionStorage.setItem('teacher_prefix', data.teacher.prefix);
                                sessionStorage.setItem('teacher_first_name', data.teacher.first_name);
                                sessionStorage.setItem('teacher_last_name',data.teacher.last_name);
                                window.location.href = 'teacher/index.html'
                            }
                            else {
                                sessionStorage.setItem('admin_id', data.teacher.id);
                                sessionStorage.setItem('admin_prefix', data.teacher.prefix);
                                sessionStorage.setItem('admin_first_name', data.teacher.first_name);
                                sessionStorage.setItem('admin_last_name', data.teacher.last_name);
                                $location.path('admin');
                            }
                        })
                        .error(function(data, status, headers, config) {
                            console.log(data.error);
                            if(data.error === "not teacher"){
                                path = address + "api/teacher/student/login";
                                $http.post(path, angular.toJson(authen), {
                                    transformRequest: angular.identity,
                                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                                })
                                    .success(function(data, status, headers, config) {
                                        console.log(data);
                                        sessionStorage.setItem('stdData', JSON.stringify(data.student));
                                        window.location.href = 'DashboardStudent.html';
                                    })
                                    .error(function(data, status, headers, config) {
                                        console.log(data);
                                        alert("Connection Error")
                                    });
                            }
                            else{
                                alert("Username or Password is invalid");
                            }
                        });
                }
                //console.log(authen);
                else{
                    alert("Username or Password is invalid");
                }
            })
            .error(function(data, status, headers, config) {
                console.log(data)
                alert("Connection Error")
            });

    }
});
