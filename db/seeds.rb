# db/seeds.rb

reactions = [
  { name: 'like', description: 'Indicates a positive reaction to the content' },
  { name: 'dislike', description: 'Indicates a negative reaction to the content' },
  { name: 'informative', description: "Indidcates that the blog is informative"}

]

reactions.each do |reaction|
  Reaction.find_or_create_by(name: reaction[:name]) do |r|
    r.description = reaction[:description]
  end
end


puts "Reactions seeded successfully!"
