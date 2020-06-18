# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Book if user.Member?
    can :manage, Book if user.Moderator? || user.Admin?
    can :manage, User if user.Admin?
  end
end
