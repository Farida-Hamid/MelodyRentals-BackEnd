class UserPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.admin?
          scope.all
        elsif user.regular?
          scope.where(id: user.id)
        else
          scope.none
        end
      end
    end
  
    def index?
      @user.admin? || @user.regular? || @user == record
    end
  
    def show?
      user.admin? || user.regular? || user == record
    end
  
    def update?
      user.admin? || (user == record && !record.admin?)
    end
  end
  