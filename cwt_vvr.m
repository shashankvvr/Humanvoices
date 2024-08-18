clc;
clear all;
close all;
Categories = ["20","22","23","24","25","26","27","28","29"];
Categories = ["bar", "bedroom_sleeping", "classroom", "gym", "hall_downstairs", "hall_upstairs", "kitchen", "library", "living_room", "street_running","street_walking"];

for cat=1:10
Img_file_Loc = "Cwt_vvr/" + Categories(cat) + "/";
mkdir(Img_file_Loc);
csv_files_loc =  "humannonspeechsounds/"+Categories(cat) + "/";
data_dir = dir(csv_files_loc + "*.wav");

for i = 1:length(data_dir)
    [data,fs] =audioread(csv_files_loc + data_dir(i).name);
    data_1 = reshape (data, [],10);
for j = 1:10
     datal = data_1(:,j);
     data2 = datal';
     datal = resample(data,1,4);
     cwt(datal,fs);
     set(gca, 'Visible', 'off')
     Img = getframe (gca) ;
     imwrite (Img.cdata, Img_file_Loc + Categories(cat) + i + j + ".png");
     close
end
end
end