require 'test_helper'

class FalseMemoriesTest < ActiveSupport::TestCase
    def test_false_json_returns_json_object_with_only_allowed_data
        article = Article.first
        puts Article.all
        test = { 
            title: article.title,
            author: article.author,
            created_at: article.created_at,
            updated_at: article.updated_at,
        }.to_json
        assert_equal test, article.false_json
    end
end
