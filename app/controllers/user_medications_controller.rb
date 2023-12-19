class UserMedicationsController < ApplicationController
  before_action :authorize, except: [:index]

  def index
    render json: UserMedication.all, include: :medication,status: :accepted
  end

  def create
    user_medication = current_user.user_medications.build(user_medications_params)

    if user_medication.save
      render json: user_medication, include: :medication, status: :created
    else
      render json: { error: "Unable to create user medication" }, status: :unprocessable_entity
    end
  end

  def update
    user_medication = current_user.user_medications.find_by(id: params[:id])

    if user_medication
      if user_medication.update(user_medications_params)
        render json: user_medication, include: :medication, status: :accepted
      else
        render json: { error: "Unable to update user medication" }, status: :unprocessable_entity
      end
    else
      render json: { error: "User medication not found or unauthorized" }, status: :not_found
    end
  end

  def destroy
    user_medication = current_user.user_medications.find_by(id: params[:id])
    if user_medication
      if user_medication.destroy
        render json: {message: "Record deleted successfully"}, status: :accepted
      else
        render json: {error: "Unable to delete record"}, status: :unprocessable_entity
      end
    else
      render json: {error: "Record not found"}, status: :unprocessable_entity
    end
  end
  

  private
  def current_user
    User.find_by(id: session[:user_id]) if session.include?(:user_id)
  end

  def user_medications_params
    params.permit(:medication_id, :start_date, :completion_date, :notes)
  end
end
