%% ��ʼ��������
filename = 'C:\Users\Yang\Desktop\FM_test1';
delimiter = '\t';
formatSpec = '%f32%f32%f32%f32%f32%f32%f32%[^\n\r]';

%% ���ı��ļ���
fileID = fopen(filename,'r');

%% ���ݸ�ʽ�ַ�����ȡ�����С�
% �õ��û������ɴ˴������õ��ļ��Ľṹ����������ļ����ִ����볢��ͨ�����빤���������ɴ��롣
dataArray{:,:} = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);

%% �ر��ı��ļ���
fclose(fileID);

%% ����������������б�������
FM911.data  = dataArray{1,1}{1,1}([41400:814277 814477:end]);
FM921.data  = dataArray{1,1}{1,2}([41400:814277 814477:end]);
FM966.data  = dataArray{1,1}{1,3}([41400:814277 814477:end]);
FM972.data  = dataArray{1,1}{1,4}([41400:814277 814477:end]);
FM980.data  = dataArray{1,1}{1,5}([41400:814277 814477:end]);
FM990.data  = dataArray{1,1}{1,6}([41400:814277 814477:end]);
FM1046.data = dataArray{1,1}{1,7}([41400:814277 814477:end]);
%% �����ʱ����
clearvars filename delimiter formatSpec fileID dataArray ans;
[FM911.fitResult, FM911.gof, FM911.output ] = peaks(double(FM911.data), -57.1,2);
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM911','fig');
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM911','tiffn');
[FM921.fitResult, FM921.gof, FM921.output ] = peaks(double(FM921.data), -54.1,2);
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM921','fig');
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM921','tiffn');
[FM966.fitResult, FM966.gof, FM966.output ] = peaks(double(FM966.data), -58.1,1);
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM966','fig');
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM966','tiffn');
[FM972.fitResult, FM972.gof, FM972.output ] = peaks(double(FM972.data), -58.1,2);
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM972','fig');
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM972','tiffn');
[FM980.fitResult, FM980.gof, FM980.output ] = peaks(double(FM980.data), -65.1,2);
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM980','fig');
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM980','tiffn');
[FM990.fitResult, FM990.gof, FM990.output ] = peaks(double(FM990.data), -61.1,2);
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM990','fig');
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM990','tiffn');
[FM1046.fitResult,FM1046.gof,FM1046.output] = peaks(double(FM1046.data),-65.6,2);
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM1046','fig');
saveas(gcf,'C:\Users\Yang\Desktop\ͼƬ\����FM��λ\FM�ֲ�����\FM1046','tiffn');
