var myApp = angular.module('student', ['ngRoute']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.controller('index', function($scope, $http)  {
 	var room_id = sessionStorage.getItem('room_id');
 	console.log(room_id)
 	get_student = address + 'api/teacher/students?room_id='+ room_id  
 	get_room = address + 'api/room/?id=' + room_id

 	$http.get(get_room , {headers: {'token': token}})
	.success(function(data, status, header, config) {
		console.log(data)
		$scope.room = data.rooms
	}).error(function(data, status, headers, config) {
		if(data.error === 'token expired'){
			window.location.href = '../../login.html';;
		}
	});

 	$http.get(get_student , {headers: {'token': token}})
	.success(function(data, status, header, config) {
		$scope.students = data.student_list
	}).error(function(data, status, headers, config) {
		if(data.error === 'token expired'){
			window.location.href = '../../login.html';;
		}
	});

	$scope.getDetails = function(student) {
		var newData = JSON.stringify(student)
		sessionStorage.setItem('student', newData)


		window.location.href = 'details.html';
	}
  	
  	$scope.getGrade = function(student_id) {
  		sessionStorage.setItem('student_id', student_id)

  		window.location.href = 'grade.html'
  	}

    $scope.logout = function(){
        path = address + "api/logout";
        $http.post(path, angular.toJson($scope.student), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                window.location.href = 'login.html/../../..';

            })
            .error(function(data, status, headers, config) {
            });
    }

});


myApp.controller('details', function($scope, $http)  {

	student = sessionStorage.getItem('student')
	if( student !== null) {
		$scope.student = JSON.parse(student);
		$scope.showStudentData = true
	}

	console.log($scope.showStudentData)

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
        window.location.href = "add_father.html";

    }

    $scope.addMother = function(){
        window.location.href = "add_mother.html";
    }

    $scope.addGuardian = function(){
        window.location.href = "add_guardian.html";
    }

	$scope.editStudent = function() {
		window.location.href = 'edit_student.html'
	}

    $scope.editFather = function() {
        window.location.href = 'edit_father.html'
		console.log("abc");
    }

    $scope.editMother = function() {
        window.location.href = 'edit_mother.html'
    }

    $scope.editGuardian = function() {
        window.location.href = 'edit_guardian.html'
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


myApp.controller('grade', function($scope, $http)  {
	$scope.Grade = []
	student_id = sessionStorage.getItem('student_id')

	path = address + "api/student/courses?student_id=" + student_id;
	$scope.student_id = student_id;
	$http.get(path , {headers: {'token': token} })
	.success(function(data, status, headers, config){
		$scope.stdRoom = data.student_room;
		console.log(data)
		sessionStorage.setItem('stdGrade',JSON.stringify($scope.stdRoom));
	})
	.error(function(data, status, headers, config) {
		if(data.error === 'token expired'){
			window.location.href = 'login.html';
		}
	});

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
				$scope.sentData = {student_id: "", student_subject_id: "", score1: "", score2: ""};
				$scope.sentData.student_id = $scope.student_id;
				$scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
				$scope.sentData.score1 = $scope.stdRoom[i].student_subjects[j].score1;
				$scope.sentData.score2 = $scope.stdRoom[i].student_subjects[j].score2;
				$scope.sentDataArr[count] = $scope.sentData;
				console.log($scope.sentData);
				$http.post(path, angular.toJson($scope.sentData), {
					transformRequest: angular.identity,
					headers: {'token': token, 'Content-Type': "application/json"}

				})
					.success(function (data, status, headers, config) {
						console.log(data);
						
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
		if(isError !== true){
			alert("Sucess!");
			window.location.href = 'grade.html'
		}
		else{
			alert("Error! Please Try Again");
		}
	}

});

myApp.controller('add_father', function($scope, $http)  {
	$scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendFatherData = function(){
        path = address + "api/student/add_adult";
        console.log($scope.student.father[0])
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
                var newData = JSON.stringify($scope.student);
                sessionStorage.setItem('student', newData);
                window.location.href = "details.html"
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = '../../../login.html';
                }
            });
    }

    $scope.backToStdData = function(){
		window.location.href = "details.html"
    }

});

myApp.controller('add_mother', function($scope, $http)  {
    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendAddMother = function(){
        path = address + "api/student/add_adult";
        console.log($scope.student.mother[0])
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
                var newData = JSON.stringify($scope.student);
                sessionStorage.setItem('student', newData);
                window.location.href = "details.html"
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = '../../../login.html';
                }
            });
    }

    $scope.backToStdData = function(){
        window.location.href = "details.html"
    }

});

myApp.controller('add_guardian', function($scope, $http)  {
    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendAddGuardian = function(){
        path = address + "api/student/add_adult";
        console.log($scope.student.guardian[0])
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
                var newData = JSON.stringify($scope.student);
                sessionStorage.setItem('student', newData);
                window.location.href = "details.html"
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = '../../../login.html';
                }
            });
    }

    $scope.backToStdData = function(){
        window.location.href = "details.html"
    }

});

myApp.controller('edit_father', function($scope, $http)  {
    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
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
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                window.location.href = "details.html"

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.backToStdData = function(){
        window.location.href = "details.html"
    }

});

myApp.controller('edit_mother', function($scope, $http)  {
    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
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
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                window.location.href = "details.html"

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html/../../..';
                }
            });
    }

    $scope.backToStdData = function(){
        window.location.href = "details.html"
    }

});

myApp.controller('edit_guardian', function($scope, $http)  {
    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendEditGuardian = function(){
        path = address + "api/student/edit_adult";
        //console.log(student)
        $http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                console.log(data);
                $scope.student.guardian[0] = data;
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                window.location.href = "details.html"

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }

    $scope.backToStdData = function(){
        window.location.href = "details.html"
    }

});