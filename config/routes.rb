module FalseMemories
    Rails.application.routes.draw do
        FalseMemories::get_false_models.each do |model|
            route_reference = FalseMemories::route_reference(model)
            get "#{route_reference}/:id/memories" => "false_memories##{route_reference}"
        end
    end
end
