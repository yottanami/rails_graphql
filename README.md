# RailsGraphql

RailsGraphql is a Ruby on Rails Gem that will help you use Graphql in your project easier.
By adding this gem to your project it will create all requirements and dependencies.
You can use the railsgraphql generators to create Graphql resources from the model.

This project is under development and not completed yet.
## Installation
Clone or download this project on your local machine.
Add this line to your application's Gemfile:

```ruby
gem 'rails_graphql', src: PATH_OF_THIS_PROJECT
```

And then execute:

    $ bundle

No you can complete the installation process using this generator:
```rails_graphql:install```

## Usage
There are couple of generators can help you to add graphql in your project.

If you want to create everything from model you can use this generator.
```rails_graphql:all_resources```

If you need to create mutation for models or specific model, you can use this generator.
If you do not specify the model name it will careate mutation for all models.
```rails_graphql:mutation```

and using this generator you can create resources
```rails_graphql:resource```


## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_graphql.
