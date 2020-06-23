# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    initialize_member(user) if user.Member?
    initialize_moderator(user) if user.Moderator?
    initialize_admin(user) if user.Admin?
  end

  private

  def initialize_member(user)
    can %i[read create], Transaction, member_id: user.id
    can :read, [Book, Publisher, Subject, Author]
    can :manage, User, id: user.id
  end

  def initialize_moderator(_user)
    can :manage, User do |user|
      !user.Admin?
    end
    can :manage, [Book, Publisher, Subject, Author, Transaction]
  end

  def initialize_admin(_user)
    can :manage, :all
  end
end
