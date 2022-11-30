function y = FFTiter(x)
    N= length(x); 
    x = x(bitrevorder(1:N)); %inversion indexage en bits
    q = log2(N);
    for j = 1:q %Il y'a q subdivissions dans l'algorithme
        m = 2^(j-1);
        coef = exp(-pi*1i/m).^(0:m-1);
        for k = 1:2^(q-j) %Boucle pour rassembler les vecteurs d'une subdiv
              debut = 2*(k-1)*m+1;  %1er indexage
              fin = 2*k*m;           %dernier indexage
              milieu = debut + (fin-debut+1)/2; %indexage du milieu
              y1       = x(debut:milieu-1); %1ere partie (Y impair)
              y2 = x(milieu:fin); %2eme partie (X pair)
              z = coef .* y2; 
              y = [y1 + z, y1 - z];
              x(debut:fin) = y; %rassemblage des vecteurs
        end
    end
