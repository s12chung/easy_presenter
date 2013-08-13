require "easy_presenter/version"
require "easy_presenter/base"
require "easy_presenter/railtie"

module EasyPresenter
  extend ActiveSupport::Concern

  included do
    presenter_class = "#{self}Presenter".safe_constantize
    if presenter_class
      include Base
      presenter_class.extend ActiveSupport::Concern
      include presenter_class
    end
  end

  # for the Presenter module only
  class << self
    def controller
      RequestStore.store[:presenter_controller]
    end

    def controller=(presenter_controller)
      RequestStore.store[:presenter_controller] = presenter_controller
    end
  end
end

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, EasyPresenter
elsif defined?(Mongoid::Document)
  Mongoid::Document.send :include, EasyPresenter
end