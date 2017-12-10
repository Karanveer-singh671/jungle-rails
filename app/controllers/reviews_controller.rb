class ReviewsController < ApplicationController
    before_action :set_review, only: [:destroy]
  
    # def create
    #         raise "Yay, I'm here!"
    
      @review = Review.new(review_params)
      @product = Product.find(params[:product_id])
      @review.product = @product
    #   @review.breed = @mom_dog.breed
      # @review.user = current_user
      @review.user = current_user
      if @review.save
        redirect_to @product, notice: 'Review was successfully created.'
      else
        # We didn't test this during class
        # It is based on the blog example you all did on Wednesday
        # What has to change to make it work?
        render @product
      end
  
    def destroy
      @review.destroy
      redirect_to @review.product, notice: 'view successfully deleted'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_review
        @review = Review.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def review_params
        params.require(:review).permit(:description)
      end
    end
    