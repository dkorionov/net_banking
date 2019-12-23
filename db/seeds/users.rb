if User.count.zero?
  puts 'Seeding Users'
  user1 = User.new(full_name: 'John Johnson', email: 'john@mail.com',
                   birthday: '1997-10-17', gender: 'male', phone: '123456789',
                   password: '123456', password_confirmation: '123456')
  bill = BillService::BillBuilder.new.bill_type = 'deposit'
  user1.skip_confirmation!
  user1.save!
  user1.bills
  user1.save!

  user2 = User.new(full_name: 'Mary Smith', email: 'smith@mail.com',
                   birthday: '1999-10-17', gender: 'female', phone: '987654321',
                   password: '123456', password_confirmation: '123456')

  user2.skip_confirmation!
  user2.save!
end