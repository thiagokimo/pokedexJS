app.controller("IndexCtrl", function ($scope, pokemonService) {
  $scope.pokemonList = pokemonService.getPokemonList();

  $scope.showPokemon = function(pokemon) {
    $scope.selectedPokemon = pokemon;
  };

  $scope.getRandomPokemon = function () {
    $scope.selectedPokemon = pokemonService.getRandomPokemon();
  };
});

app.controller("PokemonCtrl", function ($scope) {

});
