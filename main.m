[y, fs] = audioread('prod7.wav');   %Choix du morceau/son
t=linspace(0,length(y)/fs,length(y));
Y = fftshift(fft(y));           % %Faire la tranformée de fourier puis "moduler"
N = length(Y);                  % longueur de Y


Ycompress = zeros(1,N); % création vecteur taille N avec des zeros
taux=50; %choix du taux de compression.
Ycompress((N*((taux/100)/2))+1 : N*(1-(taux/100)/2)) = Y((N*((taux/100)/2))+1 :  N*(1-(taux/100)/2));
%Remplissage partiel du vecteur par les valeurs initales


yr=real(ifft(fftshift(Ycompress)));  % Reconstruction du signal filtré
%On prend les réels car "audioread" ne fonctionne qu'avec les réels


audiowrite('Fichier compressé à 50%.wav',yr,fs);
%Ecriture du fichier compressé


[yc, fsc] = audioread('Fichier compressé à 50%.wav');
tc=linspace(0,length(y)/fsc,length(y));             

%Comparons les résultats du fichier original et compressé
figure(1)
subplot(2,1,1)
plot(t(50000:55000),y(50000:55000)) 
title('Partie du signal du morceau non compressé') ;
subplot(2,1,2)
plot(t(50000:55000),yc(50000:55000)) 
title('Partie du signal du morceau compressé') ;

G=abs(fft(y));
Gc=abs(fft(yc));
f=linspace(0,fs,length(y)); %fs et fc sont égaux
figure(2)
subplot(2,1,1)
plot(f(1:length(y)/2),G(1:length(y)/2)) 
title('Fréquences du morceau non compressé') ;
subplot(2,1,2)
plot(f(1:length(y)/2),Gc(1:length(y)/2))
title('Fréquences du morceau compressé') ;
