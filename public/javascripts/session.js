var session_control = angular.module('test', []);

session_control.controller('sessionCtrl', ['$scope', '$http', function ( $scope, $http){

	$scope.sessions = [];

	$scope.load_sessions = function (){
		$http.get('/session/all')
		.success(function ( data, status ){
			$scope.sessions = data;
		})
		.error(function ( err, status ){
			console.log("error", err);
		});
	}
}]);