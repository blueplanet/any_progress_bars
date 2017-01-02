class ProgressBarsController < ApplicationController
  before_action :set_progress_bar, only: %i(edit update)

  def index
    @progress_bars = current_user.progress_bars
  end

  def new
    @progress_bar = current_user.progress_bars.build
  end

  def edit
  end

  def create
    @progress_bar = current_user.progress_bars.build progress_bar_params
    if @progress_bar.save
      redirect_to :progress_bars, notice: '新しいプログレースバーを作成しました。'
    else
      render :new
    end
  end

  def update
    if @progress_bar.update(progress_bar_params)
      redirect_to :progress_bars, notice: 'プログレースバーを更新しました。'
    else
      render :edit
    end
  end

  private

    def progress_bar_params
      params.require(:progress_bar).permit(:name, :total, :current)
    end

    def set_progress_bar
      @progress_bar = current_user.progress_bars.find params[:id]
    end
end
