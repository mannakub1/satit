

myApp.controller('teacherCourseIndexController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    $scope.subject = JSON.parse(sessionStorage.getItem('subject'))[sessionStorage.getItem('subject_index')];
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    var subject_id = $scope.subject.id;
    var get_room = address + 'api/subject/rooms_by_subject?subject_id=' + subject_id;
    $http.get(get_room , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            $scope.room_list = data.rooms;

        }).error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
    });

    $scope.get = function(index_room) {
        sessionStorage.setItem('name_room', "ชั้นประถมศึกษาชั้นปีที่ " +  $scope.room_list[index_room].level+ " ห้อง "+  $scope.room_list[index_room].name ); 
        sessionStorage.setItem('year_room', "ปีการศึกษา" +  $scope.room_list[index_room].year);
        sessionStorage.setItem('room_id', $scope.room_list[index_room].id);
        $location.path('teacher/subject/room/student/score');
    }


});

myApp.controller('teacherCourseStudentScoreController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.show_name_room = sessionStorage.getItem('name_room');
    $scope.show_year_room = sessionStorage.getItem('year_room');
    $scope.subject = JSON.parse(sessionStorage.getItem('subject'))[sessionStorage.getItem('subject_index')];
    var room_id = sessionStorage.getItem('room_id');
    var subject_id = $scope.subject.id;
    var get_students = address + 'api/student/student_subject?room_id='+ room_id + '&subject_id=' + subject_id

    $http.get(get_students , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            $scope.students = data.student_list;
        }).error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
    });

    $scope.sendEditScore = function () {
        path = address + "api/teacher/edit_score";

        $scope.sentDataArr = [];
        var count = 0;
        var isError = false;
        for(var i = 0; i < $scope.students.length; ++i) {
                $scope.sentData = {teacher_id: "", student_id: "", student_subject_id: "", score1: "", score2: ""};
                $scope.sentData.student_id = $scope.students[i].student_room.student.id;
                $scope.sentData.student_subject_id = $scope.students[i].id;
                $scope.sentData.score1 = $scope.students[i].score1;
                $scope.sentData.score2 = $scope.students[i].score2;
                $scope.sentDataArr[count] = $scope.sentData;
                $scope.sentData.teacher_id = parseInt(sessionStorage.getItem('teacher_id'));
                console.log($scope.sentData);
                $http.post(path, angular.toJson($scope.sentData), {
                    transformRequest: angular.identity,
                    headers: {'token': token, 'Content-Type': "application/json"}

                })
                    .success(function (data, status, headers, config) {

                    })
                    .error(function (data, status, headers, config) {
                        if (data.error === 'token expired') {
                            window.location.href = 'login.html';
                        }
                        else{
                            isError = true;
                        }
                    });
                count++;

        }
        if(isError !== true){
            var a = alert("Success!")
            if(a){
                $location.path('teacher/subject/room/student/score');
            }
            //window.location.href = "index_student.html";
        }
        else{
            //alert("Error! Please Try Again");
        }
        //console.log($scope.sentDataArr);
    }

});