var myApp = angular.module('myApp', ['ngRoute']);
var address = "http://172.27.177.111:3000/"
var path;
var pathStudent;
var pathRoom;
var hasStudent;


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
		var roomPath = address + "api_controller/student/add_room"
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
	
	$scope.student;
	$scope.roomLevel;
	$scope.roomName;
	$scope.roomId = -1;
	$scope.year;
	
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
        if(data.error === 'token expired'){
			window.location.href = 'login.html';;
		}
    });
	
	

	
	$scope.sendStudentData = function(stdCode, stdPrefix, stdFirstName, stdLastName, stdId, stdIden, stdBlood, stdBirth, stdAddr, stdDistrict, stdParish, stdCity, stdCall, stdZip, stdAbility, stdEthnicity, stdNationality, stdIndex){
		$scope.student = $scope.studentData[stdIndex];
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
		
		if($scope.guardian.prefix === "เด็กชาย"){
			document.getElementById("male").checked = true;
		}
		else if($scope.guardian.prefix === "เด็กหญิง"){
			document.getElementById("female").checked = true;
		}
		else{
			document.getElementById("male").checked = false;
			document.getElementById("female").checked = false;
		}
	}
	
	$scope.backEditStudent = function(){
		$scope.showStudentData = false;
		$scope.showStudent = true;
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
		//console.log(student)
		$http.post(path, angular.toJson($scope.student), {
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
	
	$scope.sendRoom = function(roomId, roomName, roomLevel, year){	
	$scope.roomLevel = roomLevel;
	$scope.roomName = roomName;
	$scope.roomId = roomId;
	$scope.year = parseInt(year) + 543;
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
	
});




myApp.controller('stdCtrl',  function($scope, $http, fileUpload) {
	$scope.student = JSON.parse(sessionStorage.getItem('stdData'));
	console.log(localStorage.getItem('token'));
	$scope.token = localStorage.getItem('token');
	
	$scope.student;
	$scope.year;
	
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


	$scope.showStudentDataBtn = function(){
		$scope.showStudentData = true;
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
		
		if($scope.guardian.prefix === "เด็กชาย"){
			document.getElementById("male").checked = true;
		}
		else if($scope.guardian.prefix === "เด็กหญิง"){
			document.getElementById("female").checked = true;
		}
		else{
			document.getElementById("male").checked = false;
			document.getElementById("female").checked = false;
		}
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


