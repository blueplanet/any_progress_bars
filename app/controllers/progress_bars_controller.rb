class ProgressBarsController < ApplicationController
  def index
    @progress_bars = current_user.progress_bars
  end

  def new
    @progress_bar = current_user.progress_bars.build
  end

  def create
    @progress_bar = current_user.progress_bars.build progress_bar_params
    if @progress_bar.save
      redirect_to :progress_bars, notice: '新しいプログレースバーを作成しました。'
    else
      render :new
    end
  end

  private

    def progress_bar_params
      params.require(:progress_bar).permit(:name, :total, :current)
    end
end
