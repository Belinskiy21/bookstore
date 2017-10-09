class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.admin_user?
        can :manage, :all
      else
        can :read, :all
      end

  end
end
