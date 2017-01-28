var myApp = angular.module('addStd', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('add_student', function($scope, $http)  {
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
        else{
         $scope.student.prefix = "เด็กหญิง";
          }


        console.log($scope.student);
         $http.post(path, angular.toJson($scope.student), {
           transformRequest: angular.identity,
           headers: {'token' : token, 'Content-Type': "application/json"}

         })
            .success(function(data, status, headers, config) {
                console.log(data);
                $scope.student = data.student;
                pathRoom = address + "api/student/add_student_room"
                $http.post(pathRoom, angular.toJson({id : $scope.student.id, room_id : roomId} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : token, 'Content-Type': "application/json"}

                })
                    .success(function(data, status, headers, config) {
                        window.location.href = 'Dashboard_Viewrooms_Std.html';

                    })
                    .error(function(data, status, headers, config) {
                        if(data.error === 'token expired'){
                            window.location.href = 'login.html';;
                        }
                    });

        })
            .error(function(data, status, headers, config) {
             if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
             }
        });
}
});