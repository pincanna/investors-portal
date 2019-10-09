class DocumentPolicy < ApplicationPolicy
  def index?
    user.has_role?(:document_read_all)
  end

  def show?
    user.has_role?(:document_read_all)
  end

  def update?
    user.has_role?(:document_editor)
  end

  def create?
    user.has_role?(:document_creator)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
