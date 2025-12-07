class ChurchMembersController < ApplicationController
  before_action :set_church_member, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  # GET /church_members or /church_members.json
  def index
    @church_members = ChurchMember.order(:last_name, :first_name)
  end

  # GET /church_members/1 or /church_members/1.json
  def show
  end

  # GET /church_members/new
  def new
    @church_member = ChurchMember.new
  end

  # GET /church_members/1/edit
  def edit
  end

  # POST /church_members or /church_members.json
  def create
    @church_member = ChurchMember.new(church_member_params)

    respond_to do |format|
      if @church_member.save
        format.html { redirect_to @church_member, notice: "Church member was successfully created." }
        format.json { render :show, status: :created, location: @church_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @church_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /church_members/1 or /church_members/1.json
  def update
    respond_to do |format|
      if @church_member.update(church_member_params)
        format.html { redirect_to @church_member, notice: "Church member was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @church_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @church_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /church_members/1 or /church_members/1.json
  def destroy
    @church_member.destroy!

    respond_to do |format|
      format.html { redirect_to church_members_path, notice: "Church member was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_church_member
      @church_member = ChurchMember.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def church_member_params
      params.expect(church_member: [ :first_name, :last_name, :date_of_birth, :date_joined ])
    end
end
