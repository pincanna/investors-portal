class DocumentPolicy < ApplicationPolicy
  def index?
    user.has_role?(:document_reader)
  end

  def show?
    user.has_role?(:document_reader)
  end

  def update?
    user.has_role?(:document_editor)
  end

  def create?
    user.has_role?(:document_creator)
  end

  def destroy?
    user.has_role?(:document_destroyer)
  end

  class Scope < Scope
    def resolve
      if user.has_role?(:document_read_all)
        scope.all
      elsif user.has_role?(:document_reader)
        scope.with_role(:viewer, user)
      else
        [Document.new]
      end
    end
  end
end
