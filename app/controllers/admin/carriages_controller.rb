# frozen_string_literal: true

class Admin::CarriagesController < Admin::BasisController
  before_action :set_carriage, only: %i[show edit update destroy]
  before_action :set_train

  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def create
    @carriage = @train.carriages.new(carriage_params)

    if @carriage.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage.becomes(Carriage)
      redirect_to admin_train_carriage_path(@carriage)
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_train_path
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:number, :train_id, :type, :top_seats,
                                     :lower_seats, :side_lower_seats,
                                     :side_top_seats)
  end
end
