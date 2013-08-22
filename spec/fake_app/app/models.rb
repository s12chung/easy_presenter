class User < ActiveRecord::Base
  has_many :games
end
class Game < ActiveRecord::Base
  belongs_to :user
end
class Tree < ActiveRecord::Base
end