class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success]="投稿しました"
      redirect_to user_movie_path(current_user,@movie)
    else
      flash[:danger]="投稿に失敗しました"
      render 'movies/show'
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end