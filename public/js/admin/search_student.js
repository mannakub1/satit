var myApp = angular.module('search', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('student', function($scope, $http)  {

	$scope.selectType = function() {
		var type = document.getElementById("selectType").value
		
		if (type == 'code_number') {
			$scope.serachByCodeNumber($scope.data)
		} else if (type == 'first_name') {
			$scope.serachByFirstName($scope.data)
		} else if (type == 'last_name') {
			$scope.serachByLastName($scope.data)
		}
	}

	$scope.serachByCodeNumber = function(input) {
		get_student = address + 'api/student/code_number?code_number=' + input
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
        	console.log(data)
			$scope.searchData = data.student;
        }).error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
	            window.location.href = 'login.html';
	        }
    	});
	}

	$scope.serachByFirstName = function(input) {
		get_student = address + 'api/student/first_name?first_name=' + input
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
        	console.log(data)
            $scope.searchData = data.student;
        }).error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
	            window.location.href = 'login.html';
	        }
    	});
	}

	$scope.serachByLastName = function(input) {
		get_student = address + 'api/student/last_name?last_name=' + input
		$http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
        	console.log(data)
            $scope.searchData = data.student;
        }).error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
	            window.location.href = 'login.html';
	        }
    	});
	}

	$scope.selectStudent = function(index){
		sessionStorage.setItem("student",JSON.stringify($scope.searchData[index]));
		window.location.href = "SearchStudentData.html"
	}
});

myApp.controller('student_data', function($scope, $http)  {
	$scope.student = JSON.parse(sessionStorage.getItem("student"));
	console.log($scope.student);
    if($scope.student.father.length !== 0){
        $scope.hasFather = true;
    }
    if($scope.student.mother.length !== 0){
        $scope.hasMother = true;
    }
    if($scope.student.guardian.length !== 0){
        $scope.hasGuardian = true;
    }
});

myApp.controller('student_grade', function($scope, $http)  {
    $scope.student = JSON.parse(sessionStorage.getItem("student"));

    $scope.getGrade = function (stdId) {
        path = address + "api/student/courses?student_id=" + stdId;
        $http.get(path, {headers: {'token': token}})
            .success(function (data) {
                console.log(data);
                $scope.stdRoom = data.student_room;
                console.log($scope.stdRoom);
            })
            .error(function (data, status, headers, config) {
                if (data.error === 'token expired') {
                    window.location.href = 'login.html';
                    ;
                }
            });
    }
    $scope.getGrade($scope.student.id);
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
});
