class HighlightsController < ApplicationController
  before_action :set_lit_guide, except: :index
  before_action :set_highlight, except: [:index, :new, :create]

  def index
    @highlights = Highlight.includes(:lit_guide).page(params[:page] || 1).per(params[:per] || 10)
  end

  def create
    @highlight = Highlight.new(highlight_params)
    if @highlight.save
      render @highlight
    else
      render json: @highlight.errors, status: :unprocessable_entity
    end
  end

  def update
    if @highlight.update(highlight_params)
      render @highlight
    else
      render json: @highlight.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @highlight.destroy!

    head :no_content
  end

  private

  def highlight_params
    params.require(:highlight).permit(:quote, :note, :start_position, :end_position, :lit_guide_id)
  end

  def set_lit_guide
    @lit_guide = LitGuide.find(params[:lit_guide_id])
  end

  def set_highlight
    @highlight = Highlight.find(params[:id])
  end
end
