class FalseMemoriesGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def start_generating
        Rails.application.eager_load!
        models = ActiveRecord::Base.descendants
        models.each do |model|
            begin
                model.falsememories
            rescue
                next
            end
            puts "Setting up FalseMemory for #{model.name}"
            create_controller(model)
            create_routes(model)
        end
    end

    
    private
    def create_controller(model)
        @controller_name = controller_name(model)
        @model = model.to_s
        template "controller.rb.erb", "app/controllers/false_memories/#{@controller_name.underscore}.rb"
    end

    def create_routes(model)
        @route_reference = route_reference(model)
        route "get '#{@route_reference}/:id/memories' => 'false_memories/#{@route_reference}#memories'"
    end

    def route_reference(model)
        model.to_s.tableize.underscore
    end

    def controller_name(model)
        "#{model.to_s.tableize.capitalize}Controller"
    end
end
