class PostsController < ApplicationController
  def upload
  	
  end

  def show
  	@post = Post.find_by :id => params[:id]
  end

  def index
  	@posts = Post.all
  end

  def update
  end

  def delete
  	Post.find(params[:id]).destroy
  	redirect_to action: "index"
  end

  def create
  	File.open(Rails.root.join('assets', 'images', 'uploads', params[:source].original_filename), 'wb') do |file|
    	file.write(params[:source].read)
    end
	@post = Post.create(source: params[:source].original_filename, description: params[:description])
	redirect_to action: "show", id: Post.find(@post.id)
  end
end
