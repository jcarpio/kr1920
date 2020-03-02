% if stock_market_crash -> buy_stoks.

% buy_stocks :- stock_market_crash. % 2. rule


% if donald_trump send_twitter with the words
%   new crisis -> wait a day to buy

% send(donald_trump, new_crisis, twitter) -> buy_stocks.

buy_stocks :- send(donald_trump, "new_crisis", twitter).

% send(Sender, Message, Where)
% this is true when Sender send Message to Where 
% mass media.

  
send(donald_trump, "new_crisis", twitter).
