module FalseMemories
    class ArticlesController < ApplicationController
        def memories
            item = Article.find(params[:id])
            render json: item.memories
        end
    end
end
