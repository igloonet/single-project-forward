# frozen_string_literal: true

require_relative 'lib/welcome_controller_patch'

Redmine::Plugin.register :single_project_forward do
  name 'Single Project Forward'
  author 'igloonet (originally James Kassemi)'
  url 'https://git.igloonet.cz/redmine/single_project_forward'
  description 'Redirects user to their project if they only have access to one project.'
  version '1.0.0'

  requires_redmine version_or_higher: '6.0.0'
end

Rails.configuration.to_prepare do
  unless WelcomeController.included_modules.include?(SingleProjectForward::WelcomeControllerPatch)
    WelcomeController.prepend(SingleProjectForward::WelcomeControllerPatch)
  end
end
