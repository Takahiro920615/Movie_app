class CommentsController < ApplicationController
  before_action :current_user, only:[:edit,:update]

  def create
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      create_notification(@comment)
      flash[:success]="投稿しました"
      redirect_to user_movie_path(current_user,@movie)
    else
      flash[:danger]="投稿に失敗しました"
      render 'movies/show'
    end
  end

  def edit
    @comment= Comment.find(params[:id])
  end

  def update
    @comment = Comment.all
      if @comment.update(comment_params)  # ここでcomment_paramsを渡すように変更
        flash[:success] = "コメントを更新しました"
        redirect_to user_movie_url
      else
        render :edit
      end
  end
 

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      flash[:success]="コメントを削除しました"
    else
      flash[:danger]="コメントの削除に失敗しました"
    end
    redirect_to user_movie_path(@comment.movie.user_id, @comment.movie)
  end
  

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def create_notification(comment)
    user_id = comment.user_id # コメントのユーザーIDを取得
    user = User.find(user_id)
    movie = comment.movie
    if movie.present?
    Notification.create(user_id:user_id, comment_id: comment.id, read: false)
    end
  end
end