class ListsController < ApplicationController
  before_action :set_lists, only: %i[show]

  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
    @bookmark = Bookmark.new
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lists
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end

end
