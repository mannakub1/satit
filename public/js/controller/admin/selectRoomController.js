myApp.controller('selectRoomController', function ($scope, $http, $location, static_function) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    $scope.showButtonManageYearRoom = true;
    pathRoom = address + "api/room/year_room_all";
    $http.get(pathRoom, {headers: {'token': $scope.token} })
        .success(function(data, status, headers, config) {
            $scope.yearRooms = data.year_rooms;
        })
        .error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
        });

    $scope.selectCourse = function () {
        var index = document.getElementById("selectCourse").value;
        sessionStorage.setItem('year_room',JSON.stringify($scope.yearRooms[index]));
        $scope.getRooms($scope.yearRooms[index].id);
        $scope.rooms = $scope.yearRooms[index].rooms;
        $scope.showTable = true;
        $scope.showButtonManageYearRoom = false;
    };

    $scope.AddTextInput = function () {
        $scope.addRoom = {};
        $scope.showButtonManageYearRoom = false;
        $scope.showInputTextAddYearRoom = true;
    };

    $scope.sendDataAddYearRoom = function () {
        console.log($scope.addRoom);
        $http.post(address + "api/room/create_year_room", angular.toJson($scope.addRoom), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
        })
            .success(function(data, status, headers, config) {
                alert("เพิ่มห้องเรียนสำเร็จ");
                refresh();
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.getRooms = function(year_room_id) {
        pathGetRooms = address + "api/room/room_ids?id="+year_room_id;
        $http.get(pathGetRooms, {headers: {'token': $scope.token} })
            .success(function(data, status, headers, config) {
                $scope.rooms = data.rooms;
                console.log(data.rooms);
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.selectRoom = function (roomId, index) {
        $scope.roomSelect = JSON.parse(sessionStorage.getItem('year_room'));
        sessionStorage.setItem('room_data', JSON.stringify($scope.rooms[index]));
        sessionStorage.setItem('roomId',JSON.stringify(roomId));
        $location.path("admin/viewroom/student");
    };

    $scope.editRoom = function (index) {
        sessionStorage.setItem('room_data', JSON.stringify($scope.rooms[index]));
        $location.path('admin/viewroom/edit_room')
    }
    
    $scope.deleteRoom = function (index) {
        var room_id = $scope.rooms[index].id;
        var year_room = JSON.parse(sessionStorage.getItem('year_room'));

        var params = { year_room_id: year_room.id, room_id: room_id };
        var pathSendDataStudentRoomDelete = address + 'api/room/delete';
        var con = confirm("Do you want to delete this room?");
        console.log(params);
        if(con){
            $http.post(pathSendDataStudentRoomDelete, angular.toJson(params), {
                transformRequest: angular.identity,
                headers: {'token' : $scope.token, 'Content-Type': "application/json"}
            })
                .success(function(data, status, headers, config) {
                    location.reload();
                })
                .error(function(data, status, headers, config) {
                    static_function.token_expired_check(data.error);
                });
        }
    }

});
