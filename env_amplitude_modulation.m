%
% Make _/-\_ enveloped sine wave
%
% 2018/12/06
% Keiichi Yasu 

fs=44100; %sampling frequency
f=200; %frequency 
t=[1:fs]/fs; %time, 1 [s]

% carrier, sine wave
x=sin(2*pi*f*t);

% envelope
env=[zeros(1,fs/4) [1:fs/4]/(fs/4) ones(1,fs/4) wrev([1:fs/4]/(fs/4))];
figure;plot(env);

% amplitude modulation
y=x.*env;

% repeat 5 times, 5 [s]
y5s=[y y y y y];

% play, and save sound
soundsc(y5s,fs)
figure;plot(y5s);

y5s=y5s*0.9; %avoid clipping
audiowrite('enveloped_sine_wave_5s.wav',y5s,fs);
