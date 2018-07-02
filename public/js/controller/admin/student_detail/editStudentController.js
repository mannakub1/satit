
myApp.controller('adminEditStudentController', function($scope, $http, Upload, static_function, $location)  {
    var address = sessionStorage.getItem('address');
    var token = localStorage.getItem('token');
    $scope.address = sessionStorage.getItem('address');
    $scope.admin_first_name = sessionStorage.getItem('admin_first_name');
    $scope.admin_last_name = sessionStorage.getItem('admin_last_name');
    $scope.admin_prefix = sessionStorage.getItem('admin_prefix');
    var student = sessionStorage.getItem('student');
    if( student !== null) {
        $scope.student = JSON.parse(student);
        $scope.showStudentData = true;
        if($scope.student.prefix === "เด็กชาย"){
            document.getElementById("male").checked = true;
        }
        else if($scope.student.prefix === "เด็กหญิง"){
            document.getElementById("female").checked = true;
        }
    }


    $scope.uploadImage = function(file){
        $scope.token = localStorage.getItem('token');
        Upload.upload({
            url: address + "api/student/update_image",
            method: 'POST',
            data: {image: file, id : $scope.student.id},
            headers: {'token' : $scope.token},
        }).then(function (resp) {
            alert("เพิ่มรูปภาพสำเร็จ");
            /*var newData = JSON.stringify(resp.data.student)
            sessionStorage.setItem('student', newData)
            setTimeout(function(){
                window.location.href = "Dashboard_Viewrooms_Std_Data.html"
            }, 300);*/

        }, function (resp) {
            static_function.token_expired_check(resp.data.error);
        }, function (evt) {
        });
    }

    $scope.sendEditStudent = function(file) {
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
                var newData = JSON.stringify(data.student)
                sessionStorage.setItem('student', newData)
                setTimeout(function(){
                    $location.path("/admin/viewroom/student/data");
                }, 300);
            })
            .error(function(data, status, headers, config) {
                static_function.token_expired_check(data.error());
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


});