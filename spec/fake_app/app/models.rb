require 'easy_presenter'

class User < ActiveRecord::Base
  include EasyPresenter
end
class Tree < ActiveRecord::Base
  include EasyPresenter
end