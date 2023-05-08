class RoomsController < ApplicationController
before_action :authenticate_user!, except: [:index]
before_action :set_search

  def index
    @rooms = Room.all.order(id: "DESC")
    @q = Room.ransack(params[:q])
    @rooms = @q.result
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to room_path(@room), notice: "お部屋を投稿しました。"
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    if @room.user != current_user
      redirect_to rooms_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room), notice: "お部屋を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to room_path(room), notice: "お部屋を削除しました。"
  end

  private

  def room_params
    params.require(:room).permit(:image, :address, :about, :price)
  end
end
