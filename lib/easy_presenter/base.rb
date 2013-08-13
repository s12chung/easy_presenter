module EasyPresenter
  module Base
    extend ActiveSupport::Concern

    def controller_get(instance_variable)
      self.class.controller_get instance_variable
    end

    # See https://github.com/amatsuda/active_decorator/blob/master/lib/active_decorator/helpers.rb
    def method_missing(name, *args, &block)
      super
    rescue NoMethodError, NameError => original_error
      self.class.try_helper(original_error, name, *args, &block)
    end

    # for Rails #url_for helpers
    def url_options
      controller = EasyPresenter.controller
      if controller
        controller.url_options
      else
        super
      end
    end

    module ClassMethods
      def controller_get(instance_variable)
        controller.instance_variable_get instance_variable
      end

      def method_missing(name, *args, &block)
        super
      rescue NoMethodError, NameError => original_error
        try_helper(original_error, name, *args, &block)
      end

      def try_helper(original_error, name, *args, &block)
        controller = EasyPresenter.controller
        if controller
          begin
            controller.view_context.send name, *args, &block
          rescue NoMethodError, NameError => new_error
            if new_error.name == name && new_error.args == args
              raise original_error
            else
              raise new_error
            end
          end
        else
          raise original_error
        end
      end
    end
  end
end