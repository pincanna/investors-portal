# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.has_role?(:user_administrator)
  end

  def show?
    user.has_role?(:user_administrator)
  end

  def update?
    user.has_role?(:user_editor)
  end

  def destroy?
    user.has_role?(:user_destroyer)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
