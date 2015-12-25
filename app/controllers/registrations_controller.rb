class RegistrationsController < Devise::RegistrationsController

  def new
    return super if ENV['ENABLE_SIGNUP']
    flash[:info] = 'Registrations are disabled. Visit the Github page to learn how to enable.'
    redirect_to root_path
  end

  def create
    return super if ENV['ENABLE_SIGNUP']
    flash[:info] = 'Registrations are disabled. Visit the Github page to learn how to enable.'
    redirect_to root_path
  end

  def edit
    @active_section = :settings
    render layout: 'main_app'
  end
end
