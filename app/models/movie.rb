# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :imdb_id, presence: true
  validates :title, presence: true
end
