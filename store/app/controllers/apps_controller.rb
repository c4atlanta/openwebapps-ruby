class AppsController < InheritedResources::Base
  actions :index, :show
  respond_to :html
  respond_to :json, :only => [:show]
end
