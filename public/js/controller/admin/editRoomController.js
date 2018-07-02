myApp.controller('editRoomController', function ($scope, $http, $location, static_function) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    var room_data = JSON.parse(sessionStorage.getItem('room_data'));
    var year_room = JSON.parse(sessionStorage.getItem('year_room'));
    $scope.selectLevel = room_data.level;
    $scope.room_name = room_data.name;

    $scope.sendRoom = function () {
        path = address + 'api/room/edit';
        var data = {room_id : room_data.id, year_room_id : year_room.id ,level : $scope.selectLevel, name : $scope.room_name};
        console.log(data);
        console.log(data.year_room_id);
        $http.post(path, angular.toJson(data), {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': "application/json"}
        })
            .success(function(data, status, headers, config) {
                $location.path('admin/viewroom');
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }
});
