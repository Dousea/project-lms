# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    initialize_member if user.Member?
    initialize_moderator if user.Moderator?
    initialize_admin if user.Admin?
  end

  private

  def initialize_member
    can :read, Transaction
    can :read, Book
  end

  def initialize_moderator
    can :manage, Book
    can :manage, Publisher
    can :manage, Subject
    can :manage, Author
    can :manage, Transaction
  end

  def initialize_admin
    can :manage, :all
  end
end
