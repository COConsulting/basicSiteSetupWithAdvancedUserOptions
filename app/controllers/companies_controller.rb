class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  

  # Doesn't work right now. Causes an error on the page. Can look into it later when other users besides admins are editing the page.
  # before_validation :strip_numbers_of_characters

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.order(sort_column + " " + sort_direction)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show

  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    
    if user_signed_in?
      @company.user_id = current_user.id
    else
      @company.user_id = 1
    end

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update

    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy

    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:company_name, :description, :office_phone, :fax_phone, :email, :website, :non_profit, :charity_navigator, :guide_star, :address_1, :address_2, :city, :state, :country, :zip_code, :latitude, :longitude, :facebook, :twitter, :google_plus, :instagram, :pinterest, :tubler, :published)
    end

    def sort_column
      Company.column_names.include?(params[:sort]) ? params[:sort] : "company_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def check_user
      if user_signed_in? && current_user.security_level != 5
        redirect_to root_url, alert: "I am sorry, but that page is only available for administrators."
      elsif user_signed_in? && current_user.security_level == 5
        flash[:success] = "You are signed in as an administrator."
      else
        redirect_to companies_path, alert: "I am sorry, but that page is only available for administrators."
      end
    end

    # Doesn't work right now
    def strip_numbers_of_characters
     company.office_phone = office_phone.to_s.gsub(/\D/, '')
     company.fax_phone = fax_phone.to_s.gsub(/\D/, '')
    end
end
