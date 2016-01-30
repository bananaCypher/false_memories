module FalseMemories
    def self.get_false_models()
        Rails.application.eager_load!
        models = ActiveRecord::Base.descendants
        false_memory_models = []
        models.each do |model|
            begin
                model.falsememories
            rescue
                next
            end
            false_memory_models.push(model)
        end
        false_memory_models
    end

    def self.route_reference(model)
        model.to_s.tableize.underscore
    end
end
