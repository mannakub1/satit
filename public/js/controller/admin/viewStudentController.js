myApp.controller('viewStudentController', function ($scope, $http, $location, static_function) {
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
            var student_status = []
            for( var i = 0 ; i < data.student_list.length; i++) {
                $scope.studentData.push(data.student_list[i].student)
                student_status.push(data.student_list[i].student_status);
            }
            setTimeout(function(){
                for(var i = 0; i < $scope.studentData.length; i++){
                    if(student_status[i] === false){
                        var str = document.getElementById(i.toString()).innerHTML;
                        var result = str.strike();
                        document.getElementById(i.toString()).innerHTML = result;
                        str = document.getElementById("stdDataCode" + i.toString()).innerHTML;
                        result = str.strike();
                        document.getElementById("stdDataCode" + i.toString()).innerHTML = result;
                        str = document.getElementById("stdDataFName" + i.toString()).innerHTML;
                        result = str.strike();
                        document.getElementById("stdDataFName" + i.toString()).innerHTML = result;
                        str = document.getElementById("stdDataLName" + i.toString()).innerHTML;
                        result = str.strike();
                        document.getElementById("stdDataLName" + i.toString()).innerHTML = result;
                    }
                }
            }, 100);
            $scope.showRoom = false;
        })
        .error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
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
                $scope.stdRoom = data.student_room;
                sessionStorage.setItem('stdGrade',JSON.stringify($scope.stdRoom));
                $location.path("admin/viewroom/student/grade");
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.getDetail = function(student) {
        var newData = JSON.stringify(student);
        sessionStorage.setItem('student', newData);

        $location.path("/admin/viewroom/student/data") ;
    }

    $scope.goAddStudent = function(){
        $location.path("admin/viewroom/student/add");
    }

    $scope.deleteStudent = function(index) {

        $scope.room_id = sessionStorage.getItem('roomId');
        $scope.student_id = $scope.student_room[index].student.id
        $scope.student_room_id = $scope.student_room[index].id

        var params = { student_id: $scope.student_room_id, room_id: $scope.room_id, student_room_id: $scope.student_room_id }
        var pathSendDataStudentRoomDelete = address + 'api/student/delete_student_room'
        var con = confirm("Do you want to delete this student?");
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
