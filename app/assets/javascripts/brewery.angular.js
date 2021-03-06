var myApp = angular.module('myApp', []);

myApp.controller("BreweriesController", function($scope, $http){
    $http.get('breweries.json').success( function(data, status, headers, config){
        $scope.breweries = data
    })

    $scope.order = 'name';

    $scope.sort_by = function(order){
        $scope.order = order;
        console.log("Order: " + order);
    }

    $scope.searchText = '';

})