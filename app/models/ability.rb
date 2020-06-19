# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Book if user.Member?

    if user.Moderator? || user.Admin?
      can :manage, Book
      can :manage, Publisher
      can :manage, Subject
      can :manage, Author
    end

    can :manage, User if user.Admin?
  end
end
