class Public::SearchesController < ApplicationController

    def search
      @search = Post.search(params[:search])
      
    end

end
