class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find_by(params[:id])
    start_date = @reservation.start.strftime('%Y%m%d').to_i
    end_date = @reservation.end.strftime('%Y%m%d').to_i
    day = end_date - start_date
    @total = day * @reservation.number_of_people * @room.price
  end

  def new
    @reservation = Reservation.new(new_reservation_params)
    @room = Room.find(params[:id])
  end

  def create
    @reservation = Reservation.new(create_reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      redirect_to @reservation, notice: "新規予約をしました。"
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    if @reservation.user != current_user
      redirect_to reservations_path(@reservation), alert: "不正なアクセスです。"
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(create_reservation_params)
      redirect_to reservation_path(@reservation), notice: "予約内容を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to "/users/#{@reservation.user.id}/reservation", notice: "予約を取り消しました。"
  end

  private
  def new_reservation_params
    params.permit(:user_id,:room_id, :start, :end, :number_of_people)
  end

  def create_reservation_params
    params.require(:reservation).permit(:user_id, :room_id, :start, :end, :number_of_people)
  end
end
