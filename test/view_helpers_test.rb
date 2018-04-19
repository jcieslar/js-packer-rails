require 'minitest/autorun'
require 'js/packer/rails/view_helpers'

class ViewHelpersTest < Minitest::Test
  include Js::Packer::Rails::ViewHelpers

  def test_config?
    refute config?
  end

  def test_config_manifest_path
    assert_equal 'public/bundles/javascripts', config_manifest_path
  end

  def test_config_bundle_path
    assert_equal 'bundles/javascripts', config_bundle_path
  end

  def test_manifest_path
    assert_equal '/public/bundles/javascripts/admin.json', manifest_path('admin')
  end

  def test_bundle_path
    assert_equal '/bundles/javascripts/admin', bundle_path('admin')
  end
end
