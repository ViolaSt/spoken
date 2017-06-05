class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Anyone can view any article
      scope.all
    end
  end

 # Anyone can create a comment
  def create?
    return true
  end

 # Only current user or admin can edit/update his comments
  def update?
    user_is_owner_or_admin?
  end

  # Only current user or admin can destroy his comments
  def destroy?
    user_is_owner_or_admin?
  end

  private

  # Is the current_user (simply called "user" in pundit) the
  # owner of the comments (called "record"); or is he an admin
  def user_is_owner_or_admin?
    record.reading.user == user || user.try(:admin?)
  end
end
