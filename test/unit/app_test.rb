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

    should "not be approved" do
      assert !@app.approved?
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

    should "add base_url to app_urls" do
      @app.app_urls = []
      @app.base_url = "http://example.com/appbase"
      @app.save
      assert_equal ["http://example.com/appbase"], @app.app_urls
    end

    should "have a developer hash" do
      assert @app.developer
      assert_equal "Demo Dev", @app.developer[:name]
      assert_equal "http://example.com/demodev", @app.developer[:url]
    end

    should "have a hacky icons hash" do
      assert @app.icons
      assert_equal @app.icon_path, @app.icons['96']
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

      should "have a release" do
        assert @manifest =~ /"release":/
      end

      should "not have contact_email" do
        assert_nil @manifest =~ /"contact_email":/
      end

      should "not have twitter_account" do
        assert_nil @manifest =~ /"twitter_account":/
      end

      should "not have icon image path" do
        assert_nil @manifest =~ /"icon_path":/
      end

      should "not have category" do
        assert_nil @manifest =~ /"category":/
      end

      should "not have approved" do
        assert_nil @manifest =~ /"approved":/
      end

      should "not have id" do
        assert_nil @manifest =~ /"id":/
      end

      should "have an icons hash" do
        assert @manifest =~ /"icons":\s*\{/
      end
    end
  end
end
