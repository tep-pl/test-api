class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::StrongParameters
  include CanCan::ControllerAdditions

  before_filter :authenticate_user!
  respond_to :json

  # Handle authorization exception from CanCan
  rescue_from CanCan::AccessDenied do |exception|
    render json: {errors: ["Insufficient privileges"]}, status: :forbidden
  end

end
