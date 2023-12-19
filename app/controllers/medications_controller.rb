class MedicationsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_response

  before_action :authorize, except: [:index]

  def index
    render json: Medication.all, status: :ok
  end

  def create
    if unpermitted_params.present?
      render json: { error: 'Unpermitted parameters found' }, status: :unprocessable_entity
      return
    end

    medication = Medication.new(medication_params)
    if medication.save
      render json: medication, status: :created
    else
      render json: medication.errors, status: :unprocessable_entity
    end
  end

  def update
    medication = Medication.find_by(id: params[:id])
    
    if medication
      if medication.update(medication_params)
        render json: medication, status: :accepted
      else
        render json: { error: "Unable to update medication" }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unable to find medication" }, status: :not_found
    end
  end
  
  def destroy
    medication = Medication.find_by(id: params[:id])
    if medication
      if medication.destroy
      render json: {message: "Successfuly deleted medication"}, status: :accepted
      else
      render json: {error: "Unable to delete medication"}, status: :unprocessable_entity
      end
    else
      render json: {error: "Cannot find medication"}, status: :not_found
    end
  end

  private
  def medication_params
    params.permit(:name, :form, :frequency, :dosage_quantity, :dosage_units, :instructions, :description)
  end

  def unpermitted_params
    allowed_params = medication_params.keys.map(&:to_sym)
    unpermitted = params.keys.map(&:to_sym) - allowed_params
    unpermitted.present? ? unpermitted : nil
  end
end
