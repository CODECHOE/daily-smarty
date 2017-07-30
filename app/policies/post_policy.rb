class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id
  end

  def destroy?
    record.user_id == user.id
  end

  def show?
    if user && (record.draft? || record.private_post?) && record.user_id == user.id
      true
    elsif record.draft? || record.private_post?
      false
    else
      true
    end
  end
end