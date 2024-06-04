# config/initializers/grape.rb
Dir[Rails.root.join('app/api/*.rb')].each { |f| require f }
