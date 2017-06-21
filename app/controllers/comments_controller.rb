class CommentsController < ApplicationController
# before_action :require_permission, only: [:new]

      def index
  @comment = Comment.all
end


    def new
      @comment = Comment.new
    end

    def create
      

        #     @post = Post.find(params[:comment][:post_id])
        # # @comment = @post.comments.create(params[:comment])
        # #     redirect_to post_path(@post)

      @comment = Comment.new(commentParams)
       @comment.user_id = current_user[:id]
      if @comment.save
        
        flash[:success] = "Comment successfully added"
        redirect_to post_path(@comment.post_id)
      else
        render 'new'
      end
    end

    #   def create
    #     @post = Post.find(params[:post_id])
    #     @comment = @post.comments.create(params[:comment])
    #     redirect_to post_path(@post)
    #   end

    def destroy
       @post = Comment.find(params[:id])
       @comment = Comment.find(params[:id])
       @comment.destroy
       redirect_to post_path(@post[:post_id])
      end

      private

      def commentParams
        params.require(:comment).permit(:body, :post_id)
      end


#  private
#     # Use callbacks to share common setup or constraints between actions.
    
    
#     def require_permission
#     if user_signed_in == false
#         redirect_to root_path
#         #Or do something else here
#       end
#     end
end