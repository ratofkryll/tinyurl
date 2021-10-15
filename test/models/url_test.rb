require "test_helper"

class UrlTest < ActiveSupport::TestCase
  test "it accepts valid URLs" do
    url = urls(:valid)
    assert url.valid?
  end

  test "it rejects invalid URLs" do
    url = urls(:invalid)
    assert !url.valid?
  end
end
