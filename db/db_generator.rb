require 'json_builder'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://pokemondb.net/pokedex/game/firered-leafgreen"))

pokemons = doc.css(".infocard-tall")

def remove_hash_from(string)
  string[0] = ''
  string
end

def get_evolution_of(pokemon)
  pokemon_url = pokemon.at_css(".ent-name")[:href]
  pokemon_page = Nokogiri::HTML(open("http://pokemondb.net"+pokemon_url))

  evolutions_chart = pokemon_page.at_css(".infocard-evo-list")

  if evolutions_chart
    evo_numbers = evolutions_chart.css("small") - evolutions_chart.css(".aside")

    evolutions = evo_numbers.collect do |content|
      raw_number = remove_hash_from(content.text)
      number = raw_number.to_i

      number
    end

    evolutions
  else
    []
  end


end

json = JSONBuilder::Compiler.generate do

  array pokemons do |pokemon|
    number = (remove_hash_from(pokemon.at_css("small:nth-child(3)").text))
    name = pokemon.at_css(".ent-name").text
    types = pokemon.css(".aside a").collect do |type|
      type.text
    end

    puts "#{number} - #{name}"

    number number
    name name
    type types
    evolution get_evolution_of(pokemon)

    if number == "029" #Fix male nidoran sprite url
      sprite "http://img.pokemondb.net/sprites/black-white/normal/nidoran-m.png"
    elsif number == "032" #Fix female nidoran sprite url
      sprite "http://img.pokemondb.net/sprites/black-white/normal/nidoran-f.png"
    elsif number == "083" #Fix farfetch'd sprite url
      sprite "http://img.pokemondb.net/sprites/black-white/normal/farfetchd.png"
    elsif number == "122" #Fix Mr. Mime sprite url
      sprite "http://img.pokemondb.net/sprites/black-white/normal/mr-mime.png"
    else
      sprite "http://img.pokemondb.net/sprites/black-white/normal/"+name.downcase+".png"
    end
  end
end

db = File.open("pokemonDB.js", "w")
db.write("var db = ")
db.write(json);
db.write(";")
db.close
