function [ X t ] = preprocess(directory,string, count_bins)

	X=[]; %initializarea matricei in care se vor pune sirurile 
	path_to_cats = strcat( directory,  '/cats/*jpg');  %crearea unei variabile cu calea catre toate pozele ce contin pisici
	path_to_not_cats = strcat( directory,  '/not_cats/*jpg'); %directorul cu toate pozele care nu contin pisici
	path_with_cats = strcat( directory,  '/cats/');
	path_with_not_cats = strcat( directory,  '/not_cats/');
	cats=dir(path_to_cats);  %crearea unei liste cu pozele cu pisici
	not_cats=dir(path_to_not_cats); %crearea unei liste cu pozele fara pisici
	t1(1:length(cats))=1; %crearea unui sir cu un numar de elemente egal cu numarul de poze cu pisici, care iau valoarea 1
	t2(1:length(not_cats))=-1;  %sirul cu numarul de elemente egal cu numarul de poze fara pisici, care iau valoarea -1
	if (strcmp(string,'RGB')==1) 
		for i=1:length(cats)
			X=[rgbHistogram(strcat(path_with_cats,cats(i).name),count_bins);X]; %se adauga la matrice sirul caracteristic imaginii
		end
		for i=1:length(not_cats)
			X=[rgbHistogram(strcat(path_with_not_cats,not_cats(i).name),count_bins);X];
		end
	elseif (strcmp(string,'HSV')==1)
		for i=1:length(cats)
			X=[hsvHistogram(strcat(path_with_cats,cats(i).name),count_bins);X];
		end
		for i=1:length(not_cats)
			X=[hsvHistogram(strcat(path_with_not_cats,not_cats(i).name),count_bins);X];
		end
	end
	t=[t1 t2];  %concatenarea sirurilor cu indicii pentru imaginile cu si fara pisici
end
			

