var myApp = angular.module('myApp', ['ngRoute']);
var address = sessionStorage.getItem('address');

myApp.controller('printStudentGradeController', function ($scope, $http) {
    $scope.token = localStorage.getItem('token');
    $scope.Grade = [];
    $scope.stdRoom = JSON.parse(sessionStorage.getItem('stdGrade'));
    console.log($scope.stdRoom);
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
        var cr, cr_temp = 0;
        var cp, cp_temp = 0;
        var ca, ca_temp = 0;
        var gp, gp_temp = 0;
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
            if($scope.stdRoom[i].student_subjects[j].subject.status === "วิชาเพิ่มเติม"){
                cr_temp += $scope.stdRoom[i].student_subjects[j].subject.credit;
                cp_temp += $scope.stdRoom[i].student_subjects[j].subject.credit;
                ca_temp += $scope.stdRoom[i].student_subjects[j].subject.credit;
                if(!$scope.stdRoom[i].student_subjects[j].grade || $scope.stdRoom[i].student_subjects[j].grade === 0 || $scope.stdRoom[i].student_subjects[j].grade === 'U'){
                    cp_temp -= $scope.stdRoom[i].student_subjects[j].subject.credit;
                }
                if(!$scope.stdRoom[i].student_subjects[j].grade || $scope.stdRoom[i].student_subjects[j].grade === 'U' ||$scope.stdRoom[i].student_subjects[j].grade === 'S'){
                    ca_temp -= $scope.stdRoom[i].student_subjects[j].subject.credit;
                }
                if(!(!$scope.stdRoom[i].student_subjects[j].grade)){
                    gp_temp += $scope.stdRoom[i].student_subjects[j].subject.credit * parseFloat($scope.stdRoom[i].student_subjects[j].grade);
                }
            }
            if($scope.stdRoom[i].student_subjects[j].subject.name === "ชมรม"){
                $scope.stdRoom[i].student_subjects[j].subject.name = "ชมรม........................................................"
            }
        }
        $scope.stdRoom[i].cr_cal = cr;
        $scope.stdRoom[i].cp_cal = cp;
        $scope.stdRoom[i].ca_cal = ca;
        $scope.stdRoom[i].gp_cal = gp;
        var gpa_cal = parseFloat(gp)/parseFloat(ca);
        $scope.stdRoom[i].gpa_cal = parseFloat(Math.round(gpa_cal * 100) / 100).toFixed(2);
        $scope.stdRoom[i].gpa = parseFloat(Math.round($scope.stdRoom[i].gpa * 100) / 100).toFixed(2);

        $scope.stdRoom[i].cr_temp_cal = cr_temp;
        $scope.stdRoom[i].cp_temp_cal = cp_temp;
        $scope.stdRoom[i].ca_temp_cal = ca_temp;
        $scope.stdRoom[i].gp_temp_cal = gp_temp;
        var gpa_temp_cal = parseFloat(gp_temp)/parseFloat(ca_temp);
        $scope.stdRoom[i].gpa_temp_cal = parseFloat(Math.round(gpa_temp_cal * 100) / 100).toFixed(2);
        $scope.stdRoom[i].gpa_temp = parseFloat(Math.round($scope.stdRoom[i].gpa_temp * 100) / 100).toFixed(2);
    }

    console.log($scope.stdRoom);
    $scope.stdId = sessionStorage.getItem('student_id')
    console.log($scope.stdRoom);
    console.log('test log data')

    $scope.collapseGrade = function () {
        var e = document.getElementById("selectGradeLevel").value;
        for(var i = 0; i < $scope.Grade.length; ++i){
            $scope.Grade[i] = false;
        }
        $scope.Grade[e] = true;


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
});
