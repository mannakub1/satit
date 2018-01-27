myApp.controller('adminViewStudentGradeController', function ($scope, $http, $location, static_function) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem('token');
    $scope.Grade = [];
    $scope.stdRoom = JSON.parse(sessionStorage.getItem('stdGrade'));
    for(var i = 0; i < $scope.stdRoom.length; ++i) {
        if ($scope.stdRoom[i].ca === null) {
            $scope.stdRoom[i].ca = '0';
        }
        if ($scope.stdRoom[i].cp === null) {
            $scope.stdRoom[i].cp = '0';
        }
        if ($scope.stdRoom[i].cr === null) {
            $scope.stdRoom[i].cr = '0';
        }
        if ($scope.stdRoom[i].gp === null) {
            $scope.stdRoom[i].gp = '0';
        }
        if ($scope.stdRoom[i].gpa === null) {
            $scope.stdRoom[i].gpa = '0';
        }
    }
    $scope.cr = [];
    for(var i = 0; i < $scope.stdRoom.length; ++i){
        var cr = 0;
        var cp = 0;
        var ca = 0;
        var gp = 0;
        for(var j = 0; j < $scope.stdRoom[i].student_subjects.length; ++j){
            if($scope.stdRoom[i].student_subjects[j].subject.status !== "พัฒนาผู้เรียน"){
                cr += $scope.stdRoom[i].student_subjects[j].subject.credit;
                cp += $scope.stdRoom[i].student_subjects[j].subject.credit;
                ca += $scope.stdRoom[i].student_subjects[j].subject.credit;
                if(!$scope.stdRoom[i].student_subjects[j].grade || $scope.stdRoom[i].student_subjects[j].grade === 0 || $scope.stdRoom[i].student_subjects[j].grade === 'U'){
                    cp -= $scope.stdRoom[i].student_subjects[j].subject.credit;
                }
                if(!$scope.stdRoom[i].student_subjects[j].grade || $scope.stdRoom[i].student_subjects[j].grade === 'U' ||$scope.stdRoom[i].student_subjects[j].grade === 'S'){
                    ca -= $scope.stdRoom[i].student_subjects[j].subject.credit;
                }
                if(!(!$scope.stdRoom[i].student_subjects[j].grade)){
                    gp += $scope.stdRoom[i].student_subjects[j].subject.credit * parseFloat($scope.stdRoom[i].student_subjects[j].grade);
                }
            }
        }
        $scope.stdRoom[i].cr_cal = cr;
        $scope.stdRoom[i].cp_cal = cp;
        $scope.stdRoom[i].ca_cal = ca;
        $scope.stdRoom[i].gp_cal = gp;
        var gpa_cal = parseFloat(gp)/parseFloat(ca);
        $scope.stdRoom[i].gpa_cal = parseFloat(Math.round(gpa_cal * 100) / 100).toFixed(2);
        $scope.stdRoom[i].gpa = parseFloat(Math.round($scope.stdRoom[i].gpa * 100) / 100).toFixed(2);
    }

    $scope.stdId = sessionStorage.getItem('student_id')

    $scope.collapseGrade = function () {
        var e = document.getElementById("selectGradeLevel").value;
        sessionStorage.setItem('grade_index', e);
        for(var i = 0; i < $scope.Grade.length; ++i){
            $scope.Grade[i] = false;
        }
        $scope.Grade[e] = true;


    }

    $scope.sendEditScore = function () {
        path = address + "api/teacher/edit_score";
        //console.log($scope.stdRoom);

        $scope.sentDataArr = [];
        var count = 0;
        var isError = false;
        for(var i = 0; i < $scope.stdRoom.length; ++i) {
            for(var j = 0; j < $scope.stdRoom[i].student_subjects.length; ++j) {
                if($scope.stdRoom[i].student_subjects[j].subject.status !== "พัฒนาผู้เรียน"){
                    $scope.sentData = {teacher_id: "", student_id: "", student_subject_id: "", score1: "", score2: ""};
                    $scope.sentData.teacher_id = sessionStorage.getItem('admin_id');
                    $scope.sentData.student_id = $scope.stdId;
                    $scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
                    $scope.sentData.score1 = $scope.stdRoom[i].student_subjects[j].score1;
                    $scope.sentData.score2 = $scope.stdRoom[i].student_subjects[j].score2;
                    $scope.sentDataArr[count] = $scope.sentData;
                    console.log($scope.sentData);
                    $http.post(path, angular.toJson($scope.sentData), {
                        transformRequest: angular.identity,
                        headers: {'token': $scope.token, 'Content-Type': "application/json"}

                    })
                        .success(function (data, status, headers, config) {
                            $scope.stdRoom = data;
                            sessionStorage.setItem('stdGrade', JSON.stringify(data));
                        })
                        .error(function (data, status, headers, config) {
                            static_function.token_expired_check(data.error);
                        });
                    count++;
                }
                else {
                    $scope.sentData = {teacher_id: "", student_id: "",score1: 0, score2: 0, student_subject_id: "", grade: ""};
                    $scope.sentData.teacher_id = sessionStorage.getItem('admin_id');
                    $scope.sentData.student_id = $scope.stdId;
                    $scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
                    $scope.sentData.grade = $scope.stdRoom[i].student_subjects[j].grade;
                    $http.post(address + "api/teacher/edit_score", angular.toJson($scope.sentData), {
                        transformRequest: angular.identity,
                        headers: {'token': token, 'Content-Type': "application/json"}
                    })
                        .success(function (data, status, headers, config) {
                            $scope.stdRoom = data;
                            sessionStorage.setItem('stdGrade', JSON.stringify(data));
                        })
                        .error(function (data, status, headers, config) {
                            console.log(data);
                            if (data.error === 'token expired') {
                                $locationn.path('/login');
                            }
                            else{
                                isError = true;
                            }
                        });
                }
            }
        }
    }

    $scope.viewGradeStudent = function(stdId){
        $scope.showStdGrade = true;
        $scope.showStudent = false;
        $scope.getGrade(stdId);
    }

    $scope.getGrade = function (stdId) {
        path = address + "api/student/courses?student_id=" + stdId;
        $scope.stdId = stdId;
        $http.get(path , {headers: {'token': $scope.token} })
            .success(function(data){
                $scope.stdRoom = data.student_room;
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.goPrintGrade = function (grade_index) {
        sessionStorage.setItem('grade_index', grade_index);
        $location.path('admin/viewroom/student/grade/print');
    }
});