# EasyPresenter [![Gem Version](https://badge.fury.io/rb/easy_presenter.png)](http://badge.fury.io/rb/easy_presenter) [![Build Status](https://travis-ci.org/s12chung/easy_presenter.png?branch=master)](https://travis-ci.org/s12chung/easy_presenter?branch=master) [![Code Climate](https://codeclimate.com/github/s12chung/easy_presenter.png)](https://codeclimate.com/github/s12chung/easy_presenter)

Access view methods from model instances in `Ruby on Rails`.

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
        all.map(&:full_name).join(", ")
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
You may `include` the following modules to add EasyPresenter to other classes.

* `EasyPresenter::Base` - add access to view methods
* `EasyPresenter` - Give access to the `ClassNamePresenter` class that has access to view methods. Subclasses will also have the same effect.


To add access to view methods to all instances or subclasses (such as an ORM).
```ruby
# config/initializers/add_presenter_to_orm.rb
# Find the base or shared class, for `ActiveRecord` it's `ActiveRecord::Base` and `Mongoid` it's `Mongoid::Document`
Orm::BaseClass.send :include, EasyPresenter
```

For all instances of a basic class.
```ruby
# app/models/non_database_model.rb
class NonDatabaseModel
    include EasyPresenter
end

# app/presenters/non_database_model_presenter.rb
module NonDatabaseModelPresenter
    ...

    module ClassMethods
        ...
    end
end
```

For all instances of a basic class without need of a `ClassNamePresenter` class.
```ruby
# app/models/some_view_object.rb
class SomeViewObject
    include EasyPresenter::Base

    def random_link
        link_to "random", "http://www.random.com"
    end
end
```

## Credits
Extracted out of [Placemark](https://www.placemarkhq.com/).

### Contribution
Feel free to fork, post issues or send any pull requests. Thanks.