# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'test_save_db' do
    count1 = User.count
    User.new(name: Faker::Lorem.word, username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
             password: '123456', password_confirmation: '123456').save
    count2 = User.count
    assert_equal count2, count1 + 1
  end

  test 'test_get_db' do
    user = User.new(name: 'test_user', username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
                    password: '123456', password_confirmation: '123456')
    user.save
    id = user.id
    assert_equal 'test_user', User.find_by_id(id).name
  end

  test 'test_delete_db' do
    user = User.new(name: Faker::Lorem.word, username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
                    password: '123456', password_confirmation: '123456')
    user.save
    count1 = User.count
    user.delete
    count2 = User.count
    assert_equal count2, count1 - 1
  end

  test 'test_uniqueness_username' do
    User.new(name: 'test user', username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
             password: '123456', password_confirmation: '123456').save
    user = User.new(name: 'test user', username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
                    password: '123456', password_confirmation: '123456')
    user.validate
    assert user.errors[:username]
  end
end
