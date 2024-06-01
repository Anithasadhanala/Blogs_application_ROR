# db/seeds.rb

reactions = [
  { name: 'like', description: 'Indicates a positive reaction to the content' },
  { name: 'dislike', description: 'Indicates a negative reaction to the content' },
  { name: 'flag', description: 'Indicates that the content is inappropriate or needs review' }
]

reactions.each do |reaction|
  Reaction.find_or_create_by(name: reaction[:name]) do |r|
    r.description = reaction[:description]
  end
end


puts "Reactions seeded successfully!"
