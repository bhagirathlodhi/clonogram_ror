class Post < ApplicationRecord
  has_one :attached
  has_many :comment
end
