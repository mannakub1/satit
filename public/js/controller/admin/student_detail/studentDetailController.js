myApp.controller('studentDetailController',function($scope, $http, static_function, $location)  {
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    student = sessionStorage.getItem('student');
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }
    $scope.hasFather = false
    $scope.hasMother = false
    $scope.hasGuardian = false
    if($scope.student.father.length !== 0) {
        $scope.hasFather = true
    }
    if($scope.student.mother.length !== 0) {
        $scope.hasMother = true
    }
    if($scope.student.guardian.length !== 0) {
        $scope.hasGuardian = true
    }
    $scope.addFather = function(){
        $location.path("/admin/viewroom/student/data/father/add");
    }
    $scope.addMother = function(){
        $location.path("/admin/viewroom/student/data/mother/add");
    }
    $scope.addGuardian = function(){
        $location.path("/admin/viewroom/student/data/guardian/add");
    }
    $scope.editFather = function(){
        $location.path("/admin/viewroom/student/data/father/edit");
    }
    $scope.editMother = function(){
        $location.path("/admin/viewroom/student/data/mother/edit");
    }
    $scope.editGuardian = function(){
        $location.path("/admin/viewroom/student/data/guardian/edit");
    }
    $scope.editStudent = function() {
        $location.path("/admin/viewroom/student/data/edit");
    }

});


