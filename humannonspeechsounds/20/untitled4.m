% Step 1: Read the .wav file
[signal, fs] = audioread('humannonspeechsounds\20\1-60997-B-20.wav');

% If the signal is stereo, convert to mono by averaging the two channels
if size(signal, 2) == 2
    signal = mean(signal, 2);
end

% Step 2: Compute the Continuous Wavelet Transform (CWT)
[cfs, f] = cwt(signal, fs);

% Step 3: Plot the CWT
figure;
t = (0:length(signal)-1)/fs;  % Time vector
surface(t, f, abs(cfs));
shading interp;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Continuous Wavelet Transform (CWT)');
colorbar;
axis tight;
