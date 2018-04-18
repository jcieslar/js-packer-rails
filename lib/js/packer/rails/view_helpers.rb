module Js
  module Packer
    module Rails
      module ViewHelpers
        def js_test(name)
          content_tag :script, 'abcdefg'
        end

        def js_bundle_tag(*sources)
          sources.uniq.map do |source|
            bundle_name = js_bundle_name(source)
            bundle_path = "/bundles/javascripts/#{bundle_name}"
            content_tag :script, '', src: "#{bundle_path}"
          end.join("\n").html_safe
        end

        def js_bundle_hash(source)
          bundle_name = js_bundle_name(source)
          bundle_name.gsub("#{source}-", '').gsub('.js', '')
        end

        def js_bundle_name(source)
          manifest_file = File.read("#{Rails.root}/public/bundles/javascripts/#{source}.json")
          manifest = JSON.parse(manifest_file)
          bundle_name = manifest[source + '.js']
        end
      end
    end
  end
end
