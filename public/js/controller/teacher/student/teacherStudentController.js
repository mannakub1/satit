myApp.controller('teacherStudentIndexController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    var room_id = sessionStorage.getItem('room_id');
 	console.log(room_id);
 	var get_student = address + 'api/teacher/students?room_id='+ room_id;
 	var get_room = address + 'api/room/?id=' + room_id;

 	$http.get(get_room , {headers: {'token': token}})
	.success(function(data, status, header, config) {
		$scope.room = data.rooms;
	}).error(function(data, status, headers, config) {
		static_function.token_expired_check(data.error);
	});

 	$http.get(get_student , {headers: {'token': token}})
	.success(function(data, status, header, config) {
		$scope.students = data.student_list;
	}).error(function(data, status, headers, config) {
		static_function.token_expired_check(data.error);
	});

	$scope.getDetails = function(student) {
		var newData = JSON.stringify(student);
		sessionStorage.setItem('student', newData);
        $location.path('teacher/room/student/data');
	};
  	
  	$scope.getGrade = function(student_id) {
  		sessionStorage.setItem('student_id', student_id);
        $location.path('teacher/room/student/grade');
  	};

});


myApp.controller('teacherStudentDetailController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');

    var student = sessionStorage.getItem('student');
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
        $location.path('teacher/room/student/data/father/add');

    }

    $scope.addMother = function(){
        $location.path('teacher/room/student/data/mother/add');
    }

    $scope.addGuardian = function(){
        $location.path('teacher/room/student/data/guardian/add');
    }

	$scope.editStudent = function() {
        $location.path('teacher/room/student/data/edit');
	}

    $scope.editFather = function() {
        $location.path('teacher/room/student/data/father/edit');

    }

    $scope.editMother = function() {
        $location.path('teacher/room/student/data/mother/edit');
    }

    $scope.editGuardian = function() {
        $location.path('teacher/room/student/data/guardian/edit');
    }

	$scope.sendEditStudent = function() {
		$scope.token = localStorage.getItem('token');
		path = address + "api/student/edit_profile";
		if(document.getElementById("male").checked){
			$scope.student.prefix = "เด็กชาย";
		}
		else if(document.getElementById("female").checked){
			$scope.student.prefix = "เด็กหญิง";
		}

		$scope.sentStudent = {id : $scope.student.id, prefix : $scope.student.prefix, code_number : $scope.student.code_number,
			first_name : $scope.student.first_name, last_name : $scope.student.last_name, iden_number : $scope.student.iden_number,
			blood : $scope.student.blood, birthdate : $scope.student.birthdate, address : $scope.student.address,
			district : $scope.student.district, parish : $scope.student.parish, city : $scope.student.city, call : $scope.student.call
			, zip_code : $scope.student.zip_code, ability : $scope.student.ability, ethnicity : $scope.student.ethnicity,
			nationality : $scope.student.nationality};
		$http.post(path, angular.toJson($scope.sentStudent), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}
			
        })
		.success(function(data, status, headers, config) {
			var newData = JSON.stringify(data.student);
			sessionStorage.setItem('student', newData);
			$location.path('teacher/room/student/data');
      })
		.error(function(data, status, headers, config) {
        static_function.token_expired_check(data.error);
      });
	}

	
});


