class PagesController < ApplicationController
  def index
    @title = "Home"
  end
  def about
    @title = "About"
  end
  def education
    @title = "Education"
  end
  def ta
    @title = "Teaching Assistant"
  end
  def miscellaneous
    @title = "Miscellaneous"
  end
end