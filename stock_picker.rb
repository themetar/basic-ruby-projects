def stock_picker(stock_prices)
  buy_day = sell_day = profit = 0
  potential_buy_day = 0
  potential_buy_price  = stock_prices.first

  # walk along the days
  stock_prices.each_with_index do |price, day|
    # if "today's" price is smaller than the prices so far
    # mark it for potential best sale
    if price < potential_buy_price
      potential_buy_day = day
      potential_buy_price = price
    end

    # if "today's" price makes for a better profit
    # choose potential buy day as best day to buy
    # and choose "today" as best day to sell.
    # buy day will either
    # a) actualize a potential best buy day, or
    # b) in the case where the prices get higher and higher,
    #    just rewrite the same value over and over 
    if price - potential_buy_price > profit
      buy_day   = potential_buy_day
      sell_day  = day
      profit = price - potential_buy_day
    end
  end

  # return best values
  [buy_day, sell_day]
end
