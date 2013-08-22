class ApplicationController < ActionController::Base
  self.append_view_path File.join(File.dirname(__FILE__), "views")
end

class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @queen = Queen.new
    @prince = Prince.new
    @paper = Paper.new
  end
end

class GamesController < ApplicationController
  def show
    @game = User.find(params[:user_id]).games.find(params[:id])
  end
end

class TreesController < ApplicationController
  def show
    @tree = Tree.find params[:id]
  end
end