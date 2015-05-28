module Api
  module V1
    module CustomDevise
      class RegistrationsController < Devise::RegistrationsController
        prepend_before_filter :require_no_authentication, :only => [ :create ]

        respond_to :json

        # POST /resource
        def create
          data = auth_params.clone
          data.delete :accessToken

          build_resource(data)

          user = User.find_by(userId: auth_params[:userId])
          if user != nil
            if resource.active_for_authentication?
              resource.reset_authentication_token
              user.update_attributes(authentication_token: resource.authentication_token)
              render json: { accessToken: user.authentication_token, firstName: user.firstName, lastName: user.lastName, roles: [0,1]}, status: :ok
            else
              render json: { cause: "User's account inactive" }, status: :forbidden
            end
          else
            resource.reset_authentication_token
            if resource.save
              if resource.active_for_authentication?
                sign_up(resource_name, resource)
                user = User.find_by(userId: auth_params[:userId])

                render json: { accessToken: user.authentication_token, firstName: "John", lastName: "Doe", roles: [0,1]}, status: :created
              else
                render json: { cause: "User's account inactive" }, status: :forbidden
              end
            else
              clean_up_passwords resource
              render json: { cause: resource.errors.full_messages }, status: :unprocessable_entity
            end
          end
        end

        def update_resource(resource, params)
          resource.update_without_password(params)
        end

        private
          def auth_params
            params.permit(:userId, :accessToken)
          end
      end
    end
  end
end
