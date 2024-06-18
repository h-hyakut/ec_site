class CompletesController < ApplicationController

def create
  @complete = Complete.new(complete_params)

  respond_to do |format|
    if @complete.save
      CompleteMailer.complete_mail(@complete).raise_delivery_errors

      format.html { redirect_to @complete,
      notice: "To do task was successfully created." }
      format.json {render :show, status: :created, location: @complete }
    else
      format.html { render :new }
      format.json { render json: @complete.erros,
      status: :unprocessable_entity }
    end
  end
end