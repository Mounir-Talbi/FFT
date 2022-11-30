function F=FFTrecur(x)
    N=length(x); %On s'arrange dans x pour puissance de 2
    if N>1
        X_pair=FFTrecur(x(2:2:N)); %Décomposition paire
        X_impair= FFTrecur(x(1:2:N)); %Décomposition impaire
        coefficient=exp(-2*i*pi.*[0:N/2-1]/N); %Coefficient
        F=[X_impair+coefficient.*X_pair X_impair-coefficient.*X_pair];
        %Incrémentation impair pair
    else 
        F=x;
    end 
end

    