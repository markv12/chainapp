class FrontPageController < ApplicationController
  def index
    if current_user
      @chains = current_user.chains
    end
    @empty_chain = Chain.new()
  end
end
