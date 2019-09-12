# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin?)
      can :access, :rails_admin
      can :manage, :all
    else
      can :read, Task, public: true
    end
  end
end
