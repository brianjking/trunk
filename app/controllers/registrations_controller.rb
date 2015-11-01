class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registrations are disabled. Visit the Github page to learn how to enable.'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Registrations are disabled. Visit the Github page to learn how to enable.'
    redirect_to root_path
  end
end
