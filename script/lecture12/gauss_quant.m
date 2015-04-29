% This function visualizes the quantization of a standard normal
% distribution into N bins. To generate the histogram 2000^2 random 
% samples are generated from a standard normal.

% Random samples
rng('default')
x = randn(2000); x = x(:);

% Parameters for the quantization
N = 20; % number of bins
edges = linspace(-4,4,N); % bin edges
delta = edges(2) - edges(1); % bin width

% Quantization
n = histc(x,edges);
n = n / (delta*sum(n));

figure
hold all
% Half shift (0.5*delta) for centering the bins
bar(edges + 0.5*delta,n)
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','b', 'LineWidth',2)

% PDF of the underlying RV
y = linspace(-4,4,1000);
plot(y,normpdf(y),'k','LineWidth',2)
xlim([-4 4])
xlabel('x')
ylabel('p(x)')