module RailsGraphql
  class AllResourcesGenerator < Rails::Generators::Base


    def load_models
      ignore_columns = ['created_at', 'updated_at']
      ignore_models = []
      field_types = {
        id: 'ID',
        integer: 'Integer',
        float: 'Float',
        string: 'String',
        date_time: 'ISO8601DateTime',
        time: 'ISO8601DateTime',
        date: 'ISO8601DateTime',
        boolean: 'Boolean'
      }

      # @models = ApplicationRecord.descendants[0].columns_hash
      @models = ApplicationRecord.descendants
      @models.each do |model|
        generator_str = " "
        model.columns.each do |clmn|
          generator_str += "#{clmn.name}:#{field_types[clmn.type]} " unless ignore_columns.include? clmn.name
        end
      end
    end

  end
end
