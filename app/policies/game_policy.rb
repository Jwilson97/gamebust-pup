class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user == record.user || user.admin
  end

  def destroy?
    user == record.user || user.admin
  end

end
