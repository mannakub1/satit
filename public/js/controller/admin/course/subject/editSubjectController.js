myApp.controller('editSubjectController', function($scope, $http, static_function, $location) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var address = sessionStorage.getItem('address');
    $scope.token = localStorage.getItem('token');
    var subject = sessionStorage.getItem('subject');

    $scope.subject = JSON.parse(subject);
    // $scope.subject.hour_per_year
    $scope.sendDataEditSubject = function() {
        var id = $scope.subject.id;
        var code = $scope.subject.code;
        var name = $scope.subject.name;
        var credit = $scope.subject.credit;
        var hour_per_year = $scope.subject.hour_per_year;
        var status = document.getElementById("status").value;

        var subject_action_edit = address + "api/subject/edit";
        params = { id: id, name: name, code: code, hour_per_year: hour_per_year, status: status, credit: credit}

        $http.post(subject_action_edit, angular.toJson(params), {
            transformRequest: angular.identity,
            headers: {'token': $scope.token, 'Content-Type': "application/json"}
        })
            .success(function(data, status, header, config){
                $location.path('admin/course/subject');
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }
});