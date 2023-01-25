class InstrumentPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        elsif user.regular?
          scope.where(user: user)
        else
          scope.none
        end
      end
    end
  
    def index?
      user.admin? || user.regular? || user
    end
  
    def show?
      user.admin? || user.regular? || user
    end
  
    def create?
      user.admin?
    end
  
    def edit?
      update?
    end
  
    def update?
      user.admin?
    end
  
    def destroy?
      user.admin?
    end
  end
  