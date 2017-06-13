var myApp = angular.module('addStd', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.directive('uploader', function($http) {
    return {
        restrict: 'E',
        template: '<input type="file"><br><br>' +
        '<button class="btn btn-lg btn-primary btn-block" type="submit" ng-click="uploadFile()" value="Upload" style = "width: 40%">Submit</button>',
        scope: {},
        link: function(scope, el, attrs) {
            var dataStudent = '';
            var file = el.find('input');
            scope.fileName = '?';
            var button = el.find('button');
            button.bind('click', function(ev) {
                console.log(dataStudent);
                console.log(dataStudent.data[0].ชื่อ);
                var student = [];
                for(var i = 0; i < dataStudent.data.length; ++i){
                    if(dataStudent.data[i].ชื่อ == "" || dataStudent.data[i].ลำดับที่ == ""){
                        break;
                    }
                    student[i] = {
                            "prefix" : dataStudent.data[i].คำนำหน้าชื่อ,
                            "first_name" : dataStudent.data[i].ชื่อ,
                            "last_name" : dataStudent.data[i].นามสกุล,
                            "call" : dataStudent.data[i].เบอร์โทร,
                            "code_number" : dataStudent.data[i].เลขประจำตัว,
                            "address" : dataStudent.data[i].ที่อยู่,
                    }
                }
                var studentJson = {
                    "students" : student,
                    "room_id" : sessionStorage.getItem('roomId'),
                }
                 console.log(studentJson);
                $http.post(address + "api/teacher/file_add_student", angular.toJson(studentJson), {
                    transformRequest: angular.identity,
                    headers: {'token' : token, 'Content-Type': "application/json"}

                })
                    .success(function(data, status, headers, config) {
                        window.location.href = "Dashboard_Viewrooms_Std.html";
                    })
                    .error(function(data, status, headers, config) {
                        if(data.error === 'token expired'){
                            //window.location.href = 'login.html';
                        }
                        console.log(data.error);
                    });
            });
            file.bind('change', function(ev) {
                var files = event.target.files;
                scope.fileName = files[0].name;
                scope.$apply(function() {
                    scope.fileName = files[0].name;
                    Papa.parse(files[0], {
                        header: true,
                        dynamicTyping: true,
                        complete: function(results) {
                            data = results;
                            dataStudent = data;
                            //console.log(data);
                        }
                    });


                });
                //console.log(files, ev);
            });
        }
    };
});


myApp.controller('add_student', function($scope, $http)  {
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

myApp.controller('add_student_csv', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.room = JSON.parse(sessionStorage.getItem('room_data'));
    var roomId = sessionStorage.getItem('roomId');
    console.log($scope.room);


});