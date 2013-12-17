app.service("pokemonService", function () {

  this.getRandomPokemon = function () {
    var randomNumber = Math.floor(Math.random() * db.length + 1);
    return db[randomNumber];
  }

  this.getPokemonList = function () {
    return db;
  };

  this.getPokemonByNumber = function (number) {
    return db[number-1];
  };

  this.getPokemonNameByNumber = function (number) {
    return db[number-1].name;
  };

  this.getEvolutions = function (number) {

    var evolutions = [];
    var pokemons = this.getPokemonByNumber(number).evolution;

    angular.forEach(pokemons, function (pokemon,index) {
      evolutions.push(db[index]);
    });

    return evolutions;
  };
});
