var myApp = angular.module('student', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('room_index', function($scope, $http)  {
	
	var subject_id = sessionStorage.getItem('subject_id')

	get_room = address + 'api/subject/rooms_by_subject?subject_id=' + subject_id

	$http.get(get_room , {headers: {'token': token}})
	.success(function(data, status, header, config) {
		console.log(data.rooms)
		$scope.rooms = data.rooms;

	}).error(function(data, status, headers, config) {
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
	});
});