  class SecretCodesController < ApplicationController
  before_action :authenticate_user!
    before_action :secret_code, only: [:destroy]

    def create
      authorize! :create, SecretCode
      if params[:code_count].present?
        params[:code_count].to_i.times do 
          hex_code = SecureRandom.hex(3)
          SecretCode.create(code: hex_code)
        end
        flash[:notice]="Secret Codes Has been generated successfully!"
      else
        flash[:notice]=" Please Try Again!"
      end
      redirect_to root_path
    end


    def destroy
      authorize! :create, SecretCode
      if @secret_code.destroy
        flash[:notice]="Secret code was successfully destroyed."
      else
       flash[:notice]=" Please Try Again!"
     end

     redirect_to root_path
   end

   private
   def secret_code
    @secret_code = SecretCode.find(params[:id])
  end

end
