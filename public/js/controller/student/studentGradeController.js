myApp.controller('studentGradeController',  function($scope, $http, $location, static_function) {
    $scope.token = localStorage.getItem('token');
    $scope.student = JSON.parse(sessionStorage.getItem('stdData'));
    var address = sessionStorage.getItem('address');

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

    $scope.getGrade();
});
