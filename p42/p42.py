import csv
C = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
D = dict()
T = []
count = 0
for i in range(len(C)):
    D[C[i]] = i+1
print(D)

def triangle_number(N):
    H = 0
    for i in range(1, N):
        H = H + i
    return H

def word_to_code(WORD):
    S = 0
    for i in WORD:
        S = S + D[i]
    return S

for i in range(1, 1000):
    T.append(triangle_number(i))
with open("p42_words.txt", 'r') as f:
    CSVreader = csv.reader(f, delimiter=",", quotechar="\"")
    for row in CSVreader:
        A = row
for i in A:
    g = word_to_code(str(i))
    print(g)
    if(g in T):
        count += 1
print(count)
