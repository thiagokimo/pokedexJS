var app = angular.module("pokedexjs",[]);

app.controller("IndexCtrl", function ($scope, pokemonService) {
  $scope.pokemonList = pokemonService.getPokemonList();

  $scope.showPokemon = function(pokemon) {

  }
});
