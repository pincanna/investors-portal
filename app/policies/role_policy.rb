class RolePolicy < ApplicationPolicy
  def create?
    user.has_role?(:role_manager)
  end

  def destroy?
    user.has_role?(:role_manager)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
