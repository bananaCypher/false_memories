module FalseMemories
    module ActsAsFalseMemories
        extend ActiveSupport::Concern

        included do
        end

        def false_json 
            data = {}
            self.falsememories.each do |memory_key|
                property = eval "self.#{memory_key}" 
                data[memory_key] = property
            end
            data.to_json
        end

        module ClassMethods
            def acts_as_falsememories(*options)
                cattr_accessor :falsememories
                self.falsememories = options
            end
        end
    end
end

ActiveRecord::Base.send :include, FalseMemories::ActsAsFalseMemories
