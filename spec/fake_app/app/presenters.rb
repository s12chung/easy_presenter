module UserPresenter
  def full_name
    "#{first_name} #{last_name}"
  end
  def link
    link_to full_name, user_path(self)
  end

  module ClassMethods
    def full_names
      self.class.all.map(&:full_name).join(", ")
    end
  end
end

module TreePresenter
  def url
    tree_url(self)
  end
end