class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  #DSL (Domain Specific Language) => sinatra

  get "/" do
    "Hello World"
  end

end
