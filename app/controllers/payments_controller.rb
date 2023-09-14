class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # POST /payments or /payments.json
  def create
    params = payment_params
    @payment = Payment.new(name: params[:name], amount: params[:amount])
    @payment.user_id = current_user.id

    respond_to do |format|
      if @payment.save
        @categories_ids = params[:categories]
        @categories_ids.each do |element|
          next if element == ''

          payment_group = PaymentGroup.new(group_id: element.to_i)
          payment_group.payment = @payment
          payment_group.save
        end
        format.html { redirect_to groups_url, notice: 'Payment was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, categories: [])
  end
end
