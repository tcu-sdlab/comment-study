class TweetsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end
     
  def create
    @tweet = Tweet.new
    @tweet.username = current_user.username
    @tweet.content = params[:tweet][:content]
    @tweet.save
    @no_space_content = @tweet.content.gsub(" ", "")
    @no_space_content = @tweet.content.gsub("　", "")
    #filtering
    filepath = "/config/language_filters/list.yaml"
    #filepath.force_encoding('UTF-8') filepath = filepath.encode('UTF-8', 'UTF-8')
    filter = LanguageFilter::Filter.new matchlist: File.join(Rails.root,filepath), replacement: :stars
    if filter.match?(@no_space_content)
      @black = Black.new
      @black.username = @tweet.username
      @black.content = @tweet.content
      @black.save
      redirect_to '/tweets/fail'
    else
      @white = White.new
      @white.username = @tweet.username
      @white.content = @tweet.content
      @white.save
      redirect_to '/tweets/success'
    end
  end
end