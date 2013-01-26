#!/bin/env ruby
# encoding: utf-8

class CommentsController < ApplicationController
   def new
    @title = "Comment"
    @comment = Comment.new
  end
  
  def create
    params[:comment][:status] = "Opened"
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to root_path, :notice => 'Commentaire envoyé avec succès.'
    else
      flash.now[:notice] = "Erreur à la création du commentaire. Réessayez."
      render :new
    end
  end
end
