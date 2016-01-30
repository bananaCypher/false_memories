class Article < ActiveRecord::Base
    acts_as_falsememories :title, :content
end
