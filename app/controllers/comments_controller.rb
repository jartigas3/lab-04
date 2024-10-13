class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]  # Solo usuarios autenticados pueden crear, editar o eliminar
    load_and_authorize_resource  # Usa CanCanCan para autorizar acciones
    before_action :correct_user, only: [:edit, :update, :destroy]
  
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user = current_user  # Asigna el comentario al usuario actual
  
      if @comment.save
        redirect_to @post, notice: 'Comentario creado con éxito.'
      else
        redirect_to @post, alert: 'Error al crear el comentario.'
      end
    end
  
    def edit
      @comment = Comment.find(params[:id])
      @post = @comment.post
    end
  
    def update
      @comment = Comment.find(params[:id])
  
      if @comment.update(comment_params)
        redirect_to @comment.post, notice: 'Comentario actualizado con éxito.'
      else
        render :edit, alert: 'Error al actualizar el comentario.'
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @post = @comment.post
      @comment.destroy
      redirect_to @post, notice: 'Comentario eliminado con éxito.'
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end

    def correct_user
        @comment = Comment.find(params[:id])
        unless @comment.user == current_user
          redirect_to post_path(@comment.post), notice: "No tienes permiso para realizar esa acción."
        end
      end
  end
  