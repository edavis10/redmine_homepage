ActionController::Routing::Routes.draw do |map|
  map.home '', Homepage.to_route if Homepage.instance
end
