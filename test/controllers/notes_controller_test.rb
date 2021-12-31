# frozen_string_literal: true

require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    password = Faker::Lorem.word
    user = User.create(name: Faker::Lorem.word, username: Faker::Lorem.word, email: "#{Faker::Lorem.word}@mail.ru",
                       password: password, password_confirmation: password)
    post session_create_url, params: { username: user.username, password: password }
    @note = Note.create(header: Faker::Lorem.word, content: Faker::Lorem.word, user_id: user.id)
  end

  test 'should get new' do
    get new_note_url
    assert_response :success
  end

  test 'should create new note' do
    assert_difference('Note.count', 1) do
      post notes_url,
           params: { note: { header: Faker::Lorem.word, content: Faker::Lorem.word, user_id: 1 } }
    end
    assert_redirected_to note_url(Note.last)
  end

  test 'should show note' do
    get note_url(@note)
    assert_response :success
  end

  test 'should get edit' do
    get edit_note_url(@note)
    assert_response :success
  end

  test 'should update note' do
    patch note_url(@note), params: { note: { header: Faker::Lorem.word, content: Faker::Lorem.word, user: 1 } }
    assert_redirected_to note_url(@note)
  end

  test 'should delete note' do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end
    assert_redirected_to root_path
  end
end
