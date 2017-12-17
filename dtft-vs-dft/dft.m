function X = dft(x, N)
n=0:length(x)-1;
K=0:N-1;
wn=exp(-1i*2*pi/N);
nK=n'*K;
wNnK=wn.^nK;
X=x*wNnK;