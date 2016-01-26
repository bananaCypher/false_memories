class FalseMemoriesGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :model_name, :type => :string

    def create_controller
        template "controller.rb.erb", "app/controllers/false_memories/#{controller_name.underscore}.rb"
    end

    def create_routes
        route "get '#{route_reference}/:id/memories' => 'false_memories/#{route_reference}#memories'"
    end

    private
    def route_reference
        model.to_s.tableize.underscore
    end

    def controller_name
        "#{model.to_s.tableize.capitalize}Controller"
    end

    def model
        eval model_name.capitalize
    end
end
