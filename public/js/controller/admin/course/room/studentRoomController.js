myApp.controller('studentRoomController', function($scope, $http, static_function, $location){
    var address = sessionStorage.getItem('address');
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    var room_id = sessionStorage.getItem('room_id');
    var student = sessionStorage.getItem('student');
    if( student !== null) {
        $scope.student = JSON.parse(student).student;
        console.log($scope.student);
        if($scope.student.father.length !== 0) {
            $scope.hasFather = true
        }
        if($scope.student.mother.length !== 0) {
            $scope.hasMother = true
        }
        if($scope.student.guardian.length !== 0) {
            $scope.hasGuardian = true
        }

    }

});
