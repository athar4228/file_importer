class PeopleController < ApplicationController

  def index
    @people = Person.page(params[:page])
  end
end
