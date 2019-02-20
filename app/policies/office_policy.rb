class OfficePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user
  end
end
