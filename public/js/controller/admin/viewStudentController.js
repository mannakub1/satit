myApp.controller('viewStudentController', function ($scope, $http, $location) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    var roomId = sessionStorage.getItem('roomId');
    $scope.roomData = JSON.parse(sessionStorage.getItem('room_data'));

    pathStudent = address + 'api/teacher/students?room_id=' + roomId;
    $http.get(pathStudent, {headers: {'token': $scope.token} })
        .success(function(data, status, headers, config) {
            $scope.studentData = []
            $scope.student_room = data.student_list
            console.log($scope.student_room)
            for( var i = 0 ; i < data.student_list.length; i++) {
                $scope.studentData.push(data.student_list[i].student)
            }
            setTimeout(function(){
                for(var i = 0; i < $scope.studentData.length; i++){
                    //console.log("stdData" + i.toString());
                    //console.log($scope.studentData[i].delete_status);
                    if($scope.studentData[i].delete_status === "1"){
                        var str = document.getElementById(i.toString()).innerHTML;
                        var result = str.strike();
                        document.getElementById(i.toString()).innerHTML = result;
                        var str = document.getElementById("stdDataCode" + i.toString()).innerHTML;
                        var result = str.strike();
                        document.getElementById("stdDataCode" + i.toString()).innerHTML = result;
                        var str = document.getElementById("stdDataFName" + i.toString()).innerHTML;
                        var result = str.strike();
                        document.getElementById("stdDataFName" + i.toString()).innerHTML = result;
                        var str = document.getElementById("stdDataLName" + i.toString()).innerHTML;
                        var result = str.strike();
                        document.getElementById("stdDataLName" + i.toString()).innerHTML = result;

                    }
                }
            }, 300);
            $scope.showRoom = false;
        })
        .error(function(data, status, headers, config) {
            if(data.error === 'token expired'){
                $location.path("../login");
            }
        });

    $scope.viewGradeStudent = function(stdId){
        sessionStorage.setItem('student_id', stdId);
        $scope.getGrade(stdId);
        // ade(stdId);
    }

    $scope.getGrade = function (stdId) {
        path = address + "api/student/courses?student_id=" + stdId;
        $scope.stdId = stdId;
        $http.get(path , {headers: {'token': $scope.token} })
            .success(function(data){
                console.log(data);
                $scope.stdRoom = data.student_room;
                sessionStorage.setItem('stdGrade',JSON.stringify($scope.stdRoom));
                window.location.href = 'Dashboard_Viewrooms_Std_Grade.html';
                console.log($scope.stdRoom);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    $location.path("../login");
                }
            });
    }


    $scope.getDetail = function(student) {
        var newData = JSON.stringify(student);
        sessionStorage.setItem('student', newData);

        window.location.href = 'Dashboard_Viewrooms_Std_Data.html' ;
    }

    $scope.goAddStudent = function(){
        window.location.href = 'AddStudents.html';
    }

    $scope.deleteStudent = function(index) {

        $scope.room_id = sessionStorage.getItem('roomId');
        $scope.student_id = $scope.student_room[index].student.id
        $scope.student_room_id = $scope.student_room[index].id

        params = { student_id: $scope.student_room_id, room_id: $scope.room_id, student_room_id: $scope.student_room_id }
        pathSendDataStudentRoomDelete = address + 'api/student/delete_student_room'
        console.log(params)
        $http.post(pathSendDataStudentRoomDelete, angular.toJson(params), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    $location.path("../login");
                }
            });
    }
});
