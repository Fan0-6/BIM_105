
% Name: 
% Student ID: 

% Lab 5: Branching Processes
% BIM 105, Fall 2024
% University of California, Davis

%% Instructions: Enter your answers below each corresponding question header.
% Your code should produce the necessary outputs and/or plots, depending
% on what each question requests. 

% Housekeeping 
clearvars
clc
questions = struct();

% Q1:

questions.q1 = 0;

% Q2:

questions.q2 = 0;

% Q3:

questions.q3 = 0;

% Q4:

questions.q4 = 0;

% Q5:

questions.q5 = 0;

% Q6:

questions.q6 = "Explanation.";

% Q7a:

questions.q7a = 0;

% Q7b:

questions.q7b = 0;

% Q7c:

questions.q7c = "Explanation.";

% Q8a:

questions.q8a = 0;

% Q8b:

questions.q8b = 0;

% Q8c:

questions.q8c = 0;

% Q8d:

questions.q8d = 0;


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