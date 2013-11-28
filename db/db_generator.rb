require 'json_builder'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://pokemondb.net/pokedex/game/firered-leafgreen"))

pokemons = doc.css(".infocard-tall")

json = JSONBuilder::Compiler.generate do

  array pokemons do |pokemon|
    name = pokemon.at_css(".ent-name").text
    types = pokemon.css(".aside a").collect do |type|
      type.text
    end

    number pokemon.at_css("small:nth-child(3)").text
    name name
    type types
    sprite "http://img.pokemondb.net/sprites/black-white/normal/"+name.downcase+".png"
  end
end

db = File.open("../js/pokemonDB.js", "w")
db.write("var db = ")
db.write(json);
db.write(";")
db.close
