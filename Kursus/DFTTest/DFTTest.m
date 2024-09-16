clear
%Test signal skal være en sinus med 4 Hertz
fsine = 4;
%DFT skal være en Npoint DFT vi vælger 100 points.
N = 250
%Vi generer vores samples til test af DFT. 4 sinus kurver deles i 100 bidder
for c = 1:N
    DataSamples(c) = sin((4*2*pi*c)/N);% + 0.1 + 0.5*sin((10*2*pi*c)/N); %+ exp(c);
    TimeAxis(c) = c;
end 


%Tjekker sampels
%plot(TimeAxis, DataSamples)

%Vi implementerer analyse ligningen (11, side 654) i function calcDFT()

%DFT array
for g = 1:N/2
    DFT(g) = 0;
    FrequencyAxis(g) = g - 1;
end 
for k = 1:N/2
    DFT(k) = calcDFT(DataSamples,k-1);
    mag(k) = abs(DFT(k));
    DFTPhase(k) = calcAngle(DFT(k));
end

%Plot magnituyde
%plot(FrequencyAxis, mag)
%Plot phase
plot(FrequencyAxis, DFTPhase)

%%Test Functions
%testDFT = calcDFT(DataSamples,4)
%testangle = calcAngle(testDFT)
%deg = testangle * 360/(2*pi)
%%

function DFT = calcDFT(xtilde, k)
%Function til den indre sum. Vi skal beregne alle DFT koefficienter til
%f.eks 1 Hz.. 2 Hz....
    DFTSize = length(xtilde)
    XTildeSum = 0;
      for n = 1:DFTSize
        XTildeSum = xtilde(n) * exp(-j*((2*pi*k*(n-1))/DFTSize)) + XTildeSum; 
      end
%Der er et DC offset i test signalet. Det bliver summeret op hver eneste
%iteration af XTildeSum. Vi fjerner det ved at dividere med størrelse af
%DFTen.
DFT = XTildeSum/DFTSize;
end

function PhaseAngle = calcAngle(fourierCoeff)
    PhaseAngle = atan(imag(fourierCoeff)/real(fourierCoeff))
end





