class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
    before_action :set_comment, only: [:edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
  
    def create
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @post, notice: 'Comentario creado exitosamente.'
      else
        redirect_to @post, alert: 'No se pudo crear el comentario.'
      end
    end
  
    def edit
    end
  
    def update
      if @comment.update(comment_params)
        redirect_to @post, notice: 'Comentario actualizado exitosamente.'
      else
        render :edit
      end
    end
  
    def destroy
      @comment.destroy
      redirect_to @post, notice: 'Comentario eliminado exitosamente.'
    end
  
    private
  
    def set_post
      @post = Post.find(params[:post_id])
    end
  
    def set_comment
      @comment = @post.comments.find(params[:id])
    end
  
    def correct_user
      unless @comment.user == current_user
        redirect_to @post, alert: "No tienes permiso para realizar esa acción."
      end
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  