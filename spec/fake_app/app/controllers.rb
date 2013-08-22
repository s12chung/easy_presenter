class ApplicationController < ActionController::Base
  self.append_view_path File.join(File.dirname(__FILE__), "views")
end

class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find params[:id]
  end
end

class TreesController < ApplicationController
  def show
    @tree = Tree.find params[:id]
  end
end