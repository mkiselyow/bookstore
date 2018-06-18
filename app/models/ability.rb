class Ability
  include CanCan::Ability

  def initialize(customer)
    can :read, :all # permissions for every customer, even if not logged in    
    if customer.present?  # additional permissions for logged in users (they can manage their posts)
      can :manage, Order, customer_id: customer.id 
      # if customer.admin?  # additional permissions for administrators
      #   can :manage, :all
      # end
    end
    # Define abilities for the passed in customer here. For example:
    #
    #   customer ||= Customer.new # guest customer (not logged in)
    #   if customer.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the customer
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the customer can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the customer can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
