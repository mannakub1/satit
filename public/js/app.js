var token = localStorage.getItem('token');
// var address = "http://172.27.170.117:3000/";

// var address = "http://172.27.225.52:3000/";
//var address = "http://192.168.217.102:3000/";
// var address = 'http://localhost:3000/'
//var address = 'http://202.28.73.138:3000/'
var address = 'http://172.27.228.210:3000/'
// var address = 'http://172.27.225.177:3000/'
//var address = 'http://172.27.160.80:3000/'
// var address = "http://172.27.160.166:3000/";
// var address = "http://202.28.73.138:3000/";

var myApp = angular.module('myApp', ['ngRoute']);
myApp.config(function($routeProvider){
	$routeProvider.when("/admin", {
		templateUrl: 'public/js/views/admin/Dashboard.html',
		controller: 'adminDashboardController'
	})
		.when("/viewroom", {
			templateUrl: 'public/js/views/admin/Dashboard_Viewrooms.html',
			controller: 'selectRoomController'
		})
		.when("/viewroom/student", {
			templateUrl: 'public/js/views/admin/Dashboard_Viewrooms_Std.html',
			controller: 'viewStudentController'
		})
		.when("", {

		})
		.otherwise({
			redirectTo: '/login',
			templateUrl: 'public/js/views/login.html',
			controller: 'loginController'
		});
});

myApp.factory('pathApi', function() {
    return {

        //all_api
        api_login: "/CodeRoomService/public/index.php/login",
        api_logout: "/CodeRoomService/public/index.php/logout",
		api_add_room: address + "api_controller/student/add_room",
        //student
        api_get_student_announcement: "/CodeRoomService/public/index.php/api/student/announcement/",

        //teacher
        api_get_teacher_addStudent : "/CodeRoomService/public/index.php/api/teacher/student/all/",

        //admin
        api_get_admin_disableEnableCourse : "/CodeRoomService/public/index.php/api/admin/course/status/",
    };
});



sessionStorage.setItem('address', address);
var path;
var pathStudent;
var pathRoom;


myApp.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);

myApp.directive('navIndex', function () {
	return {
		restrict: 'E',
		scope: {
			someAttr: '&'
		},
		template: '<button ng-click="someAttr()">Go to Work</button>'
	};
});

myApp.service('fileUpload', ['$http', function ($http,pathApi) {
    this.uploadFileToUrl = function(roomId,file, uploadUrl){
		//path ที่จะส่งเลขห้องรอบ 2
		console.log(file);
		var roomPath = pathApi.api_add_room;
		var room = angular.toJson({room_id:"14"});
		console.log(room);
        var fd = new FormData();
        fd.append('csv', file);
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'token' : token, 'Content-Type': undefined}
			
        })
        .success(function(){
		$http.post(roomPath, room)
		.success(function(data, status, headers, config) {
        // this callback will be called asynchronously
        // when the response is available

      })
		.error(function(data, status, headers, config) {
			console.log("error roomID");
        // called asynchronously if an error occurs
        // or server returns response with an error status.
      });
        })
        .error(function(){
		console.log("error");
        });
		
    }
}]);



