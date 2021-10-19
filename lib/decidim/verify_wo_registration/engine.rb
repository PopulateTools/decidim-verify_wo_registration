# frozen_string_literal: true

require 'rails'
require 'decidim/core'

module Decidim
  module VerifyWoRegistration
    # This is the engine that runs on the public interface of verify_wo_registration.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::VerifyWoRegistration

      routes do
        # Add engine routes here
        resources :verifications, only: %i[new create]
        # root to: "verify_wo_registration#index"
      end

      initializer 'verify_wo_registration.mount_routes' do |_app|
        Decidim::Core::Engine.routes do
          mount Decidim::VerifyWoRegistration::Engine => '/verify_wo_registration'
        end
      end
    end
  end
end
