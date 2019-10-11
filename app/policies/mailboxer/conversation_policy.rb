class Mailboxer::ConversationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.recipients.include?(user) || user.has_role?(:messages_admin)
  end

  def create?
    true
  end

  def reply?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
