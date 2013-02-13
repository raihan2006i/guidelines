class AboutController < ApplicationController

	def show
    render params[:about]
  end
end
