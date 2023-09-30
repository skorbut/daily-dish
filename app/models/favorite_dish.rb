# frozen_string_literal: true

class FavoriteDish < ApplicationRecord
  belongs_to :dish
  belongs_to :user
end
