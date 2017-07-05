class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]


  def index
  end

  def show
  end
end
