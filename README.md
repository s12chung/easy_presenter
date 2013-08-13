# EasyPresenter

Access view methods from the context of your model.

## Usage
### Easy
```
gem 'easy_presenter'
```

Given a model `User`
```ruby
# app/presenters/user_presenter.rb
module UserPresenter
  # Separate view of the model in the presenter, even if it's a `String`. Leave data manipulation in the model.
  def full_name
    "#{first_name} #{last_name}"
  end

  # Quick link to the `User`
  def link
    link_to full_name, user_path(self)
  end

  # Using a module, so you must do this to add class methods
  module ClassMethods
    # String of all full names separated by commas
    def full_names
        # better to access `User` this way, you may use `User` instead of `self.class` though.
        self.class.all.map(&:full_name).join(", ")
    end
  end
end
```

Access your presenter methods in a view:
```erb
<!-- app/views/users/index.html.erb -->
<% User.all.each do |user| %>
  <%= user.link %><br>
<% end %>
```

Or a helper:
```ruby
# app/helpers/users_helper.rb
module UsersHelper
  def full_names_in_div
    content_tag :div, User.full_names
  end
end
```

### Supported ORMs
`ActiveRecord`, `Mongoid`, you may add support to an ORM at the bottom of `lib/easy_presenter.rb` and send in a pull request if you wish.

### Advanced
You may use the following modules to add EasyPresenter to other classes.

* `EasyPresenter::Base` - add access to view methods
* `EasyPresenter` - `EasyPresenter::Base` and if `method_missing?`, give access to the `ClassNamePresenter` class

## Credits
Extracted out of [Placemark](https://www.placemarkhq.com/).

### Contribution
Feel free to fork, post issues or send any pull requests. Thanks.