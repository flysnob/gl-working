ActiveRecord::Base.transaction do
  if Rails.env.development?
    # -------------------------------------------------------------------------------------------------------------------
    # Test users
    # -------------------------------------------------------------------------------------------------------------------
    def create_user(email, password, role, name)
      u = User.create_with(name: name, email: email, password: password, role: role).find_or_create_by(name: name)
      # u.update! role: role if role != u.role
    end

    puts 'Creating users'

    create_user('flysnob@gmail.com', 'gaapflysnob123', :admin, 'flysnob')
    create_user('mlefferscpa@yahoo.com', 'gaapmark123', :user, 'mark')
    # -------------------------------------------------------------------------------------------------------------------

    # -------------------------------------------------------------------------------------------------------------------
    # Test accounts
    # -------------------------------------------------------------------------------------------------------------------
    puts 'Creating projects'

    project_1 = Project.find_or_create_by(name: 'My first project', description: 'My first project', user: User.find_by(name: 'flysnob'))
    project_2 = Project.find_or_create_by(name: 'My first project', description: 'My first project', user: User.find_by(name: 'mark'))
    project_3 = Project.find_or_create_by(name: 'My second project', description: 'My second project', user: User.find_by(name: 'flysnob'))
    project_4 = Project.find_or_create_by(name: 'My second project', description: 'My second project', user: User.find_by(name: 'mark'))
    puts '.'
    # -------------------------------------------------------------------------------------------------------------------
  end
end # ActiveRecord::Base.transaction
