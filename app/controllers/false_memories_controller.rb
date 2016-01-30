class FalseMemoriesController < ApplicationController
    FalseMemories::get_false_models.each do |model|
        define_method("#{model.to_s.tableize.underscore}") do
            item = model.find(params[:id])
            render json: item.memories
        end
    end
end
