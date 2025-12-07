class GalleriesController < ApplicationController
  before_action :set_gallery, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  # GET /galleries or /galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1 or /galleries/1.json
  def show
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries or /galleries.json
  def create
    @gallery = Gallery.new(gallery_params.except(:images))

    respond_to do |format|
      if @gallery.save
        if params[:gallery][:images].present?
          params[:gallery][:images].reject(&:blank?).each do |image|
            photo = @gallery.photos.build(position: 0)
            photo.image.attach(image)
            photo.save
          end
        end
        format.html { redirect_to @gallery, notice: "Gallery was successfully created." }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1 or /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params.except(:images, :photo_order))
        if params[:gallery][:photo_order].present?
          params[:gallery][:photo_order].split(',').each_with_index do |id, index|
            @gallery.photos.find(id).update(position: index + 1)
          end
        end
        if params[:gallery][:images].present?
          params[:gallery][:images].reject(&:blank?).each do |image|
            photo = @gallery.photos.build(position: 0)
            photo.image.attach(image)
            photo.save
          end
        end
        format.html { redirect_to @gallery, notice: "Gallery was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1 or /galleries/1.json
  def destroy
    @gallery.destroy!

    respond_to do |format|
      format.html { redirect_to galleries_path, notice: "Gallery was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def gallery_params
      params.require(:gallery).permit(:title, :description, :photo_order, images: [])
    end
end
