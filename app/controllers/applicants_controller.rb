class ApplicantsController < ApplicationController 

  def index
    @applicants = Applicant.all 
  end

  def show 
    @applicant = Applicant.find(params[:id])
    @pets = Pet.all
    if params[:search_name].present? 
      @found_pets = Pet.search(params[:search_name])
    end 
    if params[:pet_id].present?
      @applicant.add_pet(params[:pet_id])
    end 
    if params[:description].present? 
      @applicant.update(description: params[:description])
      @applicant.update(status: 1)
    end
  end

  def new 
  end

  def create 
    applicant = Applicant.new(applicant_params)
    if applicant.valid? 
       applicant.update(status: "In Progress")
       redirect_to "/applicants/#{applicant.id}"
    else
      flash[:alert] = "Error: #{error_message(applicant.errors)}"
      redirect_to "/applicants/new"
    end
  end
  
  def update
    applicant = Applicant.find(params[:id])
    applicant = Applicant.find(params[:id])
  end

  def edit 
    @applicant = Applicant.find(params[:id])
  end

  private 
  def applicant_params 
    params.permit(:id, :name, :street_address, :city, :state, :zip_code)
  end
end