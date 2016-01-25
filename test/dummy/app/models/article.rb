class Article < ActiveRecord::Base
    acts_as_falsememories :title, :author, :created_at, :updated_at
end
