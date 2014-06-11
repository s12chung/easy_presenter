class User < ActiveRecord::Base
  has_many :games
end
class Game < ActiveRecord::Base
  belongs_to :user
end
class Tree < ActiveRecord::Base
end

class Queen
  include EasyPresenter
end
class Prince < Queen
end
class Paper
  include EasyPresenter::Base
  def link
    link_to "base"
  end
end