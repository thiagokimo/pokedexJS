app.directive('pokemon', function () {
  return {
    restrict: 'E',
    scope: {
      pokemon: "=info"
    },
    templateUrl: '../pokemon-info.html'
  };
});
