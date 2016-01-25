module FalseMemories
    Rails.application.routes.draw do
        get 'articles/:id/memories' => 'false_memories/articles#memories'
    end
end
