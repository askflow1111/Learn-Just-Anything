class Comment < ApplicationRecord
  # attr_accessor :body, :commenter, :post
  belongs_to :post
end
