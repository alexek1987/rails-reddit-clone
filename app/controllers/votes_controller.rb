class VotesController < ApplicationController

  def create
    post_id = params[:post_id]

    vote = Vote.new
    vote.post_id = params[:post_id]
    vote.upvote = params[:upvote]
    vote.user_id = current_user.id


 existing_vote = Vote.where(user_id: current_user.id, post_id: post_id)

    respond_to do |format|
      format.js {
        if existing_vote.size > 0
          existing_vote.first.destroy
        else
          # save new vote
          if vote.save
            @success = true
          else
            @success = false
        end
      end
      @post = Post.find(post_id)

        render "votes/create"
      }
  end
end
private

  def vote_params
    params.require(:vote).permit(:upvote, :post_id)
  end

end


