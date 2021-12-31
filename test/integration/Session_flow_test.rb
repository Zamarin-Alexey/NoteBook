# frozen_string_literal: true

require_relative '../test_helper'

class SessionFlowTest < ActionDispatch::IntegrationTest
  test 'user with incorrect credentials will be redirected to login page' do
    post session_create_url, params: { login: Faker::Lorem.word, password: Faker::Lorem.word }
    assert_redirected_to controller: :session, action: :login
  end

  test 'user with correct credentials will see the root' do
    password = Faker::Lorem.word
    user = User.create(username: Faker::Lorem.word, password: password, password_confirmation: password)
    post session_create_url, params: { login: user.username, password: password }
    assert_redirected_to controller: :session, action: :login
  end

  test 'user will see the root after signing up' do
    username = Faker::Lorem.word
    password = Faker::Lorem.word
    post users_path,
         params: { user: { name: Faker::Lorem.word, username: username, email: "#{Faker::Lorem.word}@gmail.com",
                           password: password, password_confirmation: password } }
    assert_redirected_to root_path
  end

  test 'user can logout' do
    password = Faker::Lorem.word
    user = User.create(username: Faker::Lorem.word, password: password, password_confirmation: password)
    post session_create_url, params: { login: user.username, password: password }
    get session_logout_url
    assert_redirected_to session_login_path
  end
end
