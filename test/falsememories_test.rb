require 'test_helper'

class FalseMemoriesTest < ActiveSupport::TestCase
    def test_json_memories_returns_json_object_with_only_allowed_data
        article = Article.first
        test = { 
            title: article.title,
            author: article.author,
            created_at: article.created_at,
            updated_at: article.updated_at,
        }.to_json
        assert_equal test, article.json_memories
    end
end
