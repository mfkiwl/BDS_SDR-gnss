function fftCode = longCode( settings )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
longCode = makeCaTable(settings,1,0);
longCodeDelay = longCode.*circshift(longCode,[0,22]);
longCodeDelay = double(longCodeDelay);
fftCode  = conj(fft(longCodeDelay,[],2));
fftCode = fftCode(settings.acqSatelliteList,:);