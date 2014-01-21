class PagesController < ApplicationController
  def index
  end
  def about
    @title = "ABOUT"
  end
  def education
    @title = "EDUCATION"
  end
  def ta
    @title = "TEACHING NOTES"
  end
  def miscellaneous
    @title = "MISCELLANEOUS"
  end
end