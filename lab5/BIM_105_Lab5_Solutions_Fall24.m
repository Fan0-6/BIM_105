
% Name: SOLUTION
% Student ID: XXXXXXXXX

% Lab 5: Branching Processes
% BIS|MAT 107, Spring 2024
% University of California, Davis

%% Instructions: Enter your answers below each corresponding question header.
% Your code should produce the necessary outputs and/or plots, depending
% on what each question requests. 

% Housekeeping 
clearvars
clc
questions = struct();


% Q1:
X = sim_branching_poisson(1.88, 10);
figure;
p = plot(0:1:10, X);
xlabel('Generation')
ylabel('Outbreak Size')
questions.q1 = p;


% Q2:
Xs = NaN(11, 100);
for i = 1:100
    Xs(:, i) = sim_branching_poisson(1.88, 10);
end
figure;
p = plot(0:1:10, Xs);
xlabel('Generation')
ylabel('Outbreak Size')
questions.q2 = p;


% Q3:
questions.q3 = mean(Xs(11, :));


% Q4:
questions.q4 = sum(Xs(11,:)==0)/100;


% Q5:
lambda = 1.88;
questions.q5 = sum(lambda.^(0:1:10));


% Q6:
Xs_cum = cumsum(Xs);
mean_Xs_cum10 = mean(Xs_cum(end, :));
questions.q6 = ['The total number of infections in our simulations agrees with ' ...
    'the prediction from Question 5.'];


% Q7a:
load('secondary_infections.mat');
params = nbinfit(counts);
questions.q7a = params;

% Q7b
f = figure;
hold on
histogram(counts, 'Normalization', 'probability');
plot(0:1:35, nbinpdf(0:1:35, params(1), params(2)));
xlim([-0.5 34])
xticks(0:1:33)
xlabel('Secondary Infections')
ylabel('Probability')
questions.q7b = f;

% Q7c
plot(0:1:35, poisspdf(0:1:35, 1.88))
legend('Data', 'Negative Binomial', 'Poisson');
questions.q7c = 'A Negative Binomial seems to be a better model.';


% Q8a:
Xs_NB = NaN(11, 100);
for i = 1:100
    Xs_NB(:,i) = sim_branching_nbin(params(1), params(2), 10);
end
figure;
p = plot(0:1:10, Xs_NB);
xlabel('Generation')
ylabel('Outbreak Size')
questions.q8a = mean(Xs_NB(11,:));

% Q8b
questions.q8b = sum(Xs_NB(11,:)==0)/100;

% Q8c
Xs_NB_cum = cumsum(Xs_NB);
mean_Xs_NB_cum10 = mean(Xs_NB_cum(end,:));
questions.q8c = mean_Xs_NB_cum10;

% Q8d
questions.q8d = ['The total outbreak sizes are comparable, but the proportion ' ...
    'of outbreaks that end by the 10th generation is much higher in the NB model.'];

% Final answers:
disp(questions);



function X = sim_branching_poisson(lambda, n_max)
 
X = zeros(1, n_max+1); % Initialize infection counts to zero
X(1) = 1; % Single infection at X0
 
for n = 1:n_max
    
    counts = 0;
 
    for i = 1:X(n)
        counts = counts + poissrnd(lambda);
    end
 
    X(n+1) = counts; % Total number of secondary infections
 
end
end 

function X = sim_branching_nbin(r, p, n_max)
 
X = zeros(1, n_max+1); % Initialize infection counts to zero
X(1) = 1; % Single infection at X0
 
for n = 1:n_max
    
    counts = 0;
 
    for i = 1:X(n)
        counts = counts + nbinrnd(r, p);
    end
 
    X(n+1) = counts; % Total number of secondary infections
 
end
end 

function M = laplace_gamma(s, alpha, beta)
M = (beta^alpha)/((s + beta)^alpha);
end