class FollowingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    # You can follow any specific author
    def create?
      record.follower_id == user.id
    end

    # You can unfollow a specific author
    def destroy?
      record.follower_id == user.id
    end
end
