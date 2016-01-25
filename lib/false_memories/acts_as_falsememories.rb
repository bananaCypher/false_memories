module FalseMemories
    module ActsAsFalseMemories
        extend ActiveSupport::Concern

        included do
        end

        def json_memories 
            self.memories.to_json
        end

        def memories
            data = {}
            self.falsememories.each do |memory_key|
                property = eval "self.#{memory_key}" 
                data[memory_key] = property
            end
            return data
        end

        module ClassMethods
            def acts_as_falsememories(*options)
                cattr_accessor :falsememories
                self.falsememories = options
                controller_name = "#{self.to_s.tableize.capitalize}Controller"
            end
        end
    end
end

ActiveRecord::Base.send :include, FalseMemories::ActsAsFalseMemories
