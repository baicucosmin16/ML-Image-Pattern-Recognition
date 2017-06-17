function [ x ] = rgbHistogram(img,count_bins)

	i=imread(img); %Aici se citeste imaginea primita ca paramtru
	[n m p]=size(i);
	[R G B]=deal(floor(double(i(:,:,1))/(256/count_bins)+1),floor(double(i(:,:,2))/(256/count_bins)+1),floor(double(i(:,:,3))/(256/count_bins)+1));
%Am realizat impartirea schemei rgb in count_bins parti si am folosit deal pentru o atribuire multipla
	[a b c]=deal(accumarray(R(:),1),accumarray(G(:),1),accumarray(B(:),1)); %Contorizarea valorilor rgb in intervalele date
	[a b c]=deal(a',b',c'); %transpune rezultatele obtinute deoarece accumarray returneaza rezultatul sub forma de matrice cu o coloana
	[a b c]=deal([a,zeros(1,count_bins-length(a))],[b,zeros(1,count_bins-length(b))],[c,zeros(1,count_bins-length(c))]); %completarea cu zero-uri pana la count_bins elemente
	x=[a b c]; %concatenarea celor 3 siruri obtinute

endfunction
