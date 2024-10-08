
% Name:
% Student ID:

% Lab 2: Probabilities, Bayes' Formula, Estimating Population Size
% Due: Friday, October 18, 2024 at 9:00 AM
% BIM 105, Fall 2024
% University of California, Davis

%% Instructions: Enter your answers below each corresponding question header.
% Your code should produce the necessary outputs and/or plots, depending
% on what each question requests. Explanations should be
% entered as comments using the '%' symbol.

% This lab includes a several qualitative questions. In particular, several 
% questions (Q2,Q3) ask if a computation "agrees" with a prior probability 
% calculation while (Q5,Q8,Q10,Q11) all require some further explanations. 
% Please respond to these question with comments under the appropriate 
% question in addition to doing the required numerical calculations.

% Some code provided within the prompt has been inserted into this template
% for you. Uncomment the provided code when you reach the relevant section
% of the lab by removing the percentile operator (%). 

% Q1:
questions.q1 = "Answer.";

% Q2: 
% figure;
% N_simulations = 10000;
% transferred_balls = NaN(N_simulations, 1);
% sampled_balls = NaN(N_simulations, 1);
%  
% for i = 1:N_simulations
%     jar1 = [1, 1, 1, 0, 0];
%     jar2 = [1, 1, 0, 0];
%  
%     transferred_balls(i) = randsample(jar1, 1);
%     jar2 = [jar2, transferred_balls(i)];
%     sampled_balls(i) = randsample(jar2, 1);
% end
%  
% disp('Proportion of Drawn Balls which are Green:')
% display(sum(sampled_balls)/N_simulations)

questions.q2 = "Answer.";

% Q3:
% prob_green_transferred_given_green_draw = sum(sampled_balls(transferred_balls == 1))/sum(sampled_balls);
questions.q3 = "Answer.";

% Q4:
questions.q4 = "Answer.";

% Q5:
questions.q5 = "Answer.";

% Q6:
questions.q6 = "Answer.";

% Q7:
questions.q7 = "Answer.";

% Q8:
% figure;
% N = [50, 100, 150, 200, 300, 400];
% B = [5, 10, 15, 20, 25];
% p0 = zeros(length(N), length(B));
% k = 0;
% for i=1:length(N)
%     for j=1:length(B)
%         p0(i,j) = mark_recapture_prob(N(i), B(j), B(j), k);
%     end
% end
% figure()
% bar(p0(:, 2))
% xlabel('Population Size')
% xticklabels(cellstr(num2str(N(:))))
% ylabel('Probability of Sampling 0 Tagged Animals')

questions.q8 = "Answer.";

% Q9:
questions.q9 = "Answer.";

% Q10:
questions.q10 = "Answer.";

% Q11:
% figure;
% N = 100;
% B = 20;
% n = 15;
% population = zeros(N, 1);
% tags = randsample(1:N, B, false); % Randomly sample animals to tag
% population(tags) = 1; % Mark tagged animals
% N_sims = 100; % Number of simulations
% r_estimated_wr_i = NaN(N_sims, 1); % Estimates for ratio of tagged animals with replacement
% r_estimated_wor_i = NaN(N_sims, 1); % Estimates for ratio without replacement
% for i = 1:N_sims
% samples = randsample(1:N, n, true);
% k_tagged = sum(population(samples));
% r_estimated_wr_i(i) = k_tagged/n;
% samples = randsample(1:N, n, false);
% k_tagged = sum(population(samples));
% r_estimated_wor_i(i) = k_tagged/n;
% end
% N_estimated_wr = B./r_estimated_wr_i; % Population size estimates with replacement
% N_estimated_wor = B./r_estimated_wor_i; % Population size estimates without replacement
% figure()
% histogram(N_estimated_wr, 0:5:5*N)
% hold on
% histogram(N_estimated_wor, 0:5:5*N)
% plot([100, 100],[0, N_sims/2], '--r')
% xlabel('Estimated Population Size')
% ylabel('Number of Simulations')
% legend('Sampling With Replacement','Sampling Without Replacement')

questions.q10 = "Answer.";
disp(questions);

% Binomial Distribution 
function result = bin_dist(N, B, n, k) 
result = binopdf(k, n, B/N);
end

% Hypergeometric Distribution
function result = mark_recapture_prob(N, B, n, k)
result = nchoosek(N-B, n-k)*nchoosek(B, k)/nchoosek(N, n);
end
