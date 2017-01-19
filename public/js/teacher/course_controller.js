var myApp = angular.module('course', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('roomindex', function($scope, $http)  {

    var subject_id = sessionStorage.getItem('subject_id')
    get_room = address + 'api/subject/rooms_by_subject?subject_id=' + subject_id
    $http.get(get_room , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            console.log(data.rooms)

            $scope.room_list = data.rooms;

        }).error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
            window.location.href = 'login.html';;
        }
    });

    $scope.get = function(room_id) {
        console.log('test function getStudentList')
        sessionStorage.setItem('room_id', room_id);
        window.location.href = '../course/index_student.html'
    }


});

myApp.controller('students', function($scope, $http)  {

    var room_id = sessionStorage.getItem('room_id');
    var subject_id = sessionStorage.getItem('subject_id')
    get_students = address + 'api/student/student_subject?room_id='+ room_id + '&subject_id=' + subject_id

    $http.get(get_students , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            console.log(data.student_list)
            $scope.students = data.student_list
        }).error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
            window.location.href = '../../login.html';;
        }
    });


});