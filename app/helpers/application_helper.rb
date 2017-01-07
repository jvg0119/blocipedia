module ApplicationHelper

	def flash_class(type)
    case type
      when "success" then "alert alert-success" # green
      when "info" then "alert alert-info"       # blue
      when "notice" then "alert alert-info"     # blue
      when "warning" then "alert alert-warning" # yellow
      when "alert" then "alert alert-warning"   # yellow
      when "danger" then "alert alert-danger"   # red
      when "error" then "alert alert-danger"    # red
    end
  end

end
