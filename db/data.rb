ActiveRecord::Base.transaction do
  if Rails.env.development?
    # -------------------------------------------------------------------------------------------------------------------
    # Test users
    # -------------------------------------------------------------------------------------------------------------------
    def create_user(username, email, password, role, name)
      u = User.create_with(username: username, email: email, password: password, role: role).find_or_create_by(name: name)
      u.update! role: role if role != u.role
    end

    puts 'Creating users'

    create_user('flysnob', 'flysnob@gmail.com', 'gaapflysnob123', :super_admin, 'Mark')
    # -------------------------------------------------------------------------------------------------------------------

    # -------------------------------------------------------------------------------------------------------------------
    # Test accounts
    # -------------------------------------------------------------------------------------------------------------------
    puts 'Creating projects'

    project_1 = Project.find_or_create_by(name: 'My first project', description: 'My first project')
    puts '.'
    # -------------------------------------------------------------------------------------------------------------------
  end
end # ActiveRecord::Base.transaction
