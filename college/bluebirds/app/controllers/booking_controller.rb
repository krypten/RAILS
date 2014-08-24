class BookingController < ApplicationController
  skip_before_action :authorize
  
  def books
    @books = Viewing.select(:timing).map(&:timing).uniq
  end

  def book
  	puts(params[:movie_id])
    #@movie = Movie.find_by(id: params[:movie_name])
    #puts(@movie)
    #puts(params[:movie_name])
    session[:movie] = params[:movie_id]
    session[:timing] = params[:timing]

    dat = params[:show_date]["(3i)"].to_i + 30 * params[:show_date]["(2i)"].to_i
    tod = Date.today.day + 30 * Date.today.month

    if (dat > (tod + 14)) || (dat < tod)
      flash[:notice] =  "Please query ticket within two weeks"
      redirect_to booking_book_path
      return
    end

    tmp = Tmp.new
    tmp.k = "year"
    tmp.h = params[:show_date]["(1i)"].to_s
    if tmp.save
      puts(tmp.h)
    end

    tmp = Tmp.new
    tmp.k = "month"
    tmp.h = params[:show_date]["(2i)"].to_s
    if tmp.save
      puts(tmp.h)
    end
    
    tmp = Tmp.new
    tmp.k = "day"
    tmp.h = params[:show_date]["(3i)"].to_s
    if tmp.save
      puts(tmp.h)
    end
    #session[:year] = params[:show_date]["(1i)"].to_i
    #session[:month] = params[:show_date]["(2i)"].to_i
    #session[:day] = params[:show_date]["(3i)"].to_i

    #@date = Date.parse("#{params[:show_date]['1i']}-#{params[:show_date]['2i']}-#{params[:show_date]['3i']}") if params[:show_date]
    #puts(@date)
    #session[:quantity] = params[:quantity]

    redirect_to booking_stage1_path
  end

  def stage1
  	session[:seat_type] = params[:seat_type]
  	session[:quantity] = params[:quantity]
    tot = params[:quantity][0].to_f * Pricing.find_by(:seat_type => params[:seat_type]).price.to_f
  	session[:total_amount] = tot
    session[:ticket_no] = 1

  	#puts(session[:total_amount])

  	redirect_to booking_stage2_path
  end

  def stage2
    #if (session[:user_id].present?)
      #redirect_to root_url, :notice => "Please Login to Book Tickets"
      #return
    #end

    if session[:ticket_no].to_i < session[:quantity][0].to_i
      session[:ticket_no] = session[:ticket_no].to_i + 1
      puts(session[:ticket_no])
      session[:screen_no] = params[:screen_no]
      session[:seat_no] = params[:seat_no]
      redirect_to new_ticket_path
      return
    else 
      redirect_to new_card_info_path
      return 
    end

  	#@audi = AudiInfo.all.find_by(:screen_no => params[:screen_no])
  	#for @audi.each do |a|
    #   if a.seat_no == params[seat_no]
  	#	session[:total_amount] = session[:total_amount] + a.seat_type.price ;
  	# @audi_infos


  end

  def tmp1
    @seats = Pricing.all.order(:price)
  end

  def tmp2
    year = Tmp.where(k: "year").first.h
    month = Tmp.where(k: "month").first.h
    day = Tmp.where(k: "day").first.h

    sdate = Date.new(year.to_i, month.to_i, day.to_i)

    Date
    @viewings = Viewing.where(:Movie_id => session[:movie])
    Ticket.where(:show_date => sdate).each do |t|
      @viewings = @viewings - t.Viewing
    end
    if (@viewings == nil)
      redirect_to root_url, notice: "Booking Full"
      return 
    end
    #@audi_infos = @viewings.audi_infos

  
  end
end

