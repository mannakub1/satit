myApp.controller('addNewRoomController', function ($scope, $http, $location, static_function) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    var year_room = JSON.parse(sessionStorage.getItem('year_room'));

    $scope.sendRoom = function () {
        path = address + 'api/room/add';
        var data = {year_room_id : year_room.id ,level : $scope.selectLevel, name : $scope.room_name};
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
