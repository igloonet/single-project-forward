# frozen_string_literal: true

module SingleProjectForward
  module WelcomeControllerPatch
    def index
      # Only redirect logged-in users
      if User.current.logged?
        projects = Project.visible.active.to_a

        if projects.length == 1
          redirect_to project_path(projects.first)
          return
        end
      end

      super
    end
  end
end
