module Admin
  class HomeController < ActionController::Base
    def index
      render text: "Override Root-Path or HomeController to edit this page"
    end
  end
end