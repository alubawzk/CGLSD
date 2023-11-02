clc;clear;
close all;
%% set path
addpath(genpath('./RENOIR-LineSegment'));
img_root = 'images';
load('LineSegmentAnnotation/Image_ID_List.mat');
img_num = 1; % set image number

%% load gt
img_name = Image_ID_List(img_num).name;
str_gnd = sprintf('LineSegmentAnnotation/%s.mat', Image_ID_List(img_num).name);
load(str_gnd);
line_gnd = LineSet;
line_gnd = unique(line_gnd, 'rows');      

%% show gt
img_path = sprintf('%s/%s/%s.bmp', img_root, img_name, img_name);
img  = imread(img_path);
[m,n] = size(img(:,:,1));
ls = line_gnd(:,1:4) ;
figure('Name', ['GT lines of ', num2str(img_num)]);
imshow(ones(m,n)*255,'border','tight');
hold on;
for i = 1:length(ls(:,1))
    plot([ls(i,1) ls(i,3)],[ls(i,2) ls(i,4)], 'k','linewidth',1 );
end
plot([1 n n 1 1],[1 1 m m 1],'color',[.75 .75 .75],'linewidth',1);
hold off

%%
rmpath(genpath('./RENOIR-LineSegment/'));
