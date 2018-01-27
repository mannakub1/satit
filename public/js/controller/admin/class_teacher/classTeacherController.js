myApp.controller('changeClassTeacherController', function($scope, $http, static_function, $location)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.room = JSON.parse(sessionStorage.getItem('room_data'));
    var room_id = sessionStorage.getItem('roomId');
    teacher_list_path = address + 'api/teacher/present'
    var room_teacher = JSON.parse(sessionStorage.getItem('teacher_room'));
    setTimeout(function () {
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
    }, 100)
    $http.get(teacher_list_path , {headers: {'token': token}})
        .success(function(data, status, header, config) {
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
                $location.path('/login');

            })
            .error(function(data, status, headers, config) {
                $location.path('/login');
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
                sessionStorage.setItem('teacher_room', JSON.stringify(data.teacher));
                $location.path('admin/viewroom/class_teacher');
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }


});

myApp.controller('classTeacherController', function($scope, $http, static_function, $location)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.room = JSON.parse(sessionStorage.getItem('room_data'));
    $scope.teacher_room = JSON.parse(sessionStorage.getItem('teacher_room'));
    var room_id = sessionStorage.getItem('roomId');
    path = address + "api/teacher/teacher_room?room_id=" + room_id;
        $http.get( path , {headers: {'token': token}})
            .success(function(data, status, header, config) {
                $scope.teacher_room = data.teacher;
                sessionStorage.setItem('teacher_room', JSON.stringify($scope.teacher_room));
                if($scope.teacher_room !== null){
                    $scope.have_teacher = true;
                }
            })
            .error(function (data) {
                static_function.token_expired_check(data.error);
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
                $location.path('login');

            })
            .error(function(data, status, headers, config) {
                $location.path('login');
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
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }


});