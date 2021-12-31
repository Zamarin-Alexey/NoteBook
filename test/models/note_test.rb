# frozen_string_literal: true

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'test_save_db' do
    count1 = Note.count
    Note.new(header: Faker::Lorem.word, content: Faker::Lorem.word, user_id: User.first.id).save
    count2 = Note.count
    assert_equal count2, count1 + 1
  end

  test 'test_get_db' do
    note = Note.new(header: 'test note', content: Faker::Lorem.word, user_id: User.first.id)
    note.save
    id = note.id
    assert_equal 'test note', Note.find_by_id(id).header
  end

  test 'test_delete_db' do
    note = Note.new(header: Faker::Lorem.word, content: Faker::Lorem.word, user_id: User.first.id)
    note.save
    count1 = Note.count
    note.delete
    count2 = Note.count
    assert_equal count2, count1 - 1
  end
end
