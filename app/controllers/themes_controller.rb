class ThemesController < ApplicationController
  def index
    @current_theme = Theme.first
    @themes = Theme.where.not(id: @current_theme.id)
    @authors = Author.all
    @books = Book.all
  end
end
