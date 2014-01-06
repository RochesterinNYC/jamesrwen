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
  def projects
    @title = "Class Projects"
  end
  def ta
    @title = "Teaching Assistant"
  end
  def hackathons
    @title = "Hackathons"
  end
  def portfolio
    @title = "Portfolio"
  end
  def miscellaneous
    @title = "Miscellaneous"
  end
end