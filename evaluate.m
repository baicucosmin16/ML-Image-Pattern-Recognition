function [ p  n ] = evaluate(directory,w, string, count_bins)

	[r s]=size(w);
	path_to_cats = strcat( directory,  '/cats/*jpg'); %crearea unei variabile cu calea catre toate pozele ce contin pisici, pentru test
	path_to_not_cats = strcat( directory,  '/not_cats/*jpg'); %directorul cu toate pozele care nu contin pisici, pentru test
	path_with_cats = strcat( directory,  '/cats/');
	path_with_not_cats = strcat( directory,  '/not_cats/');
	
	cats=dir(path_to_cats); %crearea unei liste cu pozele cu pisici
	not_cats=dir(path_to_not_cats);  %crearea unei liste cu pozele fara pisici
	n=0;  %initializarea numarului de imagini clasificate corect
	if (strcmp(string,'RGB')==1)
		for i=1:length(cats)
			x=rgbHistogram(strcat(path_with_cats,cats(i).name),count_bins);  % x este vectorul de caracteristici al pozei
			x=[x,1];
			if (w*x')>=0  %in cazul pozelor cu pisici, daca produsul dintre vectorul de invatare si transpusa vectorului x este >=0, se incrementeaza numarul de clasificari facute corect
				n=n++;
			end
		end
		for i=1:length(not_cats)
			x=rgbHistogram(strcat(path_with_not_cats,not_cats(i).name),count_bins);
			x=[x,1];
			if (w*x')<0  %daca produsul este negativ si poza este fara pisici, se incrementeaza numarul de clasificari facute corect
				n++;
			end
		end
	elseif (strcmp(string,'HSV')==1)  %acelasi algoritm se foloseste si in cazul in care se foloseste hitograma HSV
		for i=1:length(cats)
			x=hsvHistogram(strcat(path_with_cats,cats(i).name),count_bins);
			x=[x,1];
			if (w*x')>=0
				n++;
			end
		end
		for i=1:length(not_cats)
			x=hsvHistogram(strcat(path_with_not_cats,not_cats(i).name),count_bins);
			x=[x,1];
			if (w*x')<0
				n++;
			end
		end
	end
	p=(n/(length(cats)+length(not_cats)))*100; %calcularea procentului
end
	
