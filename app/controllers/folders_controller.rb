class FoldersController < ApplicationController
  def index
    folders = FolderResource.all(params)
    respond_with(folders)
  end

  def show
    folder = FolderResource.find(params)
    respond_with(folder)
  end

  def create
    folder = FolderResource.build(params)

    if folder.save
      render jsonapi: folder, status: 201
    else
      render jsonapi_errors: folder
    end
  end

  def update
    folder = FolderResource.find(params)

    if folder.update_attributes
      render jsonapi: folder
    else
      render jsonapi_errors: folder
    end
  end

  def destroy
    folder = FolderResource.find(params)

    if folder.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: folder
    end
  end
end