myApp.controller('mainCtrl',  function($scope, $http, fileUpload) {
	console.log(localStorage.getItem('token'));
	//console.log(sessionStorage.getItem('user'));
	$scope.token = localStorage.getItem('token');
	$scope.userType = sessionStorage.getItem('user');
	$scope.admin_first_name = sessionStorage.getItem('admin_first_name');
	$scope.admin_last_name = sessionStorage.getItem('admin_last_name');
	$scope.admin_prefix = sessionStorage.getItem('admin_prefix');

	$scope.roomId = -1;

	
	$scope.showRoom = true;
	$scope.showFile = false;
	$scope.showStudent = false;
	$scope.showEditStudent = false;
	$scope.showEditFather = false;
	$scope.showEditMother = false;
	$scope.showEditGuardian = false;
	$scope.showStudentData = false;
	$scope.showAddStudent = false;
	$scope.showHome = true;
	//console.log($scope.userType);
	if($scope.userType === "teacher"){

		$scope.userTeacher = true;
	}
	else if($scope.userType === "student"){
		console.log($scope.userType);
		$scope.userStudent = true;
		$scope.userTeacher = false;
	}
	
	$scope.addStudent = {code_number : '', first_name : '', last_name : '', iden_number : '', blood : '', birthdate : '', address : ''
						, district : '', parish : '', city : '', call : '', zip_code : '', ability : '', ethnicity : '', nationality : ''};
	pathRoom = address + "api/room/present";
	//path ข้อมูลห้อง
    $http.get(pathRoom, {headers: {'token': $scope.token} })
	.success(function(data, status, headers, config) {
		$scope.roomData = data.room_list;
		console.log(data);
	})
	.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
		else{

		}
    });

	
	$scope.sendStudentData = function(stdCode, stdPrefix, stdFirstName, stdLastName, stdId, stdIden, stdBlood, stdBirth, stdAddr, stdDistrict, stdParish, stdCity, stdCall, stdZip, stdAbility, stdEthnicity, stdNationality, stdIndex){
		$scope.student = $scope.studentData[stdIndex];
		$scope.stdIndex = stdIndex;
		if($scope.student.father.length !== 0){
			$scope.hasFather = true;
		}
		if($scope.student.mother.length !== 0){
			$scope.hasMother = true;
		}
		if($scope.student.guardian.length !== 0){
			$scope.hasGuardian = true;
		}
		console.log($scope.student.father.first_name);
		$scope.showStudent = false;
		$scope.showStudentData = true;
		if(stdBirth !== null){
		var year = new Date(stdBirth);
		$scope.stdYear = year.getFullYear() + 543 ;
		$scope.nowDate = new Date();
		var timeDiff = Math.abs($scope.nowDate.getTime() - year.getTime());
		var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
		$scope.age = Math.trunc((diffDays)/365);
		}
	}
	
	
	$scope.editStudent = function(){
		
		$scope.showEditStudent = true;
		$scope.showStudentData = false;
		if($scope.student.prefix === "เด็กชาย"){
			document.getElementById("male").checked = true;
		}
		else if($scope.student.prefix === "เด็กหญิง"){
			document.getElementById("female").checked = true;
		}
		else{
			document.getElementById("male").checked = false;
			document.getElementById("female").checked = false;
		}
		
		
	}
	
	$scope.editFather = function(){		
		$scope.showEditFather = true;
		$scope.showStudentData = false;
	
	}
	
	$scope.editMother = function(){		
		$scope.showEditMother = true;
		$scope.showStudentData = false;
	}
	
	$scope.editGuardian = function(){		
		$scope.showEditGuardian = true;
		$scope.showStudentData = false;
		
		
	}

	$scope.addFather = function(){
		$scope.showAddFather = true;
		$scope.showStudentData = false;

	}

	$scope.addMother = function(){
		$scope.showAddMother = true;
		$scope.showStudentData = false;
	}

	$scope.addGuardian = function(){
		$scope.showAddGuardian = true;
		$scope.showStudentData = false;
	}
	
	$scope.backEditStudent = function(){
		$scope.showStudentData = false;
		$scope.showStudent = true;
	}

	$scope.backToStdTable = function () {
		$scope.showStdGrade = false;
		$scope.sendRoom($scope.roomId, $scope.roomName, $scope.roomLevel, (parseInt($scope.year) - 543));

		$scope.showStudent = true;
	}

	$scope.backToStdData = function () {
		$scope.student = $scope.studentData[$scope.stdIndex];
		$scope.showStudentData = true;
		$scope.showEditMother = false;
		$scope.showEditGuardian = false;
		$scope.showEditFather = false;
		$scope.showEditStudent = false;
		$scope.showAddFather = false;
		$scope.showAddGuardian = false;
		$scope.showAddMother = false;
	}

	$scope.sendAddStudent = function(){
		path = address + "api/teacher/add_student";
		if(document.getElementById("male").checked){
			$scope.addStudent.prefix = "เด็กชาย";
		}
		else{
			$scope.addStudent.prefix = "เด็กหญิง";
		}
		//console.log(student);
		$http.post(path, angular.toJson($scope.addStudent), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			path = address + "api/teacher/add_student_room";
			$scope.stdAndRoom = {id : data.student.id, room_id : $scope.roomId};
			$http.post(path, angular.toJson($scope.stdAndRoom), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token,'Content-Type': "application/json"}
			
			})
			.success(function(data, status, headers, config) {
				$http.get(pathStudent, {headers: {'token': $scope.token} }).then(function(response) {	
				$scope.studentData = response.data["student_list"];	
			})
			
			
		});
			$scope.showAddStudent = false;
			$scope.showStudent = true;
			$scope.addStudent = {code_number : '', first_name : '', last_name : '', iden_number : '', blood : '', birthdate : '', address : ''
						, district : '', parish : '', city : '', call : '', zip_code : '', ability : '', ethnicity : '', nationality : ''};
      })
		.error(function(data, status, headers, config) {
        console.log("error")
		if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}
	
	$scope.sendEditStudent = function(){
		path = address + "api/teacher/edit_profile";
		if(document.getElementById("male").checked){
			$scope.student.prefix = "เด็กชาย";
		}
		else{
			$scope.student.prefix = "เด็กหญิง";
		}

		$scope.sentStudent = {id : $scope.student.id, prefix : $scope.student.prefix, code_number : $scope.student.code_number,
			first_name : $scope.student.first_name, last_name : $scope.student.last_name, iden_number : $scope.student.iden_number,
			blood : $scope.student.blood, birthdate : $scope.student.birthdate, address : $scope.student.address,
			district : $scope.student.district, parish : $scope.student.parish, city : $scope.student.city, call : $scope.student.call
			, zip_code : $scope.student.zip_code, ability : $scope.student.ability, ethnicity : $scope.student.ethnicity,
			nationality : $scope.student.nationality};
		console.log($scope.sentStudent);
		$http.post(path, angular.toJson($scope.sentStudent), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student = data.student;
			console.log(data.student);
			$http.get(pathStudent, {headers: {'token': $scope.token} }).then(function(response) {	
				$scope.studentData = response.data["student_list"];			
		});
			$scope.showEditStudent = false;
			$scope.showStudentData = true;
		//	$scope.showStudent = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}
	
	$scope.sendEditFather = function(){
		path = address + "api/teacher/edit_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student.father[0] = data;
			
			$scope.showEditFather = false;
			$scope.showStudentData = true;
		//	$scope.showStudent = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}

	$scope.sendEditMother = function(){
		path = address + "api/teacher/edit_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.mother[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student.mother[0] = data;
			
			$scope.showEditMother = false;
			$scope.showStudentData = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';
		}
      });
	}
	
	$scope.sendEditGuardian = function(){
		path = address + "api/teacher/edit_adult";
		consolt.log($scope.student.guardian[0]);
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student.guardian[0] = data;
			
			$scope.showEditFather = false;
			$scope.showStudentData = true;
		//	$scope.showStudent = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}

	$scope.sendAddFather = function(){
		path = address + "api/teacher/add_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.father[0]), {
			transformRequest: angular.identity,
			headers: {'token' : $scope.token, 'Content-Type': "application/json"}

		})
			.success(function(data, status, headers, config) {
				path = address + "api/teacher/add_father";
				$http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
					transformRequest: angular.identity,
					headers: {'token' : $scope.token, 'Content-Type': "application/json"}

				})
				$scope.student.father[0] = data;
				$scope.hasMother = true;
				$scope.showAddFather = false;
				$scope.showStudentData = true;
				//	$scope.showStudent = true;

			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}

	$scope.sendAddMother = function(){
		path = address + "api/teacher/add_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.mother[0]), {
			transformRequest: angular.identity,
			headers: {'token' : $scope.token, 'Content-Type': "application/json"}

		})
			.success(function(data, status, headers, config) {
				path = address + "api/teacher/add_mother";
				$http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
					transformRequest: angular.identity,
					headers: {'token' : $scope.token, 'Content-Type': "application/json"}

				})

				$scope.student.mother[0] = data;
				$scope.hasMother = true;
				$scope.showAddMother = false;
				$scope.showStudentData = true;

			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}

	$scope.sendAddGuardian = function(){
		path = address + "api/teacher/add_adult";

		//console.log(student)
		$http.post(path, angular.toJson($scope.student.guardian[0]), {
			transformRequest: angular.identity,
			headers: {'token' : $scope.token, 'Content-Type': "application/json"}

		})
			.success(function(data, status, headers, config) {
				path = address + "api/teacher/add_guardian";
				$http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
					transformRequest: angular.identity,
					headers: {'token' : $scope.token, 'Content-Type': "application/json"}

				})
				$scope.student.guardian[0] = data;
				$scope.showAddGuardian = false;
				$scope.hasGuardian = true;
				$scope.showStudentData = true;
				//	$scope.showStudent = true;

			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}
	
	$scope.sendRoom = function(roomId, roomName, roomLevel, year){	
	$scope.roomLevel = roomLevel;
	$scope.roomName = roomName;
	$scope.roomId = roomId;
	$scope.year = parseInt(year) + 543;
		$scope.showHome = false;
		$scope.hasFather = false;
		$scope.hasMother = false;
		$scope.hasGuardian = false;
	//path ของนักเรียน
	pathStudent = address + 'api/teacher/students?&room_id=' + roomId;
	
        $http.get(pathStudent, {headers: {'token': $scope.token} })
			.success(function(data, status, headers, config) {
				if(data["student_list"] == ""){
				$scope.showFile = true;
				}
			else{
				
				$scope.showStudent = true;
				$scope.showFile = false;
				$scope.showEditStudent = false;
				$scope.showEditFather = false;
				$scope.showEditMother = false;
				$scope.showEditGuardian = false;
				$scope.showStudentData = false;
				$scope.showAddStudent = false;
				$scope.showStdGrade = false;
				$scope.studentData = data["student_list"];
		

				//your code to be executed after 1 second
				    setTimeout(function(){  
				for(var i = 0; i < $scope.studentData.length; i++){
					//console.log("stdData" + i.toString());
					//console.log($scope.studentData[i].delete_status);
					if($scope.studentData[i].delete_status === "1"){
						var str = document.getElementById(i.toString()).innerHTML;
						var result = str.strike();
						document.getElementById(i.toString()).innerHTML = result;
						var str = document.getElementById("stdDataCode" + i.toString()).innerHTML;
						var result = str.strike();
						document.getElementById("stdDataCode" + i.toString()).innerHTML = result;
						var str = document.getElementById("stdDataFName" + i.toString()).innerHTML;
						var result = str.strike();
						document.getElementById("stdDataFName" + i.toString()).innerHTML = result;
						var str = document.getElementById("stdDataLName" + i.toString()).innerHTML;
						var result = str.strike();
						document.getElementById("stdDataLName" + i.toString()).innerHTML = result;
						
					}
				}
				}, 300);
			}
			$scope.showRoom = false;
			console.log(data["student_list"]);
			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
			
			};

	
	$scope.refresh = function(){
    $http.get(pathStudent)
          .success(function(data){
               $scope.users = data;
          })
		  .error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
}
	
	$scope.uploadFile = function(){
		var roomId = $scope.roomId;
        var file = $scope.myFile;
		var r = new FileReader()
        console.log('file is ' );
        console.dir(file);
		//path ที่ส่งไฟล์ csv
        var uploadUrl = address + "api_controller/add_student";
        fileUpload.uploadFileToUrl("14", file, uploadUrl);
    };
	
	$scope.goAddStudent = function(){
		$scope.showStudent = false;
		$scope.showAddStudent = true;
	}
	
	$scope.deleteStudent = function(stdId){
		path = address + "api/teacher/delete_student";
		var idDelete = {'id' : stdId};
		console.log(idDelete);
		$http.post(path, angular.toJson(idDelete), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			$scope.sendRoom($scope.roomId, $scope.roomName, $scope.roomLevel, $scope.year);
			console.log(data.student);

      })
		.error(function(data, status, headers, config) {
        console.log("error");
		if(data.error === 'token expired'){
			window.location.href = 'login.html';
		}
      });
	}

	$scope.viewGradeStudent = function(stdId){

		$scope.showStdGrade = true;
		$scope.showStudent = false;
		$scope.getGrade(stdId);
	}

	$scope.sendEditScore = function (stdId) {
		path = address + "api/teacher/edit_score";
		//console.log($scope.stdRoom);
		$scope.sentDataArr = [];
		var count = 0;
		var isError = false;
		for(var i = 0; i < $scope.stdRoom.length; ++i) {
			for(var j = 0; j < $scope.stdRoom[i].student_subjects.length; ++j) {
				$scope.sentData = {student_id: "", student_subject_id: "", score1: "", score2: ""};
				$scope.sentData.student_id = $scope.stdId;
				$scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
				$scope.sentData.score1 = $scope.stdRoom[i].student_subjects[j].score1;
				$scope.sentData.score2 = $scope.stdRoom[i].student_subjects[j].score2;
				$scope.sentDataArr[count] = $scope.sentData;
				//console.log($scope.sentData);
				$http.post(path, angular.toJson($scope.sentData), {
					transformRequest: angular.identity,
					headers: {'token': $scope.token, 'Content-Type': "application/json"}

				})
					.success(function (data, status, headers, config) {
						console.log(data);
						$scope.stdRoom = data.stdRoom;

					})
					.error(function (data, status, headers, config) {
						console.log("error");
						if (data.error === 'token expired') {
							window.location.href = 'login.html';
						}
						else{
							isError = true;
						}
					});
				count++;
			}
		}
		if(!isError){
			alert("Sucess!");
			$scope.viewGradeStudent(stdId);
		}
		else{
			alert("Error! Please Try Again");
		}
		//console.log($scope.sentDataArr);
	}
	
	$scope.logout = function(){
		path = address + "api/logout";
		$http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			window.location.href = 'login.html';
			
      })
		.error(function(data, status, headers, config) {
      });
	}
	
	function chkDelete(delete_status){
		if(delete_status === 1){
			document.getElementById("stdData").strike();	
		}
	}

	$scope.getGrade = function (stdId) {
		path = address + "api/student/courses?student_id=" + stdId;
		$scope.stdId = stdId;
		$http.get(path , {headers: {'token': $scope.token} })
			.success(function(data){
				console.log(data);
				$scope.stdRoom = data.student_room;
				console.log($scope.stdRoom);
			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}

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

myApp.controller('stdCtrl',  function($scope, $http, fileUpload) {
	$scope.showHome = true;
		$scope.student = JSON.parse(sessionStorage.getItem('stdData'));

	console.log($scope.student);
	$scope.token = localStorage.getItem('token');

	if($scope.student.father.length !== 0){
		$scope.hasFather = true;
	}
	if($scope.student.mother.length !== 0){
		$scope.hasMother = true;
	}
	if($scope.student.guardian.length !== 0){
		$scope.hasGuardian = true;
	}

	$scope.showFile = false;
	$scope.showStudent = false;
	$scope.showEditStudent = false;
	$scope.showEditFather = false;
	$scope.showEditMother = false;
	$scope.showEditGuardian = false;
	$scope.showStudentData = false;
	$scope.showAddStudent = false;
	//console.log($scope.userType);

	$scope.showStudentDataBtn = function() {
		$scope.student = JSON.parse(sessionStorage.getItem('stdData'));
		$scope.showStudentData = true;
		$scope.showStudentGrade = false;
		$scope.showFile = false;
		$scope.showStudent = false;
		$scope.showEditStudent = false;
		$scope.showEditFather = false;
		$scope.showEditMother = false;
		$scope.showEditGuardian = false;
		$scope.showAddStudent = false;
		$scope.showAddFather = false;
		$scope.showAddGuardian = false;
		$scope.showAddMother = false;
		$scope.showStdGrade = false;
		$scope.showHome = false;
	}

	$scope.showStudentGradeBtn = function(){
		$scope.showStdGrade = true;
		$scope.showStudentData = false;
		$scope.showFile = false;
		$scope.showStudent = false;
		$scope.showEditStudent = false;
		$scope.showEditFather = false;
		$scope.showEditMother = false;
		$scope.showEditGuardian = false;
		$scope.showAddStudent = false;
		$scope.showAddFather = false;
		$scope.showAddGuardian = false;
		$scope.showAddMother = false;
		$scope.getGrade();
		$scope.showHome = false;

	}
	
	$scope.editStudent = function(){
		
		$scope.showEditStudent = true;
		$scope.showStudentData = false;
		if($scope.student.prefix === "เด็กชาย"){
			document.getElementById("male").checked = true;
		}
		else if($scope.student.prefix === "เด็กหญิง"){
			document.getElementById("female").checked = true;
		}
		else{
			document.getElementById("male").checked = false;
			document.getElementById("female").checked = false;
		}
		
		
	}
	
	$scope.editFather = function(){		
		$scope.showEditFather = true;
		$scope.showStudentData = false;
	
	}
	
	$scope.editMother = function(){		
		$scope.showEditMother = true;
		$scope.showStudentData = false;
	}
	
	$scope.editGuardian = function(){		
		$scope.showEditGuardian = true;
		$scope.showStudentData = false;
		
		
	}

	$scope.addFather = function(){
		$scope.showAddFather = true;
		$scope.showStudentData = false;

	}

	$scope.addMother = function(){
		$scope.showAddMother = true;
		$scope.showStudentData = false;
	}

	$scope.addGuardian = function(){
		$scope.showAddGuardian = true;
		$scope.showStudentData = false;
	}
	
	$scope.backEditStudent = function(){
		$scope.showStudentData = false;
		$scope.showStudent = true;
	}

	$scope.sendEditStudent = function(){
		path = address + "api/student/edit_profile";
		if(document.getElementById("male").checked){
			$scope.student.prefix = "เด็กชาย";
		}
		else{
			$scope.student.prefix = "เด็กหญิง";
		}

		$scope.std = {};
		$scope.std.id = $scope.student.id;
        $scope.std.ability = $scope.student.ability;
        $scope.std.address = $scope.student.address;
        $scope.std.birthdate = $scope.student.birthdate;
        $scope.std.blood = $scope.student.blood;
        $scope.std.call = $scope.student.call;
        $scope.std.city = $scope.student.city;
        $scope.std.code_number = $scope.student.code_number;
        $scope.std.delete_status = $scope.student.delete_status;
        $scope.std.district = $scope.student.district;
        $scope.std.ethnicity = $scope.student.ethnicity;
        $scope.std.first_name = $scope.student.first_name;
        $scope.std.iden_number = $scope.student.iden_number;
        $scope.std.last_name = $scope.student.last_name;
        $scope.std.nationality = $scope.student.nationality;
        $scope.std.parish = $scope.student.parish;
        $scope.std.prefix = $scope.student.prefix;
        $scope.std.zip_code = $scope.student.zip_code;
        console.log($scope.std);
		$http.post(path, angular.toJson($scope.std), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student = data.student;
			sessionStorage.setItem('stdData', JSON.stringify($scope.student));
			console.log(data.student);
			$scope.showEditStudent = false;
			$scope.showStudentData = true;
		//	$scope.showStudent = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}
	
	$scope.sendEditFather = function(){
		path = address + "api/student/edit_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.father[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student.father[0] = data;
			sessionStorage.setItem('stdData', JSON.stringify($scope.student));
			$scope.showEditFather = false;
			$scope.showStudentData = true;
		//	$scope.showStudent = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}

	$scope.sendEditMother = function(){
		path = address + "api/student/edit_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.mother[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student.mother[0] = data;
			sessionStorage.setItem('stdData', JSON.stringify($scope.student));
			$scope.showEditMother = false;
			$scope.showStudentData = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}
	
	$scope.sendEditGuardian = function(){
		path = address + "api/student/edit_adult";
	
		console.log($scope.student.guardian[0]);
		$http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);

			$scope.student.guardian[0] = data;
			sessionStorage.setItem('stdData', JSON.stringify($scope.student));
			$scope.showEditGuardian = false;
			$scope.showStudentData = true;
		//	$scope.showStudent = true;

      })
		.error(function(data, status, headers, config) {
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
      });
	}

	$scope.sendAddFather = function(){
		path = address + "api/student/add_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.father[0]), {
			transformRequest: angular.identity,
			headers: {'token' : $scope.token, 'Content-Type': "application/json"}

		})
			.success(function(data, status, headers, config) {
				path = address + "api/student/add_father";
				$http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
					transformRequest: angular.identity,
					headers: {'token' : $scope.token, 'Content-Type': "application/json"}

				})
				$scope.student.father[0] = data;
				sessionStorage.setItem('stdData', JSON.stringify($scope.student));
				$scope.hasFather = true;
				$scope.showAddFather = false;
				$scope.showStudentData = true;
				//	$scope.showStudent = true;

			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}

	$scope.sendAddMother = function(){
		path = address + "api/student/add_adult";
		//console.log(student)
		$http.post(path, angular.toJson($scope.student.mother[0]), {
			transformRequest: angular.identity,
			headers: {'token' : $scope.token, 'Content-Type': "application/json"}

		})
			.success(function(data, status, headers, config) {
				path = address + "api/student/add_mother";
				$http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
					transformRequest: angular.identity,
					headers: {'token' : $scope.token, 'Content-Type': "application/json"}

				})

				$scope.student.mother[0] = data;
				sessionStorage.setItem('stdData', JSON.stringify($scope.student));
				$scope.hasMother = true;
				$scope.showAddMother = false;
				$scope.showStudentData = true;

			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}

	$scope.sendAddGuardian = function(){
		path = address + "api/student/add_adult";

		//console.log(student)
		$http.post(path, angular.toJson($scope.student.guardian[0]), {
			transformRequest: angular.identity,
			headers: {'token' : $scope.token, 'Content-Type': "application/json"}

		})
			.success(function(data, status, headers, config) {
				path = address + "api/student/add_guardian";
				$http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
					transformRequest: angular.identity,
					headers: {'token' : $scope.token, 'Content-Type': "application/json"}

				})
				$scope.student.guardian[0] = data;
				sessionStorage.setItem('stdData', JSON.stringify($scope.student));
				$scope.showAddGuardian = false;
				$scope.hasGuardian = true;
				$scope.showStudentData = true;
				//	$scope.showStudent = true;

			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}

	$scope.getGrade = function () {
		path = address + "api/student/courses?student_id=" + $scope.student.id;
		$http.get(path , {headers: {'token': $scope.token} })
			.success(function(data){
				console.log(data);
				$scope.stdRoom = data.student_room;
				console.log($scope.stdRoom);
			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}

	$scope.Grade =  [];

	$scope.collapseGrade = function () {
		var e = document.getElementById("selectGradeLevel").value;
		for(var i = 0; i < $scope.Grade.length; ++i){
			$scope.Grade[i] = false;
		}
		$scope.Grade[e] = true;

	}
	
	$scope.refresh = function(){
    $http.get(pathStudent)
          .success(function(data){
               $scope.users = data;
          })
		  .error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
}
	
	$scope.changeYearPlus = function(year){
		return parseInt(year) + 543;
	}

	$scope.changeYearMinus = function(year){
		return parseInt(year) - 543;
	}
	
	$scope.logout = function(){
		path = address + "api/logout";
		$http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			window.location.href = 'login.html';
			
      })
		.error(function(data, status, headers, config) {
      });
	}

});

