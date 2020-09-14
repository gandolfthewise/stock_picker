require 'pry'
def stock_picker(stock_prices)
  total_array = []
  stock_prices.map.with_index do |val, index|
    current_val_array = []
    index.upto(stock_prices.length-1) do |i|
      current_val_array.push(stock_prices[i]-val)
    end
    total_array.push(current_val_array)
  end
  largest_diff = total_array.flatten.max {|a, b| a <=> b}
  best_buy = 0
  best_days_array = []
  total_array.each_index do |x|
    if total_array[x].include?(largest_diff) 
      best_buy=x
      best_days_array.push(x)
    end
  end
  best_days_array.push(total_array[best_buy].index(largest_diff)+best_buy)
  p best_days_array
end

stock_picker([17,3,6,9,15,8,6,1,10])