class NotebookController < ApplicationController
  skip_before_action :require_login, only: %i[main_page cook_page]
  def my_notes
  end
end
