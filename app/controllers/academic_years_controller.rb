class AcademicYearsController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @academic_year.update_attributes(academic_year_params)
      flash[:success] = "Academic year successfully created."
      redirect_to academic_years_path and return
    else
      flash.now[:error] = "Academic year could not be created."
      render :index
    end
  end

  def edit
  end

  def update
    # FIXME: check for uniqueness here (i.e., if year X exists, don't let
    # the user update this year to X).
    if @academic_year.update_attributes(academic_year_params)
      flash[:success] = "Academic year successfully updated."
      redirect_to academic_years_path and return
    else
      flash.now[:error] = "Academic year could not be updated."
      render :edit
    end
  end

  def destroy
    # If this year contains the active quarter, we don't want to delete it.
    # (Deleting an academic year will delete all of the quarters it owns.)

    # if @academic_year.contains_active_quarter
    #   if @academic_year.destroy
    #     flash[:success] = "Academic year successfully deleted."
    #     redirect_to academic_years_path and return
    #   else
    #     flash.now[:error] = "Academic year could not be deleted."
    #     render :index
    #   end
    # else
    flash.now[:error] = "Academic year could not be deleted."
    render :index
    # end
  end

  private

  def academic_year_params
    params.require(:academic_year).permit(:year)
  end

end
