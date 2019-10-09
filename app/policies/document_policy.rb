class DocumentPolicy < ApplicationPolicy
  def index?
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
