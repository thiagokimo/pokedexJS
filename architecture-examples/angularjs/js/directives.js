app.directive('pokemon', function (pokemonService) {
  return {
    restrict: 'E',
    scope: {
      pokemon: "=info"
    },
    templateUrl: 'pokemon-info.html'
  };
});
