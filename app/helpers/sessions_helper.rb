module SessionsHelper
    #Pour obtenir un utilisateur connecté
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    #Definir une méthode qui renvoie true si l'utilisateur est connecté, false sinon
    def logged_in?
        current_user.present?
    end
end
