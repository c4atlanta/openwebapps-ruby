class AppsController < InheritedResources::Base
  actions :index, :show, :new, :create
  respond_to :html
  respond_to :json, :only => [:show]

  protected
  def collection
    @apps ||= end_of_association_chain.find_all_by_approved(true)
  end
end
