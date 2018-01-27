myApp.controller('addStudentController', function($scope, $http, $location, static_function)  {
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.room_data = JSON.parse(sessionStorage.getItem('room_data'));
    if($scope.room_data.level == "ป.4") {
        $scope.level4 = true;
    }else {
        $scope.level4 = false;
    }
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.student = {prefix : "", code_number : "",
        first_name : "", last_name : "", iden_number : "",
        blood : "", birthdate : "", address : "",
        district : "", parish : "", city : "", call : ""
        , zip_code : "", ability : "", ethnicity : "",
        nationality : ""};
    var roomId = sessionStorage.getItem('roomId');
    $scope.sendAddStudent = function(){
        path = address + "api/student/add_student";
        if(document.getElementById("male").checked){
            $scope.student.prefix = "เด็กชาย";
         }
        else if(document.getElementById("female").checked){
         $scope.student.prefix = "เด็กหญิง";
          }
         $http.post(path, angular.toJson($scope.student), {
           transformRequest: angular.identity,
           headers: {'token' : token, 'Content-Type': "application/json"}
         })
            .success(function(data, status, headers, config) {
                $scope.student = data.student;
                pathRoom = address + "api/student/add_student_room"
                $http.post(pathRoom, angular.toJson({id : $scope.student.id, room_id : roomId} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : token, 'Content-Type': "application/json"}
                })
                    .success(function(data, status, headers, config) {
                        $location.path('admin/viewroom/student');
                    })
                    .error(function(data, status, headers, config) {
                        static_function.token_expired_check(data.error);
                    });

        })
            .error(function(data, status, headers, config) {
             static_function.token_expired_check(data.error);
        });
}
});

myApp.controller('addStudentCSVController', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.room = JSON.parse(sessionStorage.getItem('room_data'));
    var roomId = sessionStorage.getItem('roomId');


});