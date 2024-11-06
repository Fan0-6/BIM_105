
% Name: 
% Student ID: 

% Lab 7: Limiting Behavior of Markov Chains
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

questions.q6 = 0;

% Q7:

questions.q7 = 0;

% Q8:

questions.q8 = 0;

% Q9:

questions.q9 = 0;

% Q10:

questions.q10 = 0;

% Q11:

questions.q11 = 0;

% Q12:

%%From worksheet:
file = fastaread('Ecoli-k12-genome.fasta');
seq = file.Sequence;
di_nuc_counts = zeros(4);
for i = 1:length(seq)-1

 di_nuc = seq(i:i+1); % Read dinucleotide

 row = nuc_to_index(di_nuc(1)); % Convert letters to index for matrix
 col = nuc_to_index(di_nuc(2)); % Convert letters to index for matrix

 di_nuc_counts(row, col) = di_nuc_counts(row, col) + 1;

end
transition_matrix = di_nuc_counts./sum(di_nuc_counts, 2);
display(transition_matrix);

questions.q12 = 0;

% Q13:

questions.q13 = 0;

% Q14:

questions.q14 = 0;

% Q15:

questions.q15 = 0;

% Q16:

questions.q16 = 0;

% Final answers:
disp(questions);

function index = nuc_to_index(nuc)
switch nuc
 case {'A', 'a'}
 index = 1;
 return
 case {'T', 't'}
 index = 2;
 return
 case {'G', 'g'}
 index = 3;
 return
 case {'C', 'c'}
 index = 4;
 return
end
end
