app.service("pokemonService", function () {

  this.getPokemonList = function () {
    return db;
  };

  var db = [
    {
      "id": 1,
      "identifier": "bulbasaur",
      "type": ["grass", "poison"],
      "picture": "http://img.pokemondb.net/sprites/black-white/normal/bulbasaur.png",
      "evolutions": [2,3]
    },
    {
      "id": 2,
      "identifier": "ivysaur",
      "type": ["grass", "poison"],
      "picture": "http://img.pokemondb.net/sprites/black-white/normal/ivysaur.png",
      "evolutions": [3]
    },
    {
      "id": 3,
      "identifier": "venusaur",
      "type": ["grass", "poison"],
      "picture": "http://img.pokemondb.net/sprites/black-white/normal/venusaur.png"
    },
  ];
});
