require 'rails'

module Js
  module Packer
    module Rails
      module ViewHelpers
        def js_bundle_tag(*sources)
          sources.uniq.map do |source|
            content_tag :script, '', src: "#{js_bundle_path(source)}"
          end.join("\n").html_safe
        end

        def js_bundle_hash(source)
          bundle_name = js_bundle_name(source)
          bundle_name.gsub("#{source}-", '').gsub('.js', '')
        end

        def js_bundle_name(source)
          manifest_file = File.read(manifest_path(source))
          manifest = JSON.parse(manifest_file)
          manifest[source + '.js']
        end

        def js_bundle_path(source)
          bundle_name = js_bundle_name(source)
          "/#{config_bundle_path}/#{bundle_name}"
        end

        private

        def manifest_path(source)
          "#{::Rails.root}/#{config_manifest_path}/#{source}.json"
        end


        def config?
          File.exist?("#{::Rails.root}/config/packer.yml")
        end

        def config
          YAML.load_file("#{::Rails.root}/config/packer.yml")[::Rails.env]
        end

        def config_manifest_path
          config? ? config['manifest_path'] : 'public/bundles/javascripts'
        end

        def config_bundle_path
          config? ? config['bundle_path'] : 'bundles/javascripts'
        end
      end
    end
  end
end