myApp.controller('loginCtrl',  function($scope, $http) {
	$scope.apiUser = 'canet';
	$scope.apiPass = 'CanetM2017';
	$scope.user = '';
	$scope.pass = '';


	
	$scope.login = function(){
		path = address + "api/login";
		var authen = {username : $scope.apiUser, password : $scope.apiPass};
		$http.post(path, angular.toJson(authen), {
            transformRequest: angular.identity,
            headers: {'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
				console.log(data);
				if(data.status){
					$scope.token = data.token;
					localStorage.setItem('token', data.token);
					path = address + "api/teacher/login";
		var authen = {username : $scope.user, password : $scope.pass};
		console.log(authen);
		console.log($scope.token);
		$http.post(path, angular.toJson(authen), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
				sessionStorage.setItem('user', "teacher");
					if(data.teacher.status === 'teacher') {
						sessionStorage.setItem('teacher_id', data.teacher.id);
						sessionStorage.setItem('teacher_prefix', data.teacher.prefix);
						sessionStorage.setItem('teacher_first_name', data.teacher.first_name);
						sessionStorage.setItem('teacher_last_name',data.teacher.last_name);
						window.location.href = 'teacher/index.html'
					}
					else {
						sessionStorage.setItem('admin_id', data.teacher.id);
                        sessionStorage.setItem('admin_prefix', data.teacher.prefix);
                        sessionStorage.setItem('admin_first_name', data.teacher.first_name);
                        sessionStorage.setItem('admin_last_name', data.teacher.last_name);
						window.location.href = 'Dashboard.html';
					}
      })
		.error(function(data, status, headers, config) {
			console.log(data.error);
			if(data.error === "not teacher"){
				path = address + "api/teacher/student/login";
					$http.post(path, angular.toJson(authen), {
					transformRequest: angular.identity,
					headers: {'token' : $scope.token, 'Content-Type': "application/json"}
					
					})
					.success(function(data, status, headers, config) {
					console.log(data);
					sessionStorage.setItem('stdData', JSON.stringify(data.student));
						window.location.href = 'DashboardStudent.html';		
					})
					.error(function(data, status, headers, config) {
						console.log(data);
						alert("Connection Error")
					});
			}
			else{
				alert("Username or Password is invalid");
			}
      });
				}
				//console.log(authen);
				else{
					alert("Username or Password is invalid");
				}
      })
		.error(function(data, status, headers, config) {
        console.log(data)
		alert("Connection Error")
      });
		
	}
});

