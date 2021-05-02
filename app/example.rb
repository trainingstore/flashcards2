country_list = [
  [ "Germany", 81831000 ],
  [ "France", 65447374 ],
  [ "Belgium", 10839905 ],
  [ "Netherlands", 16680000 ]
]

country_list.each do |name, population|
  # Country.create( name: name, population: population )
  puts "name = #{name}"
  puts "population = #{population}"
end

country_list.each do |a|
  # Country.create( name: name, population: population )
  puts "a = #{a}"
end
