%SAMPLE STOCK
rate = 0.1;
volatility = 0.35;

%SAMPLE OPTION
strike = 40;

range = 10:70; %theoretical range of stock price

months = 12;
j = 1:1:months; %1 to 12 incr by 1 

Span = length(range); %61
formatj = j(ones(Span,1),:)'/months; %j(rows, cols)/12 rows
formatRange = range(ones(length(j),1),:);
format = ones(size(formatj)); %matrix of 1's in correct format

%Black-Scholes Sensitivity to Underlying Price Volatility
%blsvega(Price, Strike, Rate, Time, Volatility)
vega = blsvega(formatRange, strike*format, rate*format, formatj, volatility*format);

%disp(vega)

mesh(range, j, vega, 'edgecolor', 'b');
xlabel('Stock Price ($)');
ylabel('Time (months)');
zlabel('Vega');
title('Call Option Price Volatility');
axis([10 70  1 12  -inf inf]);
view(-40, 50);