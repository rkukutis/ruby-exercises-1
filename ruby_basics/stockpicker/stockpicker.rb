def stock_picker(price_array)
  best_profit = 0
  min_price = price_array[0]
  min_price_day = 0
  best_days = [0, 0]

  price_array.each_with_index do |price, day|
    if price < min_price
      min_price = price
      min_price_day = day
    elsif price - min_price > best_profit
      best_profit = price - min_price
      best_days = [min_price_day, day]
    end
  end
  best_days
end

prices = [17,3,6,9,15,8,6,1,10]
p stock_picker(prices)
