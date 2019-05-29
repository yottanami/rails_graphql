module RailsGraphql
  class MutationGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :resource_name, type: :string
    argument :fields, type: :hash

    def replace_template
      @resource_name = resource_name
      @fields = fields
      @arguments = fields
      byebug
      template "mutation.erb", "app/graphql/mutations/create_#{resource_name}.rb", force: true
    end
  end
end
