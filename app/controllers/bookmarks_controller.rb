class BookmarksController < ApplicationController
  before_action :set_bookmarks, only: %i[show]

  def index
    @bookmarks = Bookmark.all
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
    # Pas besoin si dessous car on lui passe mouvie via le forme comme le comment
    # @movie = Movie.find(params[:bookmark][:movie_id])
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other, notice: 'bookmarks ok'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmarks
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a bookmark of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

end