myApp.controller('addTeacherCtrl',  function($scope, $http) {
	var token = localStorage.getItem("token");
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.sendAddTeacher = function() {
		if($scope.teacher.password === $scope.teacher2.password){
			var path = address + "api/teacher/add";
			$scope.teacher.status = document.getElementById("status").value;
			$scope.teacher.resign = true;
			console.log($scope.teacher);
			$http.post(path, angular.toJson($scope.teacher), {
				transformRequest: angular.identity,
				headers: {'token' : token, 'Content-Type': "application/json"}

			})
				.success(function(data, status, headers, config) {
				console.log(data);
					window.location.href = 'Dashboard_Teacher.html'

				})
				.error(function(data, status, headers, config) {
				console.log(data);
					if(data.error === "this teacher is already"){
						alert("this teacher is already has");
					}
					else if(data.error === "this username is already"){
						alert("this username is already has");
					}
				});
		}
		else if($scope.teacher.password !== $scope.teacher2.password){
			alert("Your password doesn't match");
		}
	}
});

myApp.controller('selectRoomCtrl', function ($scope, $http) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.token = localStorage.getItem('token');
	$scope.showButtonManageYearRoom = true;
	pathRoom = address + "api/room/year_room_all";
	$http.get(pathRoom, {headers: {'token': $scope.token} })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.yearRooms = data.year_rooms;
		})
		.error(function(data, status, headers, config) {
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
			else{
				console.log("error");
			}
		});

	$scope.selectCourse = function () {
		var index = document.getElementById("selectCourse").value;
		sessionStorage.setItem('year_room',JSON.stringify($scope.yearRooms[index]));
		$scope.getRooms($scope.yearRooms[index].id)
		// console.log("id year room = "+$scope.yearRooms[index].id);
		$scope.rooms = $scope.yearRooms[index].rooms;
		$scope.showTable = true;
        $scope.showButtonManageYearRoom = false;
	}

	$scope.AddTextInput = function () {
		$scope.addRoom = {};
        $scope.showButtonManageYearRoom = false;
        $scope.showInputTextAddYearRoom = true;
    }
    
    $scope.sendDataAddYearRoom = function () {
		console.log($scope.addRoom);
        $http.post(address + "api/room/create_year_room", angular.toJson($scope.addRoom), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
            	alert("เพิ่มห้องเรียนสำเร็จ");
				refresh();
            })
            .error(function(data, status, headers, config) {
            	console.log(data.error);
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

	$scope.getRooms = function(year_room_id) {
		
		pathGetRooms = address + "api/room/room_ids?id="+year_room_id;
		$http.get(pathGetRooms, {headers: {'token': $scope.token} })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.rooms = data.rooms

		})
		.error(function(data, status, headers, config) {
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
			else{
				console.log("error");
			}
		});
	}

	$scope.selectRoom = function (roomId, index) {
	    $scope.roomSelect = JSON.parse(sessionStorage.getItem('year_room'));
	    sessionStorage.setItem('room_data', JSON.stringify($scope.rooms[index]));
		sessionStorage.setItem('roomId',JSON.stringify(roomId));
		window.location.href = "Dashboard_Viewrooms_Std.html";
	}
})

