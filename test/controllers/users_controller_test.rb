# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    password = Faker::Lorem.word
    @user = User.create(name: Faker::Lorem.word, username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
                        password: password, password_confirmation: password)
    post session_create_url, params: { username: @user.username, password: password }
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    get edit_user_path(@user),
        params: { user: { name: Faker::Lorem.word, username: Faker::Lorem.word } }
    assert_response :success
  end
end
