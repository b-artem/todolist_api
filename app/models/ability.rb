class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can %i[read create update destroy], Project, user_id: user.id
      can %i[read create update destroy], Task, project: { user_id: user.id }
      # cannot :read, Task
    end

    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
