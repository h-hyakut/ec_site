class CompletesController < ApplicationController

def create
  @complete = Complete.new(complete_params)

  respond_to do |format|
    if @complete.save
      CompleteMailer.complete_mail(@complete).raise_delivery_errors

      format.html { redirect_to @complete,
      notice: "Your order has been successfully completed." }
      format.json {render :show, status: :created, location: @complete }
    else
      format.html { render :new }
      format.json { render json: @complete.errors,
      status: :unprocessable_entity }
    end
  end
end