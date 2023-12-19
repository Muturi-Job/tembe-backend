class DosesController < ApplicationController
  before_action :authorize, except: [:index]

  def index
    render json: Dose.all, status: :accepted
  end

  def create
    dose = Dose.new(dose_params)
    if dose.save
      render json: dose, status: :accepted
    else
      render json: {error: "Unable to create record"}, status: :unprocessable_entity
    end
  end

  def update
    dose = Dose.find_by(id: params[:id])
    if dose
      if dose.update(dose_params)
        render json: dose, status: :accepted
      else
        render json: {error: "Unable to update record"}, status: :unprocessable_entity
      end
    else
      render json: {error: "Record not found"}, status: :unprocessable_entity
    end
  end

  def destroy
    dose = Dose.find_by(params[:id])
    if dose
      if dose.destroy
        render json: {message: "Record deleted successsfully"}, status: :accepted
      else
        render json: {error: "Unable to delete record"}, status: :unprocessable_entity
      end
    else
      render json: {error: "Record not found"}, status: :unprocessable_entity
    end
  end
  private
  def dose_params
    params.permit(:user_medication_id, :scheduled_time, :taken_time, :missed)
  end
end
