var app = angular.module('myApp', []);
var address = "http://172.27.225.132:3000/"

app.controller('StudentCtrl', function($scope, $http) {
    $http.get(address + "api/teacher/student").then(function(response) {
        $scope.studentData = response.data.students;
    });
	
	
	 
	//angular.extend(this, $controller('GradeCtrl', {$scope: $scope}));
});

app.controller('GradeCtrl', function($scope, $http) {
    $http.get("http://172.27.183.54:3000/api/teacher/student").then(function(response) {

        $scope.gradeData = response.data.students;
    });
});

