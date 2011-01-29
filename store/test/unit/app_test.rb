require 'test_helper'

class AppTest < ActiveSupport::TestCase
  context "A new Application" do
    before do
      @app = App.new
    end

    should "have an array of app URLs" do
      assert_equal [], @app.app_urls
      @app.app_urls.push "http://example.org/app1"
    end


  end

  context "Demo Application" do
    before do
      @app = App.first
      @app.app_urls = ["http://example.org/app1"]
    end

    should "have a manifest" do
      assert @app.manifest
    end

    should "have a developer hash" do
      assert @app.developer
      assert_equal "Demo Dev", @app.developer[:name]
      assert_equal "http://example.com/demodev", @app.developer[:url]
    end

    context "manifest" do
      before do
        @manifest = @app.manifest
      end

      should "not have root element" do
        assert_nil @manifest =~ /\{"application":/
      end

      should "have a developer node" do
        assert @manifest =~ /"developer":/
      end

      should "not have unscoped developer attrs" do
        assert_nil @manifest =~ /"developer_name":/
        assert_nil @manifest =~ /"developer_url":/
      end

      should "not have date attrs" do
        assert_nil @manifest =~ /"created_at":/
        assert_nil @manifest =~ /"updated_at":/
      end
    end
  end
end
