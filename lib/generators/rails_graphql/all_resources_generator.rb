module RailsGraphql
  class AllResourcesGenerator < Rails::Generators::Base

    def load_models
      # @models = ApplicationRecord.descendants[0].columns_hash
      @models =   Dir.glob("#{Rails.root}/app/models/*.rb").map{|x| x.split("/").last.split(".").first.camelize}
    end

    def generate_types
      ignore_columns = ['created_at', 'updated_at']
      ignore_models = ['User', 'ApplicationRecord']
      field_types = {
        integer: 'Integer',
        float: 'Float',
        decimal: 'Float',
        string: 'String',
        text: 'String',
        boolean: 'Boolean',
        binary: 'Binary',
        datetime: 'ISO8601DateTime',
        time: 'ISO8601DateTime',
        date: 'ISO8601DateTime',
        timestamp: 'String',
        json: 'Json'
      }

      @models.each do |model|
        model = model.constantize
        next if ignore_models.include? model.name
        generator_str = ""
        model.columns.each do |clmn|
          unless ignore_columns.include? clmn.name
            type = clmn.name == 'id' ? 'ID': field_types[clmn.type]
            generator_str += "#{clmn.name}:#{type} "
          end
        end
        generate "graphql:object #{ model } #{ generator_str }"
        generate "graphql:mutation create_#{ model }"
      end

    end
  end
end
