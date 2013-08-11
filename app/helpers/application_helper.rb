module ApplicationHelper
  def header
	if user_signed_in?
      link_to "Выход", destroy_user_session_path, :method => :delete 
	else
	  link_to "Вход", new_user_session_path
      link_to "Регистрация", new_user_registration_path
    end
  end
end
