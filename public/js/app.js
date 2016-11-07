var myApp = angular.module('myApp', ['ngRoute']);
// var address = "http://172.27.170.117:3000/";
var address = "http://localhost:3000/";
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

myApp.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(roomId,file, uploadUrl){
		//path ที่จะส่งเลขห้องรอบ 2
		var roomPath = address + "api_controller/student/add_room";
		var room = JSON.stringify({room_id:roomId});
        var fd = new FormData();
        fd.append('csv', file);
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
			
        })
        .success(function(){
		$http.post(roomPath, room)
		.success(function(data, status, headers, config) {
        // this callback will be called asynchronously
        // when the response is available

      })
		.error(function(data, status, headers, config) {
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
	})
	.error(function(data, status, headers, config) {
		console.log('error')
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
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
        fileUpload.uploadFileToUrl(roomId, file, uploadUrl);
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

		$scope.student = JSON.parse(sessionStorage.getItem('stdData'));

	console.log(localStorage.getItem('token'));
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
		path = address + "api/teacher/edit_profile";
		if(document.getElementById("male").checked){
			$scope.student.prefix = "เด็กชาย";
		}
		else{
			$scope.student.prefix = "เด็กหญิง";
		}
		//console.log(student)
		$http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			console.log(data);
			$scope.student = data.student;
			sessionStorage.setItem('stdData', $scope.student);
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
		path = address + "api/teacher/edit_adult";
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
		path = address + "api/teacher/edit_adult";
	
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
	$scope.apiPass = '1234';
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
					window.location.href = 'Dashboard.html';
	
      })
		.error(function(data, status, headers, config) {
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
        console.log("error")
		alert("Connection Error")
      });
		
	}
});

myApp.controller('addTeacherCtrl',  function($scope, $http) {
	var token = localStorage.getItem("token");
	$scope.sendAddTeacher = function() {
		if($scope.teacher.password === $scope.teacher2.password){
			var path = address + "api/teacher/add";
			$scope.teacher.status = document.getElementById("status").value;
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


