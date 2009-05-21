class Homepage
  include Singleton

    attr_accessor :controller
    attr_accessor :action
    attr_accessor :id
    attr_accessor :params

  class << self  
    def config=(configuration)
      self.instance.controller = configuration.delete(:controller) if configuration.key?(:controller)
      self.instance.action = configuration.delete(:action) if configuration.key?(:action)
      self.instance.id = configuration.delete(:id) if configuration.key?(:id)

      self.instance.params = configuration unless configuration.empty?
      self
    end

    def to_route
      route = {}
      route[:controller] = self.instance.controller if self.instance.controller
      route[:action] = self.instance.action if self.instance.action
      route[:id] = self.instance.id if self.instance.id
      route = route.merge(self.instance.params) if self.instance.params
      route
    end
  end
end