myApp.controller('viewStdCtrl', function ($scope, $http) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.token = localStorage.getItem('token');
	var roomId = sessionStorage.getItem('roomId');
	$scope.roomData = JSON.parse(sessionStorage.getItem('room_data'));

	pathStudent = address + 'api/teacher/students?room_id=' + roomId;
	$http.get(pathStudent, {headers: {'token': $scope.token} })
		.success(function(data, status, headers, config) {
				$scope.studentData = []
				$scope.student_room = data.student_list
				console.log($scope.student_room)
				for( var i = 0 ; i < data.student_list.length; i++) {
					$scope.studentData.push(data.student_list[i].student)
				}
				setTimeout(function(){
					for(var i = 0; i < $scope.studentData.length; i++){
						//console.log("stdData" + i.toString());
						//console.log($scope.studentData[i].delete_status);
						if($scope.studentData[i].delete_status === "1"){
							var str = document.getElementById(i.toString()).innerHTML;
							var result = str.strike();
							document.getElementById(i.toString()).innerHTML = result;
							var str = document.getElementById("stdDataCode" + i.toString()).innerHTML;
							var result = str.strike();
							document.getElementById("stdDataCode" + i.toString()).innerHTML = result;
							var str = document.getElementById("stdDataFName" + i.toString()).innerHTML;
							var result = str.strike();
							document.getElementById("stdDataFName" + i.toString()).innerHTML = result;
							var str = document.getElementById("stdDataLName" + i.toString()).innerHTML;
							var result = str.strike();
							document.getElementById("stdDataLName" + i.toString()).innerHTML = result;

						}
					}
				}, 300);
			$scope.showRoom = false;
		})
		.error(function(data, status, headers, config) {
			if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
		});

	$scope.viewGradeStudent = function(stdId){
		sessionStorage.setItem('student_id', stdId);
		$scope.getGrade(stdId);
		// ade(stdId);
	}

	$scope.getGrade = function (stdId) {
		path = address + "api/student/courses?student_id=" + stdId;
		$scope.stdId = stdId;
		$http.get(path , {headers: {'token': $scope.token} })
			.success(function(data){
				console.log(data);
				$scope.stdRoom = data.student_room;
				sessionStorage.setItem('stdGrade',JSON.stringify($scope.stdRoom));
				window.location.href = 'Dashboard_Viewrooms_Std_Grade.html';
				console.log($scope.stdRoom);
			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';
				}
			});
	}


	$scope.getDetail = function(student) {
		var newData = JSON.stringify(student);
		sessionStorage.setItem('student', newData);

		window.location.href = 'Dashboard_Viewrooms_Std_Data.html' ;
	}

    $scope.goAddStudent = function(){
        window.location.href = 'AddStudents.html';
    }

    $scope.deleteStudent = function(index) {
    	
    	$scope.room_id = sessionStorage.getItem('roomId');
    	$scope.student_id = $scope.student_room[index].student.id
    	$scope.student_room_id = $scope.student_room[index].id
    	
    	params = { student_id: $scope.student_room_id, room_id: $scope.room_id, student_room_id: $scope.student_room_id }
    	pathSendDataStudentRoomDelete = address + 'api/student/delete_student_room'
    	console.log(params)
    	$http.post(pathSendDataStudentRoomDelete, angular.toJson(params), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			
     	 })
		.error(function(data, status, headers, config) {
	        if(data.error === 'token expired'){
				window.location.href = 'login.html';;
			}
      	});
    }
});


