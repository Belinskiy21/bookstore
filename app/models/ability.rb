class Ability
  include CanCan::Ability

  def initialize(user)
    case user
    when User
       can :read, [Book, Category, ShippingMethod]
       can :update, Coupon
       can :manage, OrderItem

       can [:read, :create], Address
       can :update, Address do |address|
         address.try(:addressable_id) == user.id
       end

       can :update, User do |customer|
         customer == user
       end

       can [:read, :create], CreditCard
       can :update, CreditCard do |card|
         card.try(:user) == user
       end

       can [:read, :create], Order
       can [:update, :destroy], Order do |order|
         order.try(:user) == user
       end

       can :create, Review
       can :destroy, Review do |review|
         review.try(:user) == user
       end

     when AdminUser
       can :read, [Address, Coupon, CreditCard, User, ShippingMethod]
       can :manage, [Author, Book, Category, AdminUser, OrderItem]
       can [:update, :destroy], Review
       can :update, Order

     else
       can :read, [Book, Category]
    end
  end
end
