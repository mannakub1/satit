var myApp = angular.module('myApp', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');


myApp.controller('add_teacher_room', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    $scope.room = JSON.parse(sessionStorage.getItem('room_data'));
    var room_id = sessionStorage.getItem('roomId');
    teacher_list_path = address + 'api/teacher/present'
    var room_teacher = JSON.parse(sessionStorage.getItem('teacher_room'));
    window.onload = function () {
        if(room_teacher === null){
            $scope.button = {
                'name' : 'เพิ่ม',
            };
        }
        else{
            $scope.button = {
                'name' : 'เปลี่ยน',
            };
        }
    }


    $http.get( teacher_list_path , {headers: {'token': $scope.token}})
        .success(function(data, status, header, config) {
            console.log(data)
            $scope.teacher_lists = data.teacher;
        });


    $scope.changeStatus = function(data) {
        if ( data === 'super user'){
            return 'แอดมินระบบ'
        }else if( data === 'teacher') {
            return 'ครู'
        }else if( data === 'ceo') {
            return 'ผู้บริหาร'
        }
    }

    $scope.logout = function(){
        path = address + "api/logout";
        $http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                window.location.href = 'login.html';

            })
            .error(function(data, status, headers, config) {
            });
    }
    
    $scope.addTeacherRoom = function (id) {
        var data = {
            'teacher_id': id,
            'room_id': room_id,
        }
        path = address + "api/teacher/add_teacher_room"
        $http.post(path, angular.toJson(data), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                sessionStorage.setItem('teacher_room', JSON.stringify(data.teacher));
                window.location.href = "Dashboard_Viewrooms_Std_Teacher.html"
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }


});

myApp.controller('teacher_room', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    $scope.room = JSON.parse(sessionStorage.getItem('room_data'));
    $scope.teacher_room = JSON.parse(sessionStorage.getItem('teacher_room'));
    var room_id = sessionStorage.getItem('roomId');
    path = address + "api/teacher/teacher_room?room_id=" + room_id
        $http.get( path , {headers: {'token': $scope.token}})
            .success(function(data, status, header, config) {
                console.log(data)
                $scope.teacher_room = data.teacher;
                sessionStorage.setItem('teacher_room', JSON.stringify($scope.teacher_room));
                if($scope.teacher_room !== null){
                    $scope.have_teacher = true;
                }
            })
            .error(function (data) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });

    $scope.changeStatus = function(data) {
        if ( data === 'super user'){
            return 'แอดมินระบบ'
        }else if( data === 'teacher') {
            return 'ครู'
        }else if( data === 'ceo') {
            return 'ผู้บริหาร'
        }
    }

    $scope.logout = function(){
        path = address + "api/logout";
        $http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                window.location.href = 'login.html';

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.addTeacherRoom = function (id) {
        var data = {
            'teacher_id': id,
            'room_id': room_id,
        }
        path = address + "api/teacher/add_teacher_room"
        $http.post(path, angular.toJson(data), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }


});