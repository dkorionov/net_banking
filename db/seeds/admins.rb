# frozen_string_literal: true

if Admin.count.zero?
  puts 'Seeding Admins'
  Admin.create(login: 'admin', password: '123456', password_confirmation: '123456')
end