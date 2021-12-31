# frozen_string_literal: true

require 'test_helper'

class NotebookControllerTest < ActionDispatch::IntegrationTest
  setup do
    password = Faker::Lorem.word
    user = User.create(name: Faker::Lorem.word, username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
                       password: password, password_confirmation: password)
    post session_create_url, params: { username: user.username, password: password }
    @note = Note.create(header: Faker::Lorem.word, content: Faker::Lorem.word, user_id: user.id)
  end

  test 'should get my_notes' do
    get notebook_my_notes_url
    assert_response :success
  end
end
