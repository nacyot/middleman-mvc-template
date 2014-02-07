class MainController < MiddlemanController
  def introduction(data)
    @name = "NacyoT"
    @hell = data[:writing].title
  end
end



