class PaintingsController < ApplicationController
  before_action :set_painting, only: %i[ show show_image upload_file update destroy ]

  # GET /paintings
  def index
    @paintings = Painting.all

    render json: @paintings
  end

  # GET /paintings/1
  def show
    debugger
    render json: {url: @painting.image.attachement}
  end

  # POST /paintings
  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      render json: @painting, status: :created, location: @painting
    else
      render json: @painting.errors, status: :unprocessable_entity
    end
  end

  # POST /paintings/1/file
  def upload_file
    io = StringIO.new
    io.puts(painting_image)
    io.rewind

    @painting.image.attach(io: io, filename: @painting.name)
    if @painting.save
      render json: @painting, status: :created, location: @painting
    else
      render json: @painting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paintings/1
  def update
    if @painting.update(painting_params)
      render json: @painting
    else
      render json: @painting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paintings/1
  def destroy
    @painting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_painting
      @painting = Painting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def painting_params
      params.require(:painting).permit( :name, :description, :user_id, :order)
    end

    # Only allow a list of trusted parameters through.
    def painting_image
      params.require(:image)
    end
end
