class NotebookController < ApplicationController
  skip_before_action :require_login, only: %i[main_page cook_page]
  def my_notes
    @notes = Note.where(user_id: current_user.id).all.map do |n|
      { id: n.id, header: n.header, content: n.content, user_id: n.user_id }
    end
  end
end
