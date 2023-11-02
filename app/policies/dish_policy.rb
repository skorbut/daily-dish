# frozen_string_literal: true

class DishPolicy < ApplicationPolicy
  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end
end
