class OwnersController < ApplicationController

  # Display what is in the index file from views/owners folders.
  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index'
  end

  # Display a new form to fill out.
  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

  # Add the information from the form to the database
  post '/owners' do
    @owner = Owner.create(params[:owner])
    # binding.pry
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    @owner.save
    redirect to "owners/#{@owner.id}"
  end

  # Display a form to modify a previous Record
  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  # Go the get the previous information from the database to get it modify
  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  post '/owners/:id' do
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect to "owners/#{@owner.id}"
  end
end
