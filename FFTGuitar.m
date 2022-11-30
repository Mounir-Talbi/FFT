[y,fs]=audioread('Corde.wav'); %
t=linspace(0,length(y)/fs,length(y)); %Creation d'un vecteur temps
figure(1)
plot(t,y) 
title('Représentation graphique du son emis')
figure(2)
f=linspace(0,fs,length(y)); %Création d'un vecteur temps lié aux fréquences
G=abs(fft(y)); %valeur absolue de la FFT
figure(2)
plot(f(1:length(y)/2),G(1:length(y)/2))
title('Fréquences')