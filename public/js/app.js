var myApp = angular.module('myApp', ['ngRoute']);
var address = "http://172.27.162.241:3000/"
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
	$scope.token = localStorage.getItem('token');
	$scope.student;
	$scope.roomLevel;
	$scope.roomName;
	$scope.roomId = -1;
	$scope.year;
	
	$scope.showRoom = true;
	$scope.showFile = false;
	$scope.showStudent = false;
	$scope.showEditStudent = false;
	$scope.showStudentData = false;
	$scope.showAddStudent = false;
	
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
	
	

	
	$scope.sendStudentData = function(stdCode, stdPrefix, stdFirstName, stdLastName, stdId, stdIden, stdBlood, stdBirth, stdAddr, stdDistrict, stdParish, stdCity, stdCall, stdZip, stdAbility, stdEthnicity, stdNationality){
		$scope.student = {id : stdId, code_number : stdCode, prefix : stdPrefix, first_name : stdFirstName, last_name : stdLastName, iden_number : stdIden, blood : stdBlood,
						  birthdate : stdBirth, address : stdAddr, district : stdDistrict, parish : stdParish, city : stdCity, call : stdCall, zip_code : stdZip, ability : stdAbility, ethnicity : stdEthnicity, nationality : stdNationality};
		$scope.showStudent = false;
		$scope.showStudentData = true;
		var year = new Date(stdBirth);
		$scope.stdYear = year.getFullYear() + 543 ;
		$scope.nowDate = new Date();
		var timeDiff = Math.abs($scope.nowDate.getTime() - year.getTime());
		var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
		$scope.age = Math.trunc((diffDays)/365);
		
	}
	
	
	$scope.editStudent = function(){
		for(var i = 0; i < $scope.studentData.length; i++){
					//console.log("stdData" + i.toString());
					//console.log($scope.studentData[i].delete_status);
					if($scope.studentData[i].delete_status === "1"){
						console.log(document.getElementById("stdDataCode" + i.toString()).id);
						
					}
				}
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
	
	$scope.backEditStudent = function(){
		$scope.showStudentData = false;
		$scope.showStudent = true;
	}
	
	$scope.sendAddStudent = function(){
		path = address + "api/teacher/add_student";
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
				$scope.showEditStudent = false;
				$scope.showStudentData = false;
				$scope.studentData = data["student_list"];
		
				
			

			
				//your code to be executed after 1 second
				    setTimeout(function(){  
				for(var i = 0; i < $scope.studentData.length; i++){
					//console.log("stdData" + i.toString());
					//console.log($scope.studentData[i].delete_status);
					if($scope.studentData[i].delete_status === "1"){
						var str = document.getElementById("stdDataCode" + i.toString()).innerHTML;
						var result = str.strike();
						document.getElementById("stdDataCode" + i.toString()).innerHTML = result;
						console.log(document.getElementById("stdDataCode" + i.toString()).innerHTML);
						
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

myApp.controller('loginCtrl',  function($scope, $http) {
	$scope.user = '';
	$scope.pass = '';


	
	$scope.login = function(){
		path = address + "api/login";
		var authen = {username : $scope.user, password : $scope.pass};
		$http.post(path, angular.toJson(authen), {
            transformRequest: angular.identity,
            headers: {'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
				console.log(data);
				if(data.status){
					localStorage.setItem('token', data.token);
					window.location.href = 'Dashboard.html';
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


