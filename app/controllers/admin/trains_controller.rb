# frozen_string_literal: true

class Admin::TrainsController < Admin::BasisController
  before_action :set_train, only: %i[show edit update destroy]

  def index
    @trains = Train.all
  end

  def show; end

  def new
    @train = Train.new
  end

  def edit; end

  def create
    @train = Train.new(train_params)

    if @train.save
      redirect_to admin_trains_path, notice: 'Train was successfully created.'
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to admin_trains_path, notice: 'Train was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to admin_trains_path, notice: 'Train was successfully destroyed.'
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :current_railway_station_id,
                                  :route_id, :order_carriage)
  end
end
