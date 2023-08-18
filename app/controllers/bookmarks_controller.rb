class BookmarksController < ApplicationController
  before_action :set_bookmarks, only: %i[show]

  def index
    @bookmarkss = Bookmark.all
  end

  # GET /bookmarks/1
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # POST /bookmarks
  def create

    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    # @movie = Movie.find(params[:bookmark][:movie_id])
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmarks
    @bookmarks = Bookmark.find(params[:id])
  end

  # Only allow a bookmark of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
