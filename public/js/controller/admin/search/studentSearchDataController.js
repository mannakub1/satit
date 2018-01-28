myApp.controller('studentSearchDataController', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.student = JSON.parse(sessionStorage.getItem("student"));
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