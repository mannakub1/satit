myApp.controller('studentSearchGradeController', function($scope, $http, static_function)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.student = JSON.parse(sessionStorage.getItem("student"));
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');




    $scope.getGrade = function (stdId) {
        var path = address + "api/student/courses?student_id=" + stdId;
        $http.get(path, {headers: {'token': token}})
            .success(function (data) {
                $scope.stdRoom = data.student_room;
                console.log($scope.stdRoom);
            })
            .error(function (data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    };
    $scope.getGrade($scope.student.id);
    $scope.Grade =  [];

    $scope.collapseGrade = function () {
        var e = document.getElementById("selectGradeLevel").value;
        for(var i = 0; i < $scope.Grade.length; ++i){
            $scope.Grade[i] = false;
        }
        $scope.Grade[e] = true;

        $scope.showStdGradeBtn = true;

    };

    $scope.chkScore = function (score) {
        if(score === 0){
            return "-";
        }
        else{
            return score;
        }
    };

    $scope.changeYearPlus = function(year){
        return parseInt(year) + 543;
    };

    $scope.changeYearMinus = function(year){
        return parseInt(year) - 543;
    };
});
