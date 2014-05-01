module ApplicationHelper
  def auth_token
    '<input type="hidden" value="form_authenticity_token" name="authenticity_token"></input>'.html_safe
  end
end
