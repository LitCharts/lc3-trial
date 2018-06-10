class LitGuidesController < ApplicationController
  def index
    @lit_guides = LitGuide.order(:title)
  end

  def show
    @lit_guide = LitGuide.find(params[:id])
    @highlight = Highlight.new
  end
end
