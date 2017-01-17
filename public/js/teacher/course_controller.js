var myApp = angular.module('course', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('roomindex', function($scope, $http)  {

    var subject_id = sessionStorage.getItem('subject_id')
    get_room = address + 'api/subject/rooms_by_subject?subject_id=' + subject_id
    console.log("test get_room")
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
        // window.location.href = '../teacher/course/index_student.html'
    }
});

myApp.controller('students', function($scope, $http)  {

    var room_id = sessionStorage.getItem('room_id');
    get_students = address + 'api/teacher/students?room_id='+ room_id

    $http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            $scope.students = data.student_list
        }).error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
            window.location.href = '../../login.html';;
        }
    });


});