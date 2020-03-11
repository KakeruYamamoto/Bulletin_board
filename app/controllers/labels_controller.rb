class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # @labels = Label.all
    if params[:label_id] == "1"
      @label = Label.find(1)
      @post = @label.posts
    end
    if params[:label_id] == "2"
      @label = Label.find(2)
      @post = @label.posts
    end
    if params[:label_id] == "3"
      @label = Label.find(3)
      @post = @label.posts
    end
    if params[:label_id] == "4"
      @label = Label.find(4)
      @post = @label.posts
    end
    if params[:label_id] == "5"
      @label = Label.find(5)
      @post = @label.posts
    end
    if params[:label_id] == "6"
      @label = Label.find(6)
      @post = @label.posts
    end
    if params[:label_id] == "7"
      @label = Label.find(7)
      @post = @label.posts
    end
    if params[:label_id] == "8"
      @label = Label.find(8)
      @post = @label.posts
    end
    if params[:label_id] == "9"
      @label = Label.find(9)
      @post = @label.posts
    end
  end

  def show
  end

  def new
    @label = Label.new
  end

  def edit
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to @label, notice: 'ラベルを作成しました！'
    else
      render :new
    end
  end

  def update
    if @label.update(label_params)
      redirect_to @label, notice: 'ラベルを更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @label.destroy
    redirect_to labels_url, notice: 'ラベルを削除しました！'
  end

  private

  def set_label
    @label = Label.find(params[:id])
  end

  def label_params
    params.require(:label).permit(:name)
  end
end
