module Admin
  class ApplicationController < Administrate::ApplicationController
    http_basic_authenticate_with(
      name: Rails.application.credentials.dig(:admin_name),
      password: Rails.application.credentials.dig(:admin_password)
    )
  end
end
