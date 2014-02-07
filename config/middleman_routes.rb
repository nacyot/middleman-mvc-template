class MiddlemanRoutes
  def self.set_managers(proxy_manager, ignore_manager)
    @@proxy_manager = proxy_manager
    @@ignore_manager = ignore_manager
  end

  def self.register_proxy(path, template, opts)
    @@proxy_manager.proxy path, template, opts
  end

  def self.register_ignore(template)
    @@ignore_manager.ignore template
  end

  # def self.register_collection_proxy(controller, action)
  #   controller.new.send(action)
  # end

  def self.proxy_collection(collection, path, template, local_variable_name, opts={})
    collection.each do |item|
      opts[:locals] = opts[:locals] ? opts[:locals].merge({local_variable_name.to_sym => item}) : {local_variable_name.to_sym => item}
      item_path = path.sub(/\#(.*?)\#/) do
        if item.respond_to? $1
          item.send($1)
        else
          item[$1]
        end
      end
      MiddlemanRoutes.register_proxy item_path, template, opts
    end
    MiddlemanRoutes.register_ignore template
  end

end
