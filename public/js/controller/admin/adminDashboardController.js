myApp.controller('adminDashboardController',  function($scope, $http, fileUpload, pathApi, $location) {
    $scope.token = localStorage.getItem('token');
    $scope.userType = sessionStorage.getItem('user');
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.roomId = -1;
    sessionStorage.setItem('index_current_course',null);
    sessionStorage.setItem('index_current_course_list', null);

    //console.log($scope.userType);
    if($scope.userType === "teacher"){
        $scope.userTeacher = true;
    }
    else if($scope.userType === "student"){
        console.log($scope.userType);
        $scope.userStudent = true;
        $scope.userTeacher = false;
    }

    $scope.sendAddStudent = function(){
        path = address + "api/teacher/add_student";
        if(document.getElementById("male").checked){
            $scope.addStudent.prefix = "เด็กชาย";
        }
        else{
            $scope.addStudent.prefix = "เด็กหญิง";
        }
        //console.log(student);
        $http.post(path, angular.toJson($scope.addStudent), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                path = address + "api/teacher/add_student_room";
                $scope.stdAndRoom = {id : data.student.id, room_id : $scope.roomId};
                $http.post(path, angular.toJson($scope.stdAndRoom), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token,'Content-Type': "application/json"}

                })
                    .success(function(data, status, headers, config) {
                        $http.get(pathStudent, {headers: {'token': $scope.token} }).then(function(response) {
                            $scope.studentData = response.data["student_list"];
                        })


                    });
                $scope.showAddStudent = false;
                $scope.showStudent = true;
                $scope.addStudent = {code_number : '', first_name : '', last_name : '', iden_number : '', blood : '', birthdate : '', address : ''
                    , district : '', parish : '', city : '', call : '', zip_code : '', ability : '', ethnicity : '', nationality : ''};
            })
            .error(function(data, status, headers, config) {
                console.log("error")
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.sendEditStudent = function(){
        path = address + "api/teacher/edit_profile";
        if(document.getElementById("male").checked){
            $scope.student.prefix = "เด็กชาย";
        }
        else{
            $scope.student.prefix = "เด็กหญิง";
        }

        $scope.sentStudent = {id : $scope.student.id, prefix : $scope.student.prefix, code_number : $scope.student.code_number,
            first_name : $scope.student.first_name, last_name : $scope.student.last_name, iden_number : $scope.student.iden_number,
            blood : $scope.student.blood, birthdate : $scope.student.birthdate, address : $scope.student.address,
            district : $scope.student.district, parish : $scope.student.parish, city : $scope.student.city, call : $scope.student.call
            , zip_code : $scope.student.zip_code, ability : $scope.student.ability, ethnicity : $scope.student.ethnicity,
            nationality : $scope.student.nationality};
        console.log($scope.sentStudent);
        $http.post(path, angular.toJson($scope.sentStudent), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                $scope.student = data.student;
                console.log(data.student);
                $http.get(pathStudent, {headers: {'token': $scope.token} }).then(function(response) {
                    $scope.studentData = response.data["student_list"];
                });
                $scope.showEditStudent = false;
                $scope.showStudentData = true;
                //	$scope.showStudent = true;

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.sendEditFather = function(){
        path = address + "api/teacher/edit_adult";
        //console.log(student)
        $http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                $scope.student.father[0] = data;

                $scope.showEditFather = false;
                $scope.showStudentData = true;
                //	$scope.showStudent = true;

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.sendEditMother = function(){
        path = address + "api/teacher/edit_adult";
        //console.log(student)
        $http.post(path, angular.toJson($scope.student.mother[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                $scope.student.mother[0] = data;

                $scope.showEditMother = false;
                $scope.showStudentData = true;

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';
                }
            });
    }

    $scope.sendEditGuardian = function(){
        path = address + "api/teacher/edit_adult";
        consolt.log($scope.student.guardian[0]);
        //console.log(student)
        $http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                $scope.student.guardian[0] = data;

                $scope.showEditFather = false;
                $scope.showStudentData = true;
                //	$scope.showStudent = true;

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.sendAddFather = function(){
        path = address + "api/teacher/add_adult";
        //console.log(student)
        $http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                path = address + "api/teacher/add_father";
                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                })
                $scope.student.father[0] = data;
                $scope.hasMother = true;
                $scope.showAddFather = false;
                $scope.showStudentData = true;
                //	$scope.showStudent = true;

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.sendAddMother = function(){
        path = address + "api/teacher/add_adult";
        //console.log(student)
        $http.post(path, angular.toJson($scope.student.mother[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                path = address + "api/teacher/add_mother";
                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                })

                $scope.student.mother[0] = data;
                $scope.hasMother = true;
                $scope.showAddMother = false;
                $scope.showStudentData = true;

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.sendAddGuardian = function(){
        path = address + "api/teacher/add_adult";

        //console.log(student)
        $http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                path = address + "api/teacher/add_guardian";
                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                })
                $scope.student.guardian[0] = data;
                $scope.showAddGuardian = false;
                $scope.hasGuardian = true;
                $scope.showStudentData = true;
                //	$scope.showStudent = true;

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.sendRoom = function(roomId, roomName, roomLevel, year){
        $scope.roomLevel = roomLevel;
        $scope.roomName = roomName;
        $scope.roomId = roomId;
        $scope.year = parseInt(year) + 543;
        $scope.showHome = false;
        $scope.hasFather = false;
        $scope.hasMother = false;
        $scope.hasGuardian = false;
        //path ของนักเรียน
        pathStudent = address + 'api/teacher/students?&room_id=' + roomId;

        $http.get(pathStudent, {headers: {'token': $scope.token} })
            .success(function(data, status, headers, config) {
                if(data["student_list"] == ""){
                    $scope.showFile = true;
                }
                else{

                    $scope.showStudent = true;
                    $scope.showFile = false;
                    $scope.showEditStudent = false;
                    $scope.showEditFather = false;
                    $scope.showEditMother = false;
                    $scope.showEditGuardian = false;
                    $scope.showStudentData = false;
                    $scope.showAddStudent = false;
                    $scope.showStdGrade = false;
                    $scope.studentData = data["student_list"];


                    //your code to be executed after 1 second
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
                }
                $scope.showRoom = false;
                console.log(data["student_list"]);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });

    };


    $scope.refresh = function(){
        $http.get(pathStudent)
            .success(function(data){
                $scope.users = data;
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.uploadFile = function(){
        var roomId = $scope.roomId;
        var file = $scope.myFile;
        var r = new FileReader()
        console.log('file is ' );
        console.dir(file);
        //path ที่ส่งไฟล์ csv
        var uploadUrl = address + "api_controller/add_student";
        fileUpload.uploadFileToUrl("14", file, uploadUrl);
    };

    $scope.goAddStudent = function(){
        $scope.showStudent = false;
        $scope.showAddStudent = true;
    }

    $scope.deleteStudent = function(stdId){
        path = address + "api/teacher/delete_student";
        var idDelete = {'id' : stdId};
        console.log(idDelete);
        $http.post(path, angular.toJson(idDelete), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                $scope.sendRoom($scope.roomId, $scope.roomName, $scope.roomLevel, $scope.year);
                console.log(data.student);

            })
            .error(function(data, status, headers, config) {
                console.log("error");
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';
                }
            });
    }

    $scope.viewGradeStudent = function(stdId){

        $scope.showStdGrade = true;
        $scope.showStudent = false;
        $scope.getGrade(stdId);
    }

    $scope.sendEditScore = function (stdId) {
        path = address + "api/teacher/edit_score";
        //console.log($scope.stdRoom);
        $scope.sentDataArr = [];
        var count = 0;
        var isError = false;
        for(var i = 0; i < $scope.stdRoom.length; ++i) {
            for(var j = 0; j < $scope.stdRoom[i].student_subjects.length; ++j) {
                $scope.sentData = {student_id: "", student_subject_id: "", score1: "", score2: ""};
                $scope.sentData.student_id = $scope.stdId;
                $scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
                $scope.sentData.score1 = $scope.stdRoom[i].student_subjects[j].score1;
                $scope.sentData.score2 = $scope.stdRoom[i].student_subjects[j].score2;
                $scope.sentDataArr[count] = $scope.sentData;
                //console.log($scope.sentData);
                $http.post(path, angular.toJson($scope.sentData), {
                    transformRequest: angular.identity,
                    headers: {'token': $scope.token, 'Content-Type': "application/json"}

                })
                    .success(function (data, status, headers, config) {
                        console.log(data);
                        $scope.stdRoom = data.stdRoom;

                    })
                    .error(function (data, status, headers, config) {
                        console.log("error");
                        if (data.error === 'token expired') {
                            window.location.href = 'login.html';
                        }
                        else{
                            isError = true;
                        }
                    });
                count++;
            }
        }
        if(!isError){
            alert("Sucess!");
            $scope.viewGradeStudent(stdId);
        }
        else{
            alert("Error! Please Try Again");
        }
        //console.log($scope.sentDataArr);
    }

    $scope.logout = function(){
        path = address + "api/logout";
        $http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                window.location.href = 'login.html';

            })
            .error(function(data, status, headers, config) {
            });
    }

    function chkDelete(delete_status){
        if(delete_status === 1){
            document.getElementById("stdData").strike();
        }
    }

    $scope.getGrade = function (stdId) {
        path = address + "api/student/courses?student_id=" + stdId;
        $scope.stdId = stdId;
        $http.get(path , {headers: {'token': $scope.token} })
            .success(function(data){
                console.log(data);
                $scope.stdRoom = data.student_room;
                console.log($scope.stdRoom);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.Grade =  [];
    $scope.collapseGrade = function () {
        var e = document.getElementById("selectGradeLevel").value;
        for(var i = 0; i < $scope.Grade.length; ++i){
            $scope.Grade[i] = false;
        }
        $scope.Grade[e] = true;

        $scope.showStdGradeBtn = true;

    }

    $scope.chkScore = function (score) {
        if(score === 0){
            return "-";
        }
        else{
            return score;
        }
    }

    $scope.changeYearPlus = function(year){
        return parseInt(year) + 543;
    }

    $scope.changeYearMinus = function(year){
        return parseInt(year) - 543;
    }
    
    $scope.go = function (url) {
        $location.path(url);
    }


});