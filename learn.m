function [ w ] = learn(X,t)

	[n m]=size(X);
	A=[X ones(1,n)']; %se adauga o coloana de 1
	B=A'*A;
	[L U]=crout(B);  %pentru rezolvarea ecuatiei am folosit algoritmul Crout (factorizare LU)
	y=sit(L,A'*t');  %am rezolvat sistemul pentru matricea inferior triunghiulara
	w=sst(U,y);  %sistemul pentru matricea superior triunghiulara

endfunction