myApp.controller('teacherStudentGradeController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.Grade = [];

	var student_id = sessionStorage.getItem('student_id')

	var path = address + "api/student/courses?student_id=" + student_id;
	$scope.student_id = student_id;
	$http.get(path , {headers: {'token': token} })
	.success(function(data, status, headers, config){
		$scope.stdRoom = data.student_room;
		sessionStorage.setItem('stdGrade',JSON.stringify($scope.stdRoom));
	})
	.error(function(data, status, headers, config) {
		static_function.token_expired_check(data.error);
	});

	$scope.collapseGrade = function () {
		var e = document.getElementById("selectGradeLevel").value;
		for(var i = 0; i < $scope.Grade.length; ++i){
			$scope.Grade[i] = false;
		}
		$scope.Grade[e] = true;

        for(var i = 0; i <$scope.stdRoom[0].student_subjects.length; ++i){
            if($scope.stdRoom[0].student_subjects[i].subject.status === "พัฒนาผู้เรียน"){
                if($scope.stdRoom[0].student_subjects[i].grade === "S"){
                    $scope.stdRoom[0].student_subjects[i].grade = "ผ่าน";
                }
                else if($scope.stdRoom[0].student_subjects[i].grade === "U"){
                    $scope.stdRoom[0].student_subjects[i].grade = "ไม่ผ่าน";
                }
            }
        }

	}

	$scope.sendEditScore = function () {
		path = address + "api/teacher/edit_score";
		$scope.sentDataArr = [];
		var count = 0;
		var isError = false;
		for(var i = 0; i < $scope.stdRoom.length; ++i) {
			for(var j = 0; j < $scope.stdRoom[i].student_subjects.length; ++j) {
				$scope.sentData = {teacher_id : "",student_id: "", student_subject_id: "", score1: "", score2: ""};
				$scope.sentData.student_id = $scope.student_id;
				$scope.sentData.student_subject_id = $scope.stdRoom[i].student_subjects[j].id;
				$scope.sentData.score1 = $scope.stdRoom[i].student_subjects[j].score1;
				$scope.sentData.score2 = $scope.stdRoom[i].student_subjects[j].score2;
				$scope.sentDataArr[count] = $scope.sentData;
				$scope.sentData.teacher_id = sessionStorage.getItem('teacher_id');
				console.log($scope.sentData);
				$http.post(path, angular.toJson($scope.sentData), {
					transformRequest: angular.identity,
					headers: {'token': token, 'Content-Type': "application/json"}

				})
					.success(function (data, status, headers, config) {
						location.reload();
						
					})
					.error(function (data, status, headers, config) {
						static_function.token_expired_check(data.error);
					});
				count++;
			}
		}
		/*if(isError !== true){
			alert("Success!");
		}
		else{
			alert("Error! Please Try Again");
		}*/
	}

});

myApp.controller('teacherStudentGradeNoCreditController', function ($scope, $http, static_function, $location) {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.showStudent = null;
    var room_id = sessionStorage.getItem('room_id');

    var get_student = address + 'api/teacher/students?room_id='+ room_id;
    var get_room = address + 'api/room/?id=' + room_id;

    $http.get(get_room , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            $scope.room = data.rooms
        }).error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
    });

    $http.get(get_student , {headers: {'token': token}})
        .success(function(data, status, header, config) {
            $scope.student_list = data.student_list;
            $scope.students = [];
            for(var i = 0; i < $scope.student_list.length; ++i){
                $scope.students[i] = {
                    'student_room' : $scope.student_list[i]
                };
            }
            $scope.student_id = $scope.student_list[0].student.id;
            $http.get(address + "api/student/courses?student_id=" + $scope.student_id , {headers: {'token': token} })
                .success(function(data, status, headers, config){
                    $scope.stdRoom = data.student_room;
                    var subjects = $scope.stdRoom[0].student_subjects;
                    var j = 0;
                    $scope.subject_no_credit = [];
                    for(var i = 0; i < subjects.length; ++i){
                        if(subjects[i].subject.status === "พัฒนาผู้เรียน"){
                            $scope.subject_no_credit[j] = subjects[i];
                            j++;
                        }
                    }
                })
                .error(function(data, status, headers, config) {
                    static_function.token_expired_check(data.error);
                });
        }).error(function(data, status, headers, config) {
            static_function.token_expired_check(data.error);
    });


    $scope.selectSubject = function () {
        var index = document.getElementById('select_subject').value;
        var subject_id = $scope.subject_no_credit[index].subject.id;
        var get_students = address + 'api/student/student_subject?room_id='+ room_id + '&subject_id=' + subject_id
        $http.get(get_students , {headers: {'token': token}})
            .success(function(data, status, header, config) {
                $scope.students = data.student_list;
                $scope.showStudent = true;
            }).error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
        });
    };


    $scope.changeSubject = function () {
        var get_students = address + 'api/student/student_subject?room_id='+ room_id + '&subject_id=' + subject_id;

        $http.get(get_students , {headers: {'token': token}})
            .success(function(data, status, header, config) {
                $scope.students = data.student_list
            }).error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
        });
    }
    
    $scope.sendEditGrade = function () {
        $scope.sentDataArr = [];
        var count = 0;
        var isError = false;
            for(var j = 0; j < $scope.students.length; ++j) {
                $scope.sentData = {teacher_id: "", student_id: "",score1: 0, score2: 0, student_subject_id: "", grade: ""};
                $scope.sentData.student_id = $scope.students[j].student_room.student.id;
                var index = document.getElementById('select_subject').value;
                $scope.sentData.student_subject_id = $scope.students[j].id;
                $scope.sentData.grade = $scope.students[j].grade;
                $scope.sentData.teacher_id = sessionStorage.getItem('teacher_id');
                $http.post(address + "api/teacher/edit_score", angular.toJson($scope.sentData), {
                    transformRequest: angular.identity,
                    headers: {'token': token, 'Content-Type': "application/json"}
                })
                    .success(function (data, status, headers, config) {
                        location.reload();
                    })
                    .error(function (data, status, headers, config) {
                        static_function.token_expired_check(data.error);
                    });
            }
    }

});

