ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.destroy_all_not_found_requests "/not_found_requests/destroy_all", :controller => 'not_found_requests', :action => 'destroy_all', :conditions => {:method => :delete}
  end
end