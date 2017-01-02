class StaticPagesController < ApplicationController
  def top
    redirect_to :progress_bars if user_signed_in?
  end
end
