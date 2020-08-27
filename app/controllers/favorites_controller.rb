class FavoritesController < ApplicationController
  
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    flash[:success] = "いいね済み"
    redirect_back(fallback_location: books_path(book))
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    flash[:success] = "いいねを取り消しました"
    redirect_back(fallback_location: books_path(book))
  end
end
