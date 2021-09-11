class FavoritesController < ApplicationController
    def create
        #current_userに紐づいたいいねを作成
        @favorite = current_user.favorites.create(recipe_id: params[:recipe_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        #どのレシピに紐づいたものか探す
        @recipe = Recipe.find(params[:recipe_id])
        #上記で設定した変数のIDをrecipe_idに渡す(ログイン中のユーザーのお気に入り)
        @favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
        @favorite.destroy
        #一つ前のURLが見つからなかったらroot_pathに戻る
        redirect_back(fallback_location: root_path)
    end
end
