class BlocksController < ApplicationController
  def index
    blocks = BlockResource.all(params)
    respond_with(blocks)
  end

  def show
    block = BlockResource.find(params)
    respond_with(block)
  end

  def create
    block = BlockResource.build(params)

    if block.save
      render jsonapi: block, status: 201
    else
      render jsonapi_errors: block
    end
  end

  def update
    block = BlockResource.find(params)

    if block.update_attributes
      render jsonapi: block
    else
      render jsonapi_errors: block
    end
  end

  def destroy
    block = BlockResource.find(params)

    if block.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: block
    end
  end
end
