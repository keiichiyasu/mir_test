%
% Test for MIR toolbox
% 2018/12/05 Keiichi Yasu
%

% 1 [s] sine wave in 100 Hz
fs=44100;
t=[1:fs*1]/fs;
sinwave=sin(2*pi*100*t)';

%convert sound to 'mir' style by 'miraudio'
mir_sin=miraudio(sinwave,fs);

%mirgetdata
mir_output=mirgetdata(mir_sin);
figure;plot(mir_output)

%calc. frame by 'mirframe'
% 30ms window, no overlap (Hop, 30ms)
mir_frame=mirframe(mir_sin,'Length',0.03,'s','Hop',0.03,'s');
mir_output_frame=mirgetdata(mir_frame);
figure;mesh(mir_output_frame) % three waves (T * 3)

%calc. envelope by 'mirenvelope'
mir_envelope=mirenvelope(mir_sin); %TODO: adjusting frame length
mir_output_env=mirgetdata(mir_envelope);
figure;plot(mir_output_env) %almost flat envelope

