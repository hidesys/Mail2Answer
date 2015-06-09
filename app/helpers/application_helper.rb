module ApplicationHelper
  def title
    @title ? "#{@title} - #{APPNAME}" : APPNAME
  end
end
