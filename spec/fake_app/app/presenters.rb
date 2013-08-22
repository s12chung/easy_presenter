module UserPresenter
  def full_name
    "#{first_name} #{last_name}"
  end
  def link
    link_to full_name, user_path(self)
  end

  module ClassMethods
    def full_names
      all.map(&:full_name).join(", ")
    end
  end
end
module QueenPresenter
  def link
    link_to "parent"
  end
end

module PrincePresenter
  def link
    link_to "child"
  end
end

module GamePresenter
  def free?
    name == "Team Fortress 2"
  end
end

module TreePresenter
  def url
    tree_url(self)
  end
end