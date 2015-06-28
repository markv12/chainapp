class ChainsController < ApplicationController
  def create
    @chain = Chain.new(chain_params)
    @chain.user = current_user
    if @chain.length >= 0
      @chain.last_check_in = @chain.start_date
      if @chain.save
        flash[:notice] = "Chain Created"
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def check_in
    respond_to do |format|
      if params[:user_id].to_i == current_user.id
        @chain = Chain.find(params[:chain_id]);
        @chain.last_check_in = Date.today
        if @chain.save
          format.html { render :json => { }, :status => 200 }
        else
          format.html { render :json => { :error => "error saving chain" }, :status => 500 }
        end
      else
        format.html { render :json => { :error => "incorrect user" }, :status => 500 }
      end
    end
  end

  def delete_chain
    respond_to do |format|
      if params[:user_id].to_i == current_user.id
        @chain = Chain.find(params[:chain_id]);
        @chain.destroy
        format.html { render :json => { }, :status => 200 }
      else
        format.html { render :json => { :error => "incorrect user" }, :status => 500 }
      end
    end
  end

  def chain_params
    params.require(:chain).permit(:name, :description, :start_date)
  end
end
