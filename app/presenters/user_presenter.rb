# frozen_string_literal: true

class UserPresenter < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end
end
