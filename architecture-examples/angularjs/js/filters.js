app.filter("ignoreEvolution", function() {
  return function (pokemons) {
    var pokemonsWithoutEvolution = [];

    pokemons.forEach(function(pokemon) {
      delete pokemon.evolution;
      pokemonsWithoutEvolution.push(pokemon);
    })

    return pokemonsWithoutEvolution;
  };
});
