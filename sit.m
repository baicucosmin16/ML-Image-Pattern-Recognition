function [ x ] = sit(A,b)
%Functia pentru calcularea unui sistem inferioar triunghiular
	[n n]=size(A);
	x=zeros(1,n);
	x(1)=b(1)/A(1,1);
	for i=2:n
		s=0;
		for j=1:i-1
			s=s+A(i,j)*x(j);
		end
		x(i)=(b(i)-s)/A(i,i);
	end
endfunction
