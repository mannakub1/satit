var myApp = angular.module('edit_student', ['ngRoute', 'ngFileUpload']);
var address = sessionStorage.getItem('address');
var token = localStorage.getItem('token');

myApp.directive("fileread", [function () {
    return {
        scope: {
            fileread: "="
        },
        link: function (scope, element, attributes) {
            element.bind("change", function (changeEvent) {
                var reader = new FileReader();
                reader.onload = function (loadEvent) {
                    scope.$apply(function () {
                        scope.fileread = loadEvent.target.result;
                    });
                }
                reader.readAsDataURL(changeEvent.target.files[0]);
            });
        }
    }
}]);


myApp.controller('details', ['$scope', '$http', 'Upload', function($scope, $http, Upload)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    student = sessionStorage.getItem('student');
    if( student !== null) {
        $scope.student = JSON.parse(student);
        $scope.showStudentData = true;
        if($scope.student.prefix === "เด็กชาย"){
            document.getElementById("male").checked = true;
        }
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
        window.location.href = "Dashboard_Viewrooms_Std_AddFather.html";

    }

    $scope.addMother = function(){
        window.location.href = "Dashboard_Viewrooms_Std_AddMother.html";
    }

    $scope.addGuardian = function(){
        window.location.href = "Dashboard_Viewrooms_Std_AddGuardian.html";
    }

    $scope.editStudent = function() {
        window.location.href = 'Dashboard_Viewrooms_Std_EditStudent.html';
    }

    $scope.editFather = function() {
        window.location.href = 'Dashboard_Viewrooms_Std_EditFather.html';
    }

    $scope.editMother = function() {
        window.location.href = 'Dashboard_Viewrooms_Std_EditMother.html'
    }

    $scope.editGuardian = function() {
        window.location.href = 'Dashboard_Viewrooms_Std_EditGuardian.html'
    }

    $scope.uploadImage = function(file){
        $scope.token = localStorage.getItem('token');
        Upload.upload({
            url: address + "api/student/update_image",
            method: 'POST',
            data: {image: file, id : $scope.student.id},
            headers: {'token' : $scope.token},
        }).then(function (resp) {
            console.log('Success ' + resp.config.data.file.name + 'uploaded. Response: ' + resp.data);
            console.log(resp);
            /*var newData = JSON.stringify(resp.data.student)
            sessionStorage.setItem('student', newData)
            setTimeout(function(){
                window.location.href = "Dashboard_Viewrooms_Std_Data.html"
            }, 300);*/

        }, function (resp) {
            console.log('Error status: ' + resp.status);
            if(resp.data.error === 'token expired'){
                window.location.href = 'login.html';;
            }
        }, function (evt) {
        });
    }

    $scope.sendEditStudent = function(file) {
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

        $http.post(path, angular.toJson($scope.sentStudent), {
            transformRequest: angular.identity,
            headers: {'token' : $scope.token, 'Content-Type': "application/json"}

        })
            .success(function(data, status, headers, config) {
                 console.log(data.student)
                var newData = JSON.stringify(data.student)
                sessionStorage.setItem('student', newData)
                setTimeout(function(){
                    //window.location.href = "Dashboard_Viewrooms_Std_Data.html"
                }, 300);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
                console.log($scope.sentStudent);
            });
    }

    $('input[type=file]').change(function () {
        console.log(document.getElementById("imgInp").value);
    });

    function readURL(input) {

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#blah').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInp").change(function() {
        readURL(this);
    });

    function dataURItoBlob(dataURI) {

        // convert base64/URLEncoded data component to raw binary data held in a string
        var byteString;
        if (dataURI.split(',')[0].indexOf('base64') >= 0)
            byteString = atob(dataURI.split(',')[1]);
        else
            byteString = unescape(dataURI.split(',')[1]);

        // separate out the mime component
        var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

        // write the bytes of the string to a typed array
        var ia = new Uint8Array(byteString.length);
        for (var i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }

        return new Blob([ia], {type:mimeString});
    }


}]);



myApp.controller('add_father', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem("token");
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
                setTimeout(function(){
                    window.location.href = "Dashboard_Viewrooms_Std_Data.html"
                }, 300);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';
                }
            });
    }


});

myApp.controller('add_mother', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
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
                setTimeout(function(){
                    window.location.href = "Dashboard_Viewrooms_Std_Data.html"
                }, 300);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';
                }
            });
    }

    $scope.backToStdData = function(){
        window.location.href = "details.html"
    }

});

myApp.controller('add_guardian', function($scope, $http){
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
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
                setTimeout(function(){
                    window.location.href = "Dashboard_Viewrooms_Std_Data.html"
                }, 300);
            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';
                }
            });
    }


});

myApp.controller('edit_father', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
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
                setTimeout(function(){
                    window.location.href = "Dashboard_Viewrooms_Std_Data.html"
                }, 300);

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';;
                }
            });
    }


});

myApp.controller('edit_mother', function($scope, $http)  {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
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
                setTimeout(function(){
                    window.location.href = "Dashboard_Viewrooms_Std_Data.html"
                }, 300);

            })
            .error(function(data, status, headers, config) {
                if(data.error === 'token expired'){
                    window.location.href = 'login.html';
                }
            });
    }



});

myApp.controller('edit_guardian', function($scope, $http) {
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    $scope.token = localStorage.getItem("token");
    student = sessionStorage.getItem('student')
    if (student !== null) {
        $scope.student = JSON.parse(student);
    }

    $scope.sendEditGuardian = function () {
        path = address + "api/student/edit_adult";
        //console.log(student)
        $http.post(path, angular.toJson($scope.student.guardian[0]), {
            transformRequest: angular.identity,
            headers: {'token': $scope.token, 'Content-Type': "application/json"}

        })
            .success(function (data, status, headers, config) {
                console.log(data);
                $scope.student.guardian[0] = data;
                sessionStorage.setItem('student', JSON.stringify($scope.student));
                setTimeout(function(){
                    window.location.href = "Dashboard_Viewrooms_Std_Data.html"
                }, 300);

            })
            .error(function (data, status, headers, config) {
                if (data.error === 'token expired') {
                    window.location.href = 'login.html';
                    ;
                }
            });
    }

});