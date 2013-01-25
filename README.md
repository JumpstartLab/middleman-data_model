# Middleman::DataModel

Middelman allows you to define [local data](http://middlemanapp.com/advanced/local-data/). DataModel allows you to define a model class which will be mapped with that data. This is useful:

* If you hate hashes in your view code and want to call methods
* Want to eventually move to another system that uses an ORM

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-data_model'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install middleman-data_model
```

## Usage

* Add the gem to your gemfile within your middleman project

```ruby
gem 'middleman-data_model'
```

* Add the following line to your **config.rb**

```ruby
activate :data_models
```

* Define a model class within your **data** directory which is a sub-class of `Middleman::DataModel::SimpleDataModel`.

Here I define an Event model which will automatically match itself to any data
stored in `data.events`.

```ruby
class Event < Middleman::DataModel::SimpleDataModel

end
```

* Use the model within your view:

```erb
<div class="events">
  <ul class="events-list">
    <%= Event.all.each do |event| %>
      <li class="vevent">
        <div class="img">
          <img src="<%= event.image_url" alt="<%= event.image_alt %>">
        </div>
        <div>
          <h3><a href="/"><%= event.title %></a></h3>
          <p class="location"><a href="/"><%= event.location %></a></p>
          <p class="details"><%= event.details %></p>
        </div>
      </li>
    <% end %>
  </ul>
</div>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
