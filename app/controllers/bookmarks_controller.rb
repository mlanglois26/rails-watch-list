class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
