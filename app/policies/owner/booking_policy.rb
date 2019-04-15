class Owner::BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.office.user == user
    # why was it still working with just 'true'???
  end

  def approve?
    record.office.user == user
  end
end
