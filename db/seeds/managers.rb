if Manager.count.zero?
  puts 'Seeding Manager'
  manager1 = Manager.new(full_name: 'Triss Merigold', login: 'triss', email: 'triss@mail.com',
                   password: '123456', password_confirmation: '123456')
  manager1.save!

end