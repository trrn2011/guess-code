require 'csv'
data = [{name: "apple", price: 200}, {name: "banana", price: 300}, {name: "orange", price: 200}]

# result = data.each_with_object({}) do |x,o|
#   p o
#   price = x[:price]
#   if o[price]
#     o[price][:name] << ",#{x[:name]}"
#   else
#     o[price] = x
#   end
# end.values
#
# p result

csv_data = CSV.read('guess_sheet.csv', headers: true)

data_2 = []
csv_data.each do |data|
  p data
  data.each do |d|
    p d[1]
    if d[1] =~ /^[0-9]+$/

      data_2 << {name: "#{data[0]}(#{d[0]})", price: d[1], time: d[0]}

    end


  end

end


result = data_2.each_with_object({}) do |x, o|
  price = x[:price]
  if o[price]
    o[price][:name] << ",#{x[:name]}"
    if o[price][:time] != x[:time]
      o[price][:time] = "mix"
    end
  else
    o[price] = x
  end
end.values

p result

# code = ""
#
# result.each do |data|
#   code << data[:name]
# end
#
# p code