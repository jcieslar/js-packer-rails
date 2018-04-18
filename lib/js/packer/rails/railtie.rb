require 'js/packer/rails/view_helpers'
require 'rails'

module Js
  module Packer
    module Rails
      class Railtie < ::Rails::Railtie
        initializer "js_packer_rails.view_helpers" do
          ActionView::Base.send :include, ViewHelpers
        end
      end
    end
  end
end
