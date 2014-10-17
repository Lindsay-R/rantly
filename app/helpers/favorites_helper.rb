module FavoritesHelper
  def favorite_button favorite_rant
    if @favorites.find_by(:rant_id => favorite_rant.id, :user_id => current_user.id) == nil
      button_to 'Favorite', user_rant_favorite_path(current_user.id, favorite_rant.id)
    else
      button_to 'Unfavorite', user_rant_favorite_path(current_user.id, favorite_rant.id), method: :delete
    end
  end
end