class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Anyone can view any restaurant
      scope.all
    end
  end

    # Anyone can create an article
    def create?
      return true
    end

    # Only current user and admin can edit/update his articles
    def update?
      user_is_owner_or_admin?
    end

    # Only current user and admin can destroy his articles
    def destroy?
      user_is_owner_or_admin?
    end

    private

    # Is the current_user (simply called "user" in pundit) the
    # owner of the articles (called "record")
    def user_is_owner_or_admin?
      record.user == user || user.admin
    end
end
