class EntitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entity = Entity.new
    @categories = Category.created_by_current_user(current_user)
  end

  def index
    @entities = Entity.all
    @category = Category.find(params[:category_id])
  end

  def create
    params = entity_params
    @entity = Entity.new(params)
    @entity.author = current_user
    @categories_ids = params[:categories_ids]

    @categories_ids&.each do |id|
      category = Category.find(id) unless id == ''
      @entity.categories.push(category) unless category.nil?
    end

    if @entity.save
      category_id = @entity.categories.first.id if @entity.categories.first
      redirect_to category_entities_path(category_id), notice: 'Transaction added successfully'
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, category_ids: [])
  end

  def create_general_category
    @general = current_user.categories.where(name: 'General').first

    if @general.nil?
      @general = Category.create(name: 'General',
                                 icon: 'https://icons8.com/icon/SUtMjRvQFq1J/exchange', author: current_user)
    end

    @general
  end
end