myApp.controller('viewStudentDetail', function ($scope, $http) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');

    student = sessionStorage.getItem('student')

    $scope.hasFather = false
    $scope.hasMother = false
    $scope.hasGuardian = false

    if( student !== null) {
        $scope.student = JSON.parse(student);
        $scope.showStudentData = true
    }

    if($scope.student.father.length !== 0) {
        $scope.hasFather = true
    }
    if($scope.student.mother.length !== 0) {
        $scope.hasMother = true
    }
    if($scope.student.guardian.length !== 0) {
        $scope.hasGuardian = true
    }




    $scope.editStudent = function() {
        window.location.href = 'edit_student.html'
    }

    $scope.sendEditStudent = function() {
        $scope.token = localStorage.getItem('token');
        path = address + "api/student/edit_profile";
        if(document.getElementById("male").checked){
            $scope.student.prefix = "เด็กชาย";
        }
        else{
            $scope.student.prefix = "เด็กหญิง";
        }

        $scope.sentStudent = {id : $scope.student.id, prefix : $scope.student.prefix, code_number : $scope.student.code_number,
            first_name : $scope.student.first_name, last_name : $scope.student.last_name, iden_number : $scope.student.iden_number,
            blood : $scope.student.blood, birthdate : $scope.student.birthdate, address : $scope.student.address,
            district : $scope.student.district, parish : $scope.student.parish, city : $scope.student.city, call : $scope.student.call
            , zip_code : $scope.student.zip_code, ability : $scope.student.ability, ethnicity : $scope.student.ethnicity,
            nationality : $scope.student.nationality};
        // console.log($scope.sentStudent);
        $http.post(path, angular.toJson($scope.sentStudent), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                // console.log(data.student)
                var newData = JSON.stringify(data.student)
                sessionStorage.setItem('student', newData)
                window.location.href = 'details.html'
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

});


myApp.controller('viewStdGradeCtrl', function ($scope, $http) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
	$scope.token = localStorage.getItem('token');
	$scope.Grade = [];
	$scope.stdRoom = JSON.parse(sessionStorage.getItem('stdGrade'));
	console.log($scope.stdRoom);
	for(var i = 0; i < $scope.stdRoom.length; ++i) {
        if ($scope.stdRoom[i].ca === null) {
            $scope.stdRoom[i].ca = '0';
        }
        if ($scope.stdRoom[i].cp === null) {
            $scope.stdRoom[i].cp = '0';
        }
        if ($scope.stdRoom[i].cr === null) {
            $scope.stdRoom[i].cr = '0';
        }
        if ($scope.stdRoom[i].gp === null) {
            $scope.stdRoom[i].gp = '0';
        }
        if ($scope.stdRoom[i].gpa === null) {
            $scope.stdRoom[i].gpa = '0';
        }
    }
	$scope.cr = [];
    for(var i = 0; i < $scope.stdRoom.length; ++i){
		var cr = 0;
		var cp = 0;
		var ca = 0;
		var gp = 0;
		for(var j = 0; j < $scope.stdRoom[i].student_subjects.length; ++j){
            if($scope.stdRoom[i].student_subjects[j].subject.status !== "พัฒนาผู้เรียน"){
                cr += $scope.stdRoom[i].student_subjects[j].subject.credit;
                cp += $scope.stdRoom[i].student_subjects[j].subject.credit;
                ca += $scope.stdRoom[i].student_subjects[j].subject.credit;
                if(!$scope.stdRoom[i].student_subjects[j].grade || $scope.stdRoom[i].student_subjects[j].grade === 0 || $scope.stdRoom[i].student_subjects[j].grade === 'U'){
                    cp -= $scope.stdRoom[i].student_subjects[j].subject.credit;
                }
                if(!$scope.stdRoom[i].student_subjects[j].grade || $scope.stdRoom[i].student_subjects[j].grade === 'U' ||$scope.stdRoom[i].student_subjects[j].grade === 'S'){
                    ca -= $scope.stdRoom[i].student_subjects[j].subject.credit;
                }
                if(!(!$scope.stdRoom[i].student_subjects[j].grade)){
                    gp += $scope.stdRoom[i].student_subjects[j].subject.credit * parseFloat($scope.stdRoom[i].student_subjects[j].grade);
                }
			}
		}
		$scope.stdRoom[i].cr_cal = cr;
        $scope.stdRoom[i].cp_cal = cp;
        $scope.stdRoom[i].ca_cal = ca;
        $scope.stdRoom[i].gp_cal = gp;
        var gpa_cal = parseFloat(gp)/parseFloat(ca);
        $scope.stdRoom[i].gpa_cal = parseFloat(Math.round(gpa_cal * 100) / 100).toFixed(2);
        $scope.stdRoom[i].gpa = parseFloat(Math.round($scope.stdRoom[i].gpa * 100) / 100).toFixed(2);
	}

    console.log($scope.stdRoom);
	$scope.stdId = sessionStorage.getItem('student_id')
	console.log($scope.stdRoom);
	console.log('test log data')

	$scope.collapseGrade = function () {
		var e = document.getElementById("selectGradeLevel").value;
		for(var i = 0; i < $scope.Grade.length; ++i){
			$scope.Grade[i] = false;
		}
		$scope.Grade[e] = true;


	}

	$scope.sendEditScore = function () {
		path = address + "api/teacher/edit_score";
		//console.log($scope.stdRoom);

		$scope.sentDataArr = [];
		var count = 0;
		var isError = false;
		for(var i = 0; i < $scope.stdRoom.length; ++i) {
			for(var j = 0; j < $scope.stdRoom[i].student_subjects.length; ++j) {
				if($scope.stdRoom[i].student_subjects[j].subject.status !== "พัฒนาผู้เรียน"){
                    $scope.sentData = {teacher_id: "", student_id: "", student_subject_id: "", score1: "", score2: ""};
                    $scope.sentData.teacher_id = sessionStorage.getItem('admin_id');
                    $scope.sentData.student_id = $scope.stdId;
                    $scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
                    $scope.sentData.score1 = $scope.stdRoom[i].student_subjects[j].score1;
                    $scope.sentData.score2 = $scope.stdRoom[i].student_subjects[j].score2;
                    $scope.sentDataArr[count] = $scope.sentData;
                    console.log($scope.sentData);
                    $http.post(path, angular.toJson($scope.sentData), {
                        transformRequest: angular.identity,
                        headers: {'token': $scope.token, 'Content-Type': "application/json"}

                    })
                        .success(function (data, status, headers, config) {
                            console.log(data);
                            $scope.stdRoom = data;
                            sessionStorage.setItem('stdGrade', JSON.stringify(data));
                        })
                        .error(function (data, status, headers, config) {
                            console.log("error");
                            if (data.error === 'token expired') {
                                window.location.href = 'login.html';
                            }
                        });
                    count++;
				}
				else {
                    $scope.sentData = {teacher_id: "", student_id: "",score1: 0, score2: 0, student_subject_id: "", grade: ""};
                    $scope.sentData.teacher_id = sessionStorage.getItem('admin_id');
                    $scope.sentData.student_id = $scope.stdId;
                    $scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
                    $scope.sentData.grade = $scope.stdRoom[i].student_subjects[j].grade;
                    console.log($scope.sentData);
                    $http.post(address + "api/teacher/edit_score", angular.toJson($scope.sentData), {
                        transformRequest: angular.identity,
                        headers: {'token': token, 'Content-Type': "application/json"}
                    })
                        .success(function (data, status, headers, config) {
                            console.log(data);
                            $scope.stdRoom = data;
                            sessionStorage.setItem('stdGrade', JSON.stringify(data));
                        })
                        .error(function (data, status, headers, config) {
                            console.log(data);
                            if (data.error === 'token expired') {
                                window.location.href = 'login.html';
                            }
                            else{
                                isError = true;
                            }
                        });
				}
			}
		}
	}

	$scope.viewGradeStudent = function(stdId){
		$scope.showStdGrade = true;
		$scope.showStudent = false;
		$scope.getGrade(stdId);
	}

	$scope.getGrade = function (stdId) {
		path = address + "api/student/courses?student_id=" + stdId;
		$scope.stdId = stdId;
		$http.get(path , {headers: {'token': $scope.token} })
			.success(function(data){
				console.log(data);
				$scope.stdRoom = data.student_room;
				console.log($scope.stdRoom);
			})
			.error(function(data, status, headers, config) {
				if(data.error === 'token expired'){
					window.location.href = 'login.html';;
				}
			});
	}
});

function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}

function refresh() {
     location.reload();
}


