app.service("pokemonService", function () {

  this.getPokemonList = function () {
    return db;
  };

  var db = [
    {
      "id": 1,
      "identifier": "bulbasaur",
      "type": ["grass", "poison"],
      "picture": "http://img.pokemondb.net/artwork/bulbasaur.jpg"
    },
    {
      "id": 2,
      "identifier": "ivysaur",
      "type": ["grass", "poison"],
      "picture": "http://img.pokemondb.net/artwork/ivysaur.jpg"
    }
  ];
});
