clear all;close all;clc;
[y,fs] = audioread('test_vad.wav');
cntr = 0;
threshold = 0.002;
vad_op = vad(y,fs,cntr,threshold);
figure;plot(y);hold on;plot(vad_op);