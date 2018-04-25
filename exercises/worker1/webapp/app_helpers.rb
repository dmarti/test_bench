module AppHelpers
  def hello
    raw("HELLO")
  end

  def h(text)
    Rack::Utils.escape_html(text)
  end

  def nav_link(label, path)
    """
    <li class='nav-item'>
      <a class='nav-link' href='#{path}'>#{label}</a>
    </li>
    """
  end

  def nav_text(label)
    """
    <li class='nav-item'>
      <span class='navbar=text'>#{label}</span>
    </li>
    """
  end

  def current_user
    @current_user ||= User.find_by_email(session[:usermail])
  end

  def user_mail
    current_user&.email
  end

  def user_name
    user_mail&.split("@")&.first
  end

  def logged_in?
    current_user
  end
end
