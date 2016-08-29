'use strict';


// Declare app level module which depends on filters, and services
angular.module('myApp', [
  'ngRoute',
  'myApp.filters',
  'myApp.services',
  'myApp.directives',
  'myApp.controllers'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider
      .when('/',
          {templateUrl: '../view/home/antrian.html',
            controller: 'AntrianController'
          })
      .when('/step2',
          {
            templateUrl :'../view/home/menu-utama.html',
            controller : 'Step2Controller'
          })
      .when('/operator/login',{
        redirectTo:'/operator.html'
      })
      .otherwise({redirectTo:'/'});
}]);


