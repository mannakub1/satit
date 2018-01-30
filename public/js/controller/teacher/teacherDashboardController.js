myApp.controller('teacherDashboardController', function($scope, $http)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');

});
