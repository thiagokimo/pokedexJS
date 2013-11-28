require 'json_builder'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://pokemondb.net/pokedex/game/firered-leafgreen"))

pokemons = doc.css(".infocard-tall")

json = JSONBuilder::Compiler.generate do

  array pokemons do |pokemon|
    number = pokemon.at_css("small:nth-child(3)").text
    number[0] = '' #removes hash
    name = pokemon.at_css(".ent-name").text
    types = pokemon.css(".aside a").collect do |type|
      type.text
    end

    number number
    name name
    type types

    if number == "029" #Fix male nidoran sprite url
      sprite "http://img.pokemondb.net/sprites/black-white/normal/nidoran-m.png"
    elsif number == "032" #Fix female nidoran sprite url
      sprite "http://img.pokemondb.net/sprites/black-white/normal/nidoran-f.png"
    else
      sprite "http://img.pokemondb.net/sprites/black-white/normal/"+name.downcase+".png"
    end
  end
end

db = File.open("../js/pokemonDB.js", "w")
db.write("var db = ")
db.write(json);
db.write(";")
db.close
