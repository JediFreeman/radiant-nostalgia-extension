# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class NostalgiaExtension < Radiant::Extension
  version "0.3"
  description "Easily track and administer not found pages"
  url "http://github.com/thinkcreate/radiant-nostalgia-extension"
  
  def activate
    FileNotFoundPage.send :include, Nostalgia::FileNotFoundPageExtensions
    NotFoundRequest.reset_at ||= Time.now
    Radiant::Config['nostalgia.rewrites_part_name'] ||= 'rewrites'
    
    # disable dashboard widget by default, you can enable if you wish.
    # this widget can get very large very quickly and cause the dashboard
    # to load up slowly.
    
    #if admin.respond_to?(:dashboard)
    #  admin.dashboard.index.add :extensions, 'not_found_requests'
    #end
  end
  
  def deactivate
  end
  
end
