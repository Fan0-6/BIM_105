%% Part 0
a=5;
b=20;
c=sqrt(a)*b;
display(c)

d=20

%% Part 1

% Q1
n_seqs = 4^12

% Q2
n_aa_seqs = factorial(4)

% Q3
n_aa_methionine = factorial(3)

% Q4
n_aa_protein = n_aa_methionine * 4 * 6 * 4

% Q5
n_percentage = (n_aa_protein/n_seqs) * 100

% Q6
num = 0; 
for k = 0:4 
    n = nchoosek(5,k)*nchoosek(4,k);
    num = num + n;

end

display(num)

% Q7
num_15 = 0;

for k_15 = 0:15 
    n_15 = nchoosek(15,k_15)*nchoosek(15,k_15); 
    num_15 = num_15+n_15; 
end

display(num_15)