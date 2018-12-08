%
% Test for MIR toolbox
% 2018/12/05 Keiichi Yasu
%

% 1 [s] sine wave in 100 Hz
fs=44100;
t=[1:fs*1]/fs;
sinwave=sin(2*pi*100*t)';

%convert sound to 'mir' style by 'miraudio'
a=miraudio(sinwave,fs);

%mirgetdata
adata=mirgetdata(a);
figure;plot(adata)

%calc. frame by 'mirframe'
% 30ms window, no overlap (Hop, 30ms)
mir_frame=mirframe(a,'Length',0.03,'s','Hop',0.03,'s');
adata_frame=mirgetdata(mir_frame);
figure;mesh(adata_frame) % three waves (T * 3)

%calc. envelope by 'mirenvelope'
mir_envelope=mirenvelope(a); %TODO: adjusting frame length
adata_env=mirgetdata(mir_envelope);
figure;plot(adata_env) %almost flat envelope

