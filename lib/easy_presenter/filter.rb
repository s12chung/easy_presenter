module EasyPresenter
  module Filter
    extend ActiveSupport::Concern

    included do
      append_before_filter :set_easy_presenter_controller
    end

    protected
    def set_easy_presenter_controller
      EasyPresenter.controller = self
    end
  end
end