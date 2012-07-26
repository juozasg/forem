module Forem
  class CategoriesController < ApplicationController
    helper 'forem/topics'

    load_and_authorize_resource

    def show
      @category = Category.find(params[:id])
    end
  end
end
