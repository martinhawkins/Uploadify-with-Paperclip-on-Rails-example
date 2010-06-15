require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Upload.new.valid?
  end
end
