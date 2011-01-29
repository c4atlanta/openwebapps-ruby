require 'test_helper'

class RegisterTest < ActionDispatch::IntegrationTest
  fixtures :all

  context "Registering a new app" do
    before do
      get "/apps/new"
    end

    should "work" do
      assert_response :success
    end
    
    %w[name description base_url launch_path developer_name developer_url contact_email].each do |f|
      should "have a field for #{f}" do
        assert_select "[id=app_#{f}]"
        # assert_select "label[for=user_#{f}]"
      end
    end
  end
  
end
