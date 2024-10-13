class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new  # Usuario invitado
  
      if user.present?
        can :create, Post
        can :create, Comment
  
        can [:edit, :update, :destroy], Post, user_id: user.id
        can [:edit, :update, :destroy], Comment, user_id: user.id
      end
  
      can :read, Post  # Todos pueden leer posts
    end
  end
  