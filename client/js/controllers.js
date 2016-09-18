'use strict';

/* Controllers */
var base_url="http://localhost:8080/ProjectAntrian/API/public/"
angular.module('myApp.controllers', ['ngCookies']).
  controller('AntrianController',function($scope,$http,$cookieStore,$location){
    $scope.ambilAntrian=function(){
      $http({
            method : "POST",
            url : "http://localhost:8080/ProjectAntrian/API/public/api/v1/validasimhs",
            data:{
              'no_rfid': $scope.no_rfid
            }
      }).success(function(data,status){
          if(data.status==200){
             $cookieStore.put('norfid',data.result[0].no_rfid);
             //console.log($cookieStore.get('norfid'));
              $location.path('/step2');
              //document.location.href="#/step2";
          }else{
              swal({
                  title: "Uppss",
                  text: "MOHON MAAF ANTA TIDAK TERDAFTAR SEBAGAI MAHASISWA UNIKOM",
                  type: "error",
                  confirmButtonText: "OKE"
              });
          }
      }).error(function (data,staus) {
        document.write(data);
      });
    }
  })
  .controller('Step2Controller', function($scope,$http,$cookieStore,$location) {
      $scope.loket=false;
      $scope.ambil = true;
      $scope.pilihlayanan = function($id){
          $scope.ambil = false;
          $scope.loket=true;
          $scope.back = true;
          $http.get('http://localhost:8080/ProjectAntrian/API/public/api/v1/loket/'+$id).success(function(data,status){
              $scope.loket=data.result;
          });
      };

      $scope.kembali=function(){
          $scope.loket=false;
          $scope.ambil = true;
          $scope.back = false;
      };
      $scope.pilihloket=function($id){
          $scope.back = true;
          $http({
            method : 'POST',
              url : 'http://localhost:8080/ProjectAntrian/API/public/api/v1/antrian',
              data:{
                'no_rfid' : $cookieStore.get('norfid')
              }
          }).success(function(data,status){
              $cookieStore.remove('rfid');
              swal({
                  title: "NOMOR ANTRIAN",
                  text: "NOMOR ANTRIAN ANDA : "+data.result,
                  type: "info",
                  confirmButtonText: "OKE"
              },function(){

              });

          }).error(function(data,status){
              document.write(data);
          });
          /*
          */
          $location.path('/');
      }
      $http.get('http://localhost:8080/ProjectAntrian/API/public/api/v1/pelayanan').success(function(data,status){
           $scope.layanan=data.result;
    });
  });

