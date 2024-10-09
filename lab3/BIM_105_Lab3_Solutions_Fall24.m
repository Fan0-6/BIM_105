% Name: 
% Student ID: 

% Lab 3: Sanger Sequencing 
% Due: Friday, October 25, 2024 at 9:00 AM
% BIM 105, Spring 2024
% University of California, Davis

%% Instructions: Enter your answers below each corresponding question header.
% Your code should produce the necessary outputs and/or plots, depending
% on what each question requests. Wordy answers or explanations can be
% entered as comments using the '%' symbol or output directly to the 
% Command Window.


% Q1:
figure; 
k = 0:10;
pdf_95 = geopdf(k, 1-0.95);
pdf_70 = geopdf(k, 1-0.7);
pdf_50 = geopdf(k, 1-0.5);

plot(k, pdf_50, '-bs');
hold on; 
plot(k, pdf_70, '-gs');
plot(k, pdf_95, '-rs');

ylim([0, 0.2]);
ylabel('Probability');
xlim([0.5 10.5]);
xticks(1:10);
xlabel('k');
legend('p=0.95','p=0.7','p=0.5');
title('Probability of Ending at 0.5, 0.7 and 0.95-th T in S');
questions.q1 = "Answer."; 

% Q2:
questions.q2 = "Answer.";

% Q3:
questions.q3 = "Answer.";

% Q4:
figure; 
p = 0:0.001:1;
n_exp_1 = 1./geopdf(0, 1-p);
n_exp_2 = 1./geopdf(1, 1-p);
n_exp_3 = 1./geopdf(2, 1-p);

plot(p, n_exp_1);
hold on; 
plot(p, n_exp_2)
plot(p, n_exp_3)
xlim([0 1])
xlabel('Proportion of Good Nucleotides')
ylabel('Expected Number of Experiments')
ylim([0 10])
legend('k=1','k=2','k=3')

questions.q4 = "See graph.";
    

% Q5:
questions.q5 = "Answer."; 

% Q6:
p = 0:0.001:1;
p_opt_1 = (1-1)/1;
p_opt_2 = (2-1)/2;
p_opt_3 = (3-1)/3;

n_exp_1 = 1./geopdf(0, 1-p_opt_1);
hold on; 
n_exp_2 = 1./geopdf(1, 1-p_opt_2);
n_exp_3 = 1./geopdf(2, 1-p_opt_3);

plot(p_opt_1,n_exp_1,'*g')
hold on; 
plot(p_opt_2, n_exp_2,'*r')
plot(p_opt_3, n_exp_3,'*y')

xlim([0 1])
xlabel('Proportion of Good Nucleotides')
ylabel('Expected Number of Experiments')
ylim([0 10])
legend('k=1','k=2','k=3')

questions.q6 = "Answer.";

% Q7:
figure;
p = 0.5;
Nk = 30;
N_experiments = 100;
outcomes = NaN(N_experiments, 1);
for i = 1:N_experiments
outcomes(i) = min([geornd(1-p)+1, Nk+1]);
end
display(outcomes)

figure;
p = 0.8;
Nk = 30;
N_experiments = 10000;
outcomes = NaN(N_experiments, 1);
for i = 1:N_experiments
outcomes(i) = min([geornd(1-p)+1, Nk+1]);
end
histogram(outcomes)

figure;
p = 0.9;
Nk = 30;
N_experiments = 10000;
outcomes = NaN(N_experiments, 1);
for i = 1:N_experiments
outcomes(i) = min([geornd(1-p)+1, Nk+1]);
end
histogram(outcomes)

questions.q7 = "Answer.";

% Q8:
figure;
p = 0.8;
Nk = 30;
N_experiments = 10000;
outcomes = NaN(N_experiments, 1);
for i = 1:N_experiments
outcomes(i) = min([geornd(1-p)+1, Nk+1]);
end
histogram(outcomes)

figure;
p = 0.9;
Nk = 30;
N_experiments = 10000;
outcomes = NaN(N_experiments, 1);
for i = 1:N_experiments
outcomes(i) = min([geornd(1-p)+1, Nk+1]);
end
histogram(outcomes)

Nk = 30;
p = (Nk-1)/Nk;
N_experiments = 10000;
outcomes = NaN(N_experiments, 1);
for i = 1:N_experiments
outcomes(i) = min([geornd(1-p)+1, Nk+1]);
end
histogram(outcomes)
xlabel('fragments length')
ylabel ('counts')

questions.q8 = "Answer.";

% Q9:
figure;
Nk = 30;  % Length of the DNA sequence
p = (Nk-1)/Nk;  % Proportion of good nucleotides
N_experiments = 10000;
outcomes = NaN(N_experiments, 1);
for i = 1:N_experiments
outcomes(i) = min([geornd(1-p)+1, Nk+1]);
end
histogram(outcomes)
hold on 

plot([0,32],[100,100],'--r')
xlabel('fragments length')
ylabel ('counts')
questions.q9 = "Answer.";
disp(questions);
