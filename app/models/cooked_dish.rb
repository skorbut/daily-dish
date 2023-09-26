# frozen_string_literal: true

class CookedDish < ApplicationRecord
  belongs_to :dish
  belongs_to :user
end