myApp.controller('teacherStudentAddFatherController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
	$scope.token = localStorage.getItem("token");
	var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');

    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendAddFather = function(){
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
                $location.path('teacher/room/student/data');
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.backToStdData = function(){
		$location.path('teacher/room/student/data');
    }

});

myApp.controller('teacherStudentAddMotherController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    $scope.token = localStorage.getItem("token");
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');

    student = sessionStorage.getItem('student')
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendAddMother = function(){
        var path = address + "api/student/add_adult";
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
                $location.path('teacher/room/student/data')
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.backToStdData = function(){
        $location.path('teacher/room/student/data')
    }

});

myApp.controller('teacherStudentAddGuardianController', function($scope, $http, static_function, $location){
$scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
$scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
$scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');

    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student');
    if( student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendAddGuardian = function(){
        path = address + "api/student/add_adult";
        console.log($scope.student.guardian[0]);
        $http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                var path = address + "api/student/add_guardian";

                $http.post(path, angular.toJson({id : $scope.student.id, adult_id : data.id} ), {
                    transformRequest: angular.identity,
                    headers: {'token' : $scope.token, 'Content-Type': "application/json"}

                })
                    .success(function (data) {
                        $scope.student.guardian[0] = data;
                        var newData = JSON.stringify($scope.student);
                        sessionStorage.setItem('student', newData);
                        $location.path('teacher/room/student/data')
                    })

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.backToStdData = function(){
        $location.path('teacher/room/student/data')
    }

});

myApp.controller('teacherStudentEditFatherController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');

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
                $scope.student.father[0] = data;
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                $location.path('teacher/room/student/data');

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.backToStdData = function(){
        $location.path('teacher/room/student/data');
    }

});

myApp.controller('teacherStudentEditMotherController', function($scope, $http)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');

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
                $scope.student.mother[0] = data;
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                $location.path('teacher/room/student/data');

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.backToStdData = function(){
        $location.path('teacher/room/student/data');
    }

});

myApp.controller('teacherStudentEditGuardianController', function($scope, $http, static_function, $location)  {
    $scope.teacher_first_name = sessionStorage.getItem('teacher_first_name');
    $scope.teacher_last_name = sessionStorage.getItem('teacher_last_name');
    $scope.teacher_prefix = sessionStorage.getItem('teacher_prefix');
    $scope.token = localStorage.getItem("token");
    var student = sessionStorage.getItem('student');
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');

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
                $scope.student.guardian[0] = data;
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                $location.path('teacher/room/student/data');

            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error);
            });
    }

    $scope.backToStdData = function(){
    }
    $location.path('teacher/room/student/data');

});