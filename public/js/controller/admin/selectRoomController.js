myApp.controller('selectRoomController', function ($scope, $http) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    $scope.showButtonManageYearRoom = true;
    pathRoom = address + "api/room/year_room_all";
    $http.get(pathRoom, {headers: {'token': $scope.token} })
        .success(function(data, status, headers, config) {
            console.log(data);
            $scope.yearRooms = data.year_rooms;
        })
        .error(function(data, status, headers, config) {
            if(data.error === 'token expired'){
                window.location.href = 'login.html';;
            }
            else{
                console.log("error");
            }
        });

    $scope.selectCourse = function () {
        var index = document.getElementById("selectCourse").value;
        sessionStorage.setItem('year_room',JSON.stringify($scope.yearRooms[index]));
        $scope.getRooms($scope.yearRooms[index].id)
        // console.log("id year room = "+$scope.yearRooms[index].id);
        $scope.rooms = $scope.yearRooms[index].rooms;
        $scope.showTable = true;
        $scope.showButtonManageYearRoom = false;
    }

    $scope.AddTextInput = function () {
        $scope.addRoom = {};
        $scope.showButtonManageYearRoom = false;
        $scope.showInputTextAddYearRoom = true;
    }

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
                console.log(data.error);
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.getRooms = function(year_room_id) {

        pathGetRooms = address + "api/room/room_ids?id="+year_room_id;
        $http.get(pathGetRooms, {headers: {'token': $scope.token} })
            .success(function(data, status, headers, config) {
                console.log(data);
                $scope.rooms = data.rooms

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
                else{
                    console.log("error");
                }
            });
    }

    $scope.selectRoom = function (roomId, index) {
        $scope.roomSelect = JSON.parse(sessionStorage.getItem('year_room'));
        sessionStorage.setItem('room_data', JSON.stringify($scope.rooms[index]));
        sessionStorage.setItem('roomId',JSON.stringify(roomId));
        window.location.href = "Dashboard_Viewrooms_Std.html";
    }
})
