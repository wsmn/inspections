# frozen_string_literal: true

namespace(:db) do
  desc('Create data for local development')
  task(dev_data: :environment) do
    # User will get a random password at creation
    user = User.find_or_initialize_by(email: 'admin@wessman.co',
                                      name: 'Admin Adminsson',
                                      role: 'admin',
                                      phone: '0701337133')
    user.password = 'passpass'
    user.save!
    puts User.last.name
    puts "=== Sign in to Admin User with: ==="
    puts "=== email: admin@wessman.co ==="
    puts "=== pass: passpass ==="

    10.times { FactoryBot
      .create(:project) }
  end
end
