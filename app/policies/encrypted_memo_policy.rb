class EncryptedMemoPolicy < ApplicationPolicy
  def index?
    user.has_role?(:encrypted_memo_viewer) || user.admin?
  end

  def show?
    user.has_role?(:encrypted_memo_viewer) || user.admin?
  end

  def create?
    user.has_role?(:encrypted_memo_creator) || user.admin?
  end

  def update?
    false
  end

  def destroy?
    user.has_role?(:encrypted_memo_destroyer) || user.admin?
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
