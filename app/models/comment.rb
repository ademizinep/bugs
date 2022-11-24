class Comment < ApplicationRecord
  belongs_to :bug
  belongs_to :commentable, polymorphic: true
end
