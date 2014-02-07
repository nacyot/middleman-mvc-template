class Routes < MiddlemanRoutes

  # usage : proxy_collection articles, "#target#", "/articles/template.html", :article, :ignore => true
  def self.proxy_routes
  end

  # usage: "./source/index.html.haml" => { controller: MainController, action: "index" },
  def self.controller_routes 
    {
    }
  end
end
