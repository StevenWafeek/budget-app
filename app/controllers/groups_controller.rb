class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.where(user_id: current_user.id)
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @payments_group = @group.payment_groups.order('created_at DESC')
  end

  # GET /groups/new
  def new
    @group = Group.new
    @icons = ['img1.png', 'img2.png', 'img3.png', 'img4.png', 'img5.png']
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_url(@group), notice: 'Group was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
