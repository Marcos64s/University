close all;clear all;clc;

N=20;
tmax=5000;
tv=0:tmax;
ic=0;
Tv=0.1:0.01:1.0;
EGIteorico=3*N*Tv/2;
ESEteorico=3*N*Tv;
E0v=N/2:8:9*N/2;
