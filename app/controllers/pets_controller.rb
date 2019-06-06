class PetsController < ApplicationController

  # Display what is in the index file from views/pets folders.
  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  # Display a new form to fill out.
  get '/pets/new' do
    erb :'/pets/new'
  end

  # Add and save the information from the form to the database
  post '/pets' do

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
