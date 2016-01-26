# desc "Explaining what the task does"
# task :falsememories do
#   # Task goes here
# end

def generateController(model)
    controller_name = "#{model.to_s.tableize.capitalize}Controller"
    puts "Controller name generated as #{controller_name}"
    controller_content = "
        module FalseMemories
            class #{controller_name} < ApplicationController
                def memories
                    item = #{model.name}.find(params[:id])
                    render json: item.memories
                end
            end
        end
    "
    puts "Controller generated as #{controller_content}"
    filepath = "false_memories/#{model.to_s.tableize}_controller.rb"
    puts "Controller file is #{filepath}"
    if File.exist?(filepath)
        puts "gotcha"
    end
end

def generateRoutes(model)
        pluralised_model = "#{model.to_s.tableize}"
        puts "Model pluralised as #{pluralised_model}"
        routes_content = "
            get '#{pluralised_model}/:id/memories' => 'false_memories/#{pluralised_model}#memories'
        "
        puts "Route generated as #{routes_content}"
end

desc "Sets up the routes and actions required by FalseMemory"
task :false_memory => :environment do
    Rails.application.eager_load!
    models = ActiveRecord::Base.descendants
    models.each do |model|
        begin
            model.falsememories
        rescue
            next
        end
        puts "Setting up FalseMemory for #{model.name}"
        generateController(model)
        generateRoutes(model)                
    end
end
