
global keyNames tone_all h1 h2 tone
fs=8000;

t=[0:1:204*5]/fs;

dtmf.keys = ... 
   ['1','2','3',;
    '4','5','6',;
    '7','8','9',;
    '*','0','#'];

dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941]*ones(1,4);

keyName = keyNames(length(keyNames));
[r,c] = find(dtmf.keys==keyName); % find row and col for keyname
tone = cos(2*pi*dtmf.rowTones(r,c)*t) + cos(2*pi*dtmf.colTones(r,c)*t);
soundsc(tone,fs);
tone_all=[tone_all,zeros(1,400),tone];

h1=subplot(2,3,2);plot(t,tone);grid on;
title('Signal tone');
ylabel('Amplitude');
xlabel('time (second)');
axis([0 0.035 -2 2]);

Ak=2*abs(fft(tone))/length(tone);
f=[0:1:(length(tone)-1)/2]*fs/length(tone);
h2=subplot(2,3,5);plot(f,Ak(1:(length(tone)+1)/2));grid on
title('Spectrum for tone');
ylabel('Amplitude');
xlabel('frequency (Hz)');
axis([500 2000 0 1]);
y=fft(tone_all);
figure(2)
plot (abs(y)) 
title('FFT magnitude spectrum');xlabel('frequency');ylabel('magnitude')
figure(3) 
plot(tone) 
title('Dialed signal');xlabel('time');ylabel('magnitude') 
maxAmp(tone);
figure(5)
spectrogram(tone)
figure(6)
[c, f, T]=specgram(y); %will return short time fourier transform
mesh(T, f, abs(c));
axis([1 fs 1 T ]); 
view(150, 50);
title('SPECTROGRAM MAGNITUDE OF DIALED KEYS');
ylabel('frequency');
xlabel('time');
zlabel('spectogram magnitude');