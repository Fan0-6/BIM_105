
% Name: 
% Student ID: 

% Lab 4: The Poisson Distribution and RNA-Seq
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
r = poissrnd(10, 1000, 1); %{[10.0360]  [9.8766]}
mr = mean(r);
vr = var(r); 

questions.q1 = {mr, vr};

% Q2:
n = 10000; 
p = 0.001;
lambda = n*p; 
points=0:1:20; 

pdf_bino = binopdf(points, n, p);
pdf_poiss = poisspdf(points, lambda);

figure('Name', 'Question 2');
bar(points, [pdf_bino', pdf_poiss']);
ylabel('Probability')
xlabel("Outcome")
legend("Binomial", "Poisson")

questions.q2 = "Answer.";

% Q3:
ti = [200 300 1000 500 450];
ni = [5 3 5 7 10];
np = 200; 

counts = rna_seq_sim(ti, ni, np);

questions.q3 = counts; %[15 13 63 18 36]

% Q4:
pgenes = (counts./(ti-5))/sum(counts./(ti-5)); %[0.1537 0.0914 0.1295 0.3088 0.3165]

questions.q4 = pgenes; 

% Q5: 
questions.q5 = "Answer.";

% Q6:
ti = [200 300 1000 500 450];
ni = [5 3 5 7 10];
np = 200; 

nSim = 1000; 
count_A = NaN(nSim, 1);

for i = 1:nSim
    counts = rna_seq_sim(ti, ni, np);
    count_A(i) = counts(1); 
end

figure('Name', 'Question 6');
histogram(count_A)
xlabel("Counts")

questions.q6 = "See figure.";

% Q7:
figure('Name', "Question 7");
hold on 

histogram(count_A, "Normalization", "pdf")
xlabel("Counts")
mc = mean(count_A);
points = 0:1:25; 
plot(points, poisspdf(points, mc));

questions.q7 = "Answer.";

% Q8:
nSim = 1000; 
count_A = NaN(nSim, 1);

for i = 1:nSim
    counts = rna_seq_sim(ti, poissrnd(ni), np); 
    count_A(i) = counts(1);
end

figure('Name', "Question 8");
histogram(count_A, "Normalization", "pdf")
xlabel("Counts")

questions.q8 = "See figure."; 

% Q9:
figure('Name', 'Question 9 and 10')
hold on

histogram(count_A, "Normalization", "pdf")
xlabel("Counts")
mc = mean(count_A);
points = 0:1:25;
plot(points, poisspdf(points, mc))

questions.q9 = "Answer.";

% Q10:
params = nbinfit(count_A);
plot(points, nbinpdf(points, params(1), params(2)))
legend("Observed Data", "Poisson Fit", "Negative Binomial Fit")

questions.q10 = "Answer."; 

% Q11:
questions.q11 = "Answer.";

disp(questions)


