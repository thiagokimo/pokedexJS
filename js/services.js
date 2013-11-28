app.service("pokemonService", function () {

  this.getPokemonList = function () {
    return db;
  };

  var db = [
    {
      "id": 1,
      "identifier": "bulbasaur"
    },
    {
      "id": 2,
      "identifier": "ivysaur"
    }
  ];
});
