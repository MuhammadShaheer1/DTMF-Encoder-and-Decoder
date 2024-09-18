function peak = maxAmp(tone)
tone = tone*(2/max(abs(tone)));% Scale the input x[n] to the range [-2,+2]
yy = conv(tone,1);% convolution of signal with BPF impulse response
n = max(abs(yy));% binary output of signal presence in waveform
if(n >= .59)
peak = 1;
else
peak = 0;
end
figure(4)
plot(abs(yy));title('Check for maximum amplitude function'),grid on
xlabel('n'),ylabel('Magnitude')
end
%************************
% MaxAmp
% usage: peak = maxAmp(x, ww)
% returns maximum amplitude of the filtered output
% x = input DTMF tone
% ww = impulse response of ONE bandpass filter
% The signal detection is done by filtering x with a length-L
% BPF and then finding the maximum amplitude of the output.
% The peak is either 1 or 0.
% peak = 1 if max(|y[n]|) is greater than, or equal to, 0.59
% peak = 0 if max(|y[n]|) is less than 0.59
%***********************
