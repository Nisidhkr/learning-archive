
f= open('nisidh.txt','r')
while True:
    line=f.readline()
    # print(line)
    if not line:
        break
    print(line)