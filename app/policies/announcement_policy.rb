class AnnouncementPolicy < ApplicationPolicy
  def show?
    user.has_role?(:admin_portal)
  end

  def create?
    user.has_role?(:announcement_creator)
  end

  def update?
    user.has_role?(:announcement_creator)
  end

  def destroy?
    user.has_role?(:announcement_creator)
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
