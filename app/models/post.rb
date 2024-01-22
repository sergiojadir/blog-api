# frozen_string_literal: true

# Post
class Post < ApplicationRecord
  validates :title, :body, presence: true
end
