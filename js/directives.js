app.directive('pokemon', function () {
  return {
    restrict: 'E',
    scope: {
      pokemon: "=info"
    },
    template: '<img src="{{pokemon.picture}}" alt=""><h1>{{pokemon.id}}</h1><h1>{{pokemon.identifier}}</h1><h1>{{pokemon.type}}</h1>'
  };
});
