%This program determines the HLS values of certain Pixels selected from an
%Image. Using an image taken in a specialised enclosure this program is
%able to extrapolate the RGB values and thus calculate the HLS values.
%Using these values the program will plot two polar graphs showing the
%difference in each sample

%USER INPUT OF IMAGE
prompt = 'What is the sample being tested?\n '; %End any name with .jpeg so
str = input(prompt,'s');                      %knows its an image

I = imread(str);
figure(1), clf;
imshow(I)
RGB = impixel(I);
MeanRGB = mean(RGB);

%ASSIGN INDIVIDUAL RGB VALUES
R=MeanRGB(1);
G=MeanRGB(2);
B=MeanRGB(3);
minval=min(MeanRGB);
maxval=max(MeanRGB);

r = R - minval;
g = G - minval;
b = B - minval;

L = (R+G+B)/3;

S = (maxval - minval)/(maxval + minval);

switch minval
    case R
        H=240-(120*g)/(g+b);
    case G
        H=360-(120*b)/(b+r);
    case B
        H=120-(120*r)/(g+r);
        
end


% figure(2), clf;
% subplot(1,2,1);
% polarplot(H,L,'+r');
% legend('Water');
% %title('Hue against L', 'colour', 'red');
% subplot(1,2,2);
% polarplot(H,S,'+b');
% legend('Water');

%DRAW TABLE
sample = {str};
T = table(sample,R,G,B,H,S,L);
display(T);

% filename = 'data.xlsx';
% Range='A1';
% xlswrite(filename,H,L,1,Range);
% % writetable(T,filename,'Sheet',1,'Range','A1');

%SAVE DATA TO FILE
% save('test1.txt','H','S','L \n');
% T = readtable('test.dat','format','%f');

