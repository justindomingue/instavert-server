class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can [:read, :update], User, id:user.id
    
    can [:read, :update, :destroy], Product, :school_id => user.school_id
    can :create, Product
    
    can [:read, :update, :destroy], Place, :school_id => user.school_id
    can :create, Place
    
    can [:read, :update], School, user_id:user.id
    
    can :read, ActiveAdmin::Page, :name => "Dashboard"
    
  end
end
