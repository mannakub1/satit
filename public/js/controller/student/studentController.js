myApp.controller('studentDashboardController',  function($scope, $http, static_function, $location) {
    $scope.edit = true;
    $scope.showHome = true;
    $scope.student = JSON.parse(sessionStorage.getItem('stdData'));
    $scope.token = localStorage.getItem('token');

    if($scope.student.father.length !== 0){
        $scope.hasFather = true;
    }
    if($scope.student.mother.length !== 0){
        $scope.hasMother = true;
    }
    if($scope.student.guardian.length !== 0){
        $scope.hasGuardian = true;
    }

    $scope.showFile = false;
    $scope.showStudent = false;
    $scope.showEditStudent = false;
    $scope.showEditFather = false;
    $scope.showEditMother = false;
    $scope.showEditGuardian = false;
    $scope.showStudentData = false;
    $scope.showAddStudent = false;
    //console.log($scope.userType);

    $scope.showStudentDataBtn = function() {
        $scope.student = JSON.parse(sessionStorage.getItem('stdData'));
        $scope.showStudentData = true;
        $scope.showStudentGrade = false;
        $scope.showFile = false;
        $scope.showStudent = false;
        $scope.showEditStudent = false;
        $scope.showEditFather = false;
        $scope.showEditMother = false;
        $scope.showEditGuardian = false;
        $scope.showAddStudent = false;
        $scope.showAddFather = false;
        $scope.showAddGuardian = false;
        $scope.showAddMother = false;
        $scope.showStdGrade = false;
        $scope.showHome = false;
    };

    $scope.showStudentGradeBtn = function(){
        $scope.showStdGrade = true;
        $scope.showStudentData = false;
        $scope.showFile = false;
        $scope.showStudent = false;
        $scope.showEditStudent = false;
        $scope.showEditFather = false;
        $scope.showEditMother = false;
        $scope.showEditGuardian = false;
        $scope.showAddStudent = false;
        $scope.showAddFather = false;
        $scope.showAddGuardian = false;
        $scope.showAddMother = false;
        $scope.getGrade();
        $scope.showHome = false;

    };

    $scope.editStudent = function(){

        $scope.showEditStudent = true;
        $scope.edit = false;
        if($scope.student.prefix === "เด็กชาย"){
            document.getElementById("male").checked = true;
        }
        else if($scope.student.prefix === "เด็กหญิง"){
            document.getElementById("female").checked = true;
        }
        else{
            document.getElementById("male").checked = false;
            document.getElementById("female").checked = false;
        }


    };

    $scope.editFather = function(){
        $scope.showEditFather = true;
        $scope.edit = false;    };

    $scope.editMother = function(){
        $scope.showEditMother = true;
        $scope.edit = false;    };

    $scope.editGuardian = function(){
        $scope.showEditGuardian = true;
        $scope.edit = false;    };

    $scope.addFather = function(){
        $scope.showAddFather = true;
        $scope.edit = false;
    };

    $scope.addMother = function(){
        $scope.showAddMother = true;
        $scope.edit = false;    };

    $scope.addGuardian = function(){
        $scope.showAddGuardian = true;
        $scope.edit = false;
    };

    $scope.backEditStudent = function(){
        $location.reload();
    };

    $scope.sendEditStudent = function(){
        path = address + "api/student/edit_profile";
        if(document.getElementById("male").checked){
            $scope.student.prefix = "เด็กชาย";
        }
        else if(document.getElementById("female").checked){
            $scope.student.prefix = "เด็กหญิง";
        }

        $scope.std = {};
        $scope.std.id = $scope.student.id;
        $scope.std.ability = $scope.student.ability;
        $scope.std.address = $scope.student.address;
        $scope.std.birthdate = $scope.student.birthdate;
        $scope.std.blood = $scope.student.blood;
        $scope.std.call = $scope.student.call;
        $scope.std.city = $scope.student.city;
        $scope.std.code_number = $scope.student.code_number;
        $scope.std.delete_status = $scope.student.delete_status;
        $scope.std.district = $scope.student.district;
        $scope.std.ethnicity = $scope.student.ethnicity;
        $scope.std.first_name = $scope.student.first_name;
        $scope.std.iden_number = $scope.student.iden_number;
        $scope.std.last_name = $scope.student.last_name;
        $scope.std.nationality = $scope.student.nationality;
        $scope.std.parish = $scope.student.parish;
        $scope.std.prefix = $scope.student.prefix;
        $scope.std.zip_code = $scope.student.zip_code;
        $http.post(path, angular.toJson($scope.std), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                $scope.student = data.student;
                sessionStorage.setItem('stdData', JSON.stringify($scope.student));
                $scope.showEditStudent = false;
                $scope.showStudentData = true;
                location.reload();

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.sendEditFather = function(){
        path = address + "api/student/edit_adult";
        $http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                $scope.student.father[0] = data;
                sessionStorage.setItem('stdData', JSON.stringify($scope.student));
                $scope.showEditFather = false;
                $scope.showStudentData = true;
                location.reload();

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.sendEditMother = function(){
        path = address + "api/student/edit_adult";
        $http.post(path, angular.toJson($scope.student.mother[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                $scope.student.mother[0] = data;
                sessionStorage.setItem('stdData', JSON.stringify($scope.student));
                $scope.showEditMother = false;
                $scope.showStudentData = true;
                location.reload();

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.sendEditGuardian = function(){
        path = address + "api/student/edit_adult";
        $http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                $scope.student.guardian[0] = data;
                sessionStorage.setItem('stdData', JSON.stringify($scope.student));
                $scope.showEditGuardian = false;
                $scope.showStudentData = true;
                //	$scope.showStudent = true;
                location.reload();

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.sendAddFather = function(){
        path = address + "api/student/add_adult";
        $http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                var path = address + "api/student/add_father";
                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                })
                $scope.student.father[0] = data;
                sessionStorage.setItem('stdData', JSON.stringify($scope.student));
                $scope.hasFather = true;
                $scope.showAddFather = false;
                $scope.showStudentData = true;
                //	$scope.showStudent = true;
                location.reload();

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.sendAddMother = function(){
        path = address + "api/student/add_adult";
        $http.post(path, angular.toJson($scope.student.mother[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                path = address + "api/student/add_mother";
                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                });

                $scope.student.mother[0] = data;
                sessionStorage.setItem('stdData', JSON.stringify($scope.student));
                $scope.hasMother = true;
                $scope.showAddMother = false;
                $scope.showStudentData = true;
                location.reload();

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.sendAddGuardian = function(){
        path = address + "api/student/add_adult";

        $http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                var path = address + "api/student/add_guardian";
                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                }).success(function (data) {
                    $scope.student.guardian[0] = data;
                    sessionStorage.setItem('stdData', JSON.stringify($scope.student));
                    $scope.showAddGuardian = false;
                    $scope.hasGuardian = true;
                    $scope.showStudentData = true;
                    location.reload();

                })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    });
    };

    $scope.getGrade = function () {
        path = address + "api/student/courses?student_id=" + $scope.student.id;
        $http.get(path , {headers: {'token': $scope.token} })
            .success(function(data){
                $scope.stdRoom = data.student_room;
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.Grade =  [];

    $scope.collapseGrade = function () {
        var e = document.getElementById("selectGradeLevel").value;
        for(var i = 0; i < $scope.Grade.length; ++i){
            $scope.Grade[i] = false;
        }
        $scope.Grade[e] = true;

    };

    $scope.refresh = function(){
        $http.get(pathStudent)
            .success(function(data){
                $scope.users = data;
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };

    $scope.changeYearPlus = function(year){
        return parseInt(year) + 543;
    };

    $scope.changeYearMinus = function(year){
        return parseInt(year) - 543;
    }


});
