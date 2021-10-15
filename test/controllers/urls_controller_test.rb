require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest
  fixtures :urls

  setup do
    @url = urls(:valid)
  end

  test "redirects" do
    get url_url(@url)
    assert_redirected_to @url.long_url
  end

  test "shortens valid urls and redirects to url info" do
    post '/', params: { url: { long_url: 'http://foo.com' } }
    follow_redirect!
    assert_match /\/info$/, path
  end

  test "reuses short codes when exists" do
    post '/', params: { url: { long_url: urls(:valid).long_url } }
    assert_redirected_to info_url_path(@url)
  end

  test "logs visits with IP" do
    visit_count = @url.visits.count
    get url_url(@url)
    assert visit_count + 1, @url.visits.count
  end

end
