class GuessesController < ApplicationController

  require 'csv'

  def index

  end

  def import
    csv_data = CSV.read(params[:file].path, headers: true)
    if params[:time] == "1"
      time = 1
    elsif params[:time] == "2"
      time = 2
    elsif params[:time] == "3"
      time = 3
    else
      redirect_to root_path
    end


    data_2 = []
    csv_data.each do |data|
      if data[time] =~ /^[0-9]+$/

        data_2 << {name: data[0], price: data[time]}
      end

    end

    result = data_2.each_with_object({}) do |x, o|
      price = x[:price]
      if o[price]
        o[price][:name] << ",#{x[:name]}"
      else
        o[price] = x
      end
    end.values
    code = ""
    result.each do |data|
      code << "hline(#{data[:price]}, title='#{data[:name]}', color=red, linestyle=solid, linewidth=4)<br>plotshape(#{data[:price]}, color=#00000000, textcolor=red, offset=0, style=shape.labeldown, location=location.absolute, text='#{data[:name]}', show_last=1)<br>"
    end


    @code = "//@version=3
study(shorttitle='guess' , title='Guess Line', overlay=true)
#{code}
plot(close)"

  end
end
