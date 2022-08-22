% University Of Kent: Comp 6620 
% Name: Harry Hacker 
% Login: hwh2


% To Note: Requires Signal Processing Toolbox
% Home -> Add-Ons -> Signal Processing Toolbox -> Install 
% I'm under the impression that this is fine considering the book, lectures
% and class material use tools from this add-on. Used for Tasks 5,7.


% Task 1 - Load Data & Find Length
close all; clear all; load hwh2.mat; % Close all plots, clear all variables & load original data

[R, N] = size(data); % Grabs the number of rows (R) and number of columns (N)
Fs = 250; % Sample Frequency
length = N/Fs; % The length of the data: Numer Of Samples / Sample Frequency
xtime = (0:N-1) / Fs; % X-Axis time scale.

figure
subplot(2,1,1); % Created a subplot to hold the two different graphs
plot(data) % Plots the Raw Data
title('Raw Data Plotted') % Header describing the figure 
xlabel('Samples'), ylabel('Amplitude'), % Assigns axis titles
gca.FontSize = 22; % Loads gca function and changes font size to 22

subplot(2,1,2); 
plot(xtime,data) %Plots Data With Time As X-Axis
title('Raw Data Plotted')
xlabel('Time (sec)'), ylabel('Amplitude'),
gca.FontSize = 22;


% Task 2 - Create a Notch Filter
Nf = 50; % Power line frequency                
fRatio = Nf/(Fs/2); % Frequency ratio                        
Nz = [(pi*fRatio ), ( -1*pi*fRatio )]; % Notch zeros

Np = 0.9 * Nz; % Notch poles
rsltNtc = filter(Nz,Np,data); % This filters the data by the numerator & denominator.

figure
subplot(2,1,1); 
plot(xtime, data) % Plots Raw Data With Time X-Axis
title('Raw Data Plotted') 
xlabel('Time (sec)'), ylabel('Amplitude'),
gca.FontSize = 22;

subplot(2,1,2); 
plot(xtime,rsltNtc) % Plots Notch Filter Outcome
title('Notch Data Plotted')
xlabel('Time (sec)'), ylabel('Amplitude'),
gca.FontSize = 22;


% Task 3 - Create a High Pass Filter
for i=2:N 
    % For each data point in the Notch vector take the next datapoint and
    % subtract it from the current. Then multiply it by .5
    hPass(i)=0.5*(rsltNtc(i)-rsltNtc(i-1)); 
end

figure
subplot(2,1,1); 
plot(xtime, rsltNtc) % Plots Data Entered Into the Filter
title('Notch Data Plotted') 
xlabel('Time (sec)'), ylabel('Amplitude'),
gca.FontSize = 22;

subplot(2,1,2); 
plot(xtime,hPass) % Plots High Pass Filter Outcome
title('HighPass Data Plotted')
xlabel('Time (sec)'), ylabel('Amplitude'),
gca.FontSize = 22;


% Task 4 - Segmentation
segRW = 1; % Row Index
segDP = 1; % Data Point Index
xtime2 = (0:250-1) / Fs; % The second X-Axis time scale.

for i = 1:N % For each datapoint in the filtered data
    seg(segRW,segDP) = hPass(1,i); % Add that datapoint to (segR, segD) of vector seg.
    segDP = segDP + 1; % Add one to segD so the next datapoint doesn't replace current.

    if mod(i,Fs) == 0  % If the value of i is divisible by Fs (250) then...
        segRW = segRW + 1; % Add 1 to the vector's row
        segDP = 1; % Reset the seg column vector to account for a new row and start of a new segment.
    end
end

figure
for i = 1:length 
    subplot(13,2,i); % Plots All Segments.
    plot(xtime2,seg(i,:))
    title(sprintf('Segment: %.0f', i))
end


% Task 5 - Filtering SSVEP Data 
passBand = 30; % Passband range (30Hz)
stopBand =  31; % Stopband range (31Hz)
Fn = Fs/2; % Nyquist  Frequency 
passRip = 2; % Passband ripple
stopAtten = 6; % Stopband Attenuation 
[n,Wn] = ellipord(stopBand/Fn,passBand/Fn,passRip,stopAtten); % This generates a minimum order , n = lowest order, Wn = cutoff frequencies
[b,a] = ellip(n,passRip,stopAtten,stopBand/Fs); % 

figure
for i = 1:length % For each segment.
    result = filtfilt(b,a,seg(i,:)); % Apply a double filter (going forwards then backwards) of b & a on segment(i,:)

    subplot(13,2,i); 
    plot(xtime2,result) % Plots The SSVEP Segments After Being Filtered
    title(sprintf('SSVEP Filter Segment: %.0f', i))
    xlabel('Time (sec)')
    ylabel('Amplitude')
end

% Task 6
Segment = {'1';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';'29';'21';'22';'23';'24';'25';'26'}; %The Segment
Frequency = {'8';'19';'ng';'8';'ng';'8';'19';'ng';'19';'19';'19';'22';'19';'19';'8';'22';'19';'19';'19';'ng';'8';'8';'19';'19';'ng';'19'}; % What I believe the frequency is
tabResult = table(Segment,Frequency) % Displays the table in the command window.

% Task 7
figure
for i = 1:length % Viewing all segments at once with fft (a form of spectral analysis).
    result = filtfilt(b,a,seg(i,:)); %  For each filtered segment
    Y = fft(result); % Apply Fourier Transform to the filtered segment.
    f = (0:(250-1))*Fs/(250-1); % Display the x-axis as frequency instead of samples.

    subplot(13,2,i); 
    plot(f,abs(Y)) % Plots The Spectral Analysis of All Segments
    title(sprintf('Spectral Analysis Segment: %.0f', i))
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
end
