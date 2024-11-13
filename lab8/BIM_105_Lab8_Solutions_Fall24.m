
% Name: SOLUTION
% Student ID: XXXXXXXXX

% Lab 8: Modeling Cancer with Markov Chains
% BIM 105, Fall 2024
% University of California, Davis

%% Instructions: Enter your answers below each corresponding question header.
% Your code should produce the necessary outputs and/or plots, depending
% on what each question requests. Wordy answers or explanations should be
% enterred as comments using the '%' symbol.

% Q1:
answers.q1 = 'The transition probabilty to any of these sites should be zero.';


% Q2:
P = xlsread('cancer_model.xls');
answers.q2 = P(:,2);


% Q3:
figure;
bar(P(23,:))
xlabel('Site')
xticks(1:50);
ylabel('Transition Probability')
title('Transition Probabilities from Lungs to Other Sites')
answers.q3 = 'Site 24 (lymph nodes, reg.) is the most likely transition.';


% Q4:
P100 = P^100;
ldist = P(1,:);
answers.q4 = ldist;


% Q5:
chain = sim_MC(P, 23, 100);
counts = histc(chain, 1:50);
answers.q5 = 'The lymph node (reg.) site appears most frequently.';


% Q6:
fp_heart = NaN(1000, 1);
fp_pancreas = NaN(1000, 1);
fp_lymph = NaN(1000, 1);
for i = 1:1000
    chain = sim_MC(P, 23, 10000);
    fp_heart(i) = find(chain==17, 1)-1;
    fp_pancreas(i) = find(chain==28, 1)-1;
    fp_lymph(i) = find(chain==24, 1)-1;
end
answers.q6a = mean(fp_heart);
answers.q6b = mean(fp_pancreas);
answers.q6c = mean(fp_lymph);


% Q7:
Q28 = P;
Q28(28,:) = 0;
Q28(:,28) = 0;
T28 = (eye(50)-Q28)\ones(50,1);

Q24 = P;
Q24(24,:) = 0;
Q24(:,24) = 0;
T24 = (eye(50)-Q24)\ones(50,1);

answers.q7 = [T28(23), T24(23)];


% Final answers:
disp(answers)