class AppsController < InheritedResources::Base
  actions :index, :show, :new, :create
  respond_to :html
  respond_to :json, :only => [:show]
end
