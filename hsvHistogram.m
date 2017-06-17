function [ y ] = hsvHistogram(img, count_bins)

	i=imread(img); %Citirea imaginii
	[n m p]=size(i);
	r=i(:,:,1); %separarea matricei tridimensionale obtinute in matrici simple
	g=i(:,:,2);
	b=i(:,:,3);
	R=double(r)/255; 
	G=double(g)/255;
	B=double(b)/255;
	MAX=max(R,max(G,B)); %Obtinerea matricei cu elementele maxime
	MIN=min(R,min(G,B)); %Matricea cu elementele minime
	d=MAX-MIN;
	[H S V]=deal(zeros(n,m),zeros(n,m),zeros(n,m));
	H(d==0)=0;
	H(MAX==R)=60*mod((G(MAX==R)-B(MAX==R))./(d(MAX==R)+0.00001),6); %transpunerea formulelor din enunt pentru H, S si V
	H(MAX==G)=60*((B(MAX==G)-R(MAX==G))./(d(MAX==G)+0.00001)+2);
	H(MAX==B)=60*((R(MAX==B)-G(MAX==B))./(d(MAX==B)+0.00001)+4);
	H=H./360;  %normarea valorilor lui H
	S(MAX>0)=d(MAX>0)./MAX(MAX>0);
	V=MAX;
	[a b c]=deal(zeros(1,count_bins),zeros(1,count_bins), zeros(1,count_bins));  %initializarea cu 0 a vectorilor caracteristici pentru H, S si V
	for i=1:count_bins
		a(i)=sum(((H>=((i-1)*1.01/count_bins))&(H<(i*1.01/count_bins)))(:));
		b(i)=sum(((S>=((i-1)*1.01/count_bins))&(S<(i*1.01/count_bins)))(:));
		c(i)=sum(((V>=((i-1)*1.01/count_bins))&(V<(i*1.01/count_bins)))(:));
	end
	
	y=[a b c]; %concatenarea sirurilor obtinute
endfunction
