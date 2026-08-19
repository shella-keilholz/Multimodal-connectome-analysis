%sci adv version
% script for windowed fc similarity comparison
%modified to deal with high freq opt data 
%to compare two diff frequencies, use fn1 for one and fn1a for the other

close all; clear all;

% fn1=["Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\150L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1602L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_0406\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_1214\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_0910\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1222R\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\137R_1112\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\137R_1314\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\161R_0507\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\156R_1516_117\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1682L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\136B_1516\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\126R_0506\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\136B_2021\"];
% fn2='Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s';

fn1=["Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\150L\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\1602L\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\120L_0406\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\120L_1213\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\120L_0910\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\1222R\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\137R_1112\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\137R_1314\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\161R_0507\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\156R_1516_117\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\1682L\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\136B_1516\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\126R_0506\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\136B_2021\"];
fn2='Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s';

% fn1=["Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\150L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\1602L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\120L_0406\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\120L_1214\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\120L_0910\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\1222R\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\137R_1112\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\137R_1314\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\161R_0507\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\156R_1516_117\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\1682L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\136B_1516\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\126R_0506\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s\136B_2021\"];
% fn2='Z:\Documents\research\connectome\dyngrpanalysis\infraslow60s';

% fn1=["Z:\Documents\research\connectome\dyngrpanalysis\delta15s\150L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\1602L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\120L_0406\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\120L_1214\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\120L_0910\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\1222R\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\137R_1112\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\137R_1314\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\161R_0507\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\156R_1516_117\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\1682L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\136B_1516\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\126R_0506\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta15s\136B_2021\"];
% fn2='Z:\Documents\research\connectome\dyngrpanalysis\delta15s';


% fn1=["Z:\Documents\research\connectome\dyngrpanalysis\delta30s\150L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\1602L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\120L_0406\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\120L_1214\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\120L_0910\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\1222R\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\137R_1112\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\137R_1314\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\161R_0507\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\156R_1516_117\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\1682L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\136B_1516\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\126R_0506\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\delta30s\136B_2021\"];
% fn2='Z:\Documents\research\connectome\dyngrpanalysis\delta30s';

for n=1:size(fn1)
%     load(fullfile(fn1a(n),"dynfc.mat"), 'fcmatd') %uncomment to compare
%     across frequencies
    load(fullfile(fn1(n),"dynfc.mat"));
    
    s2=size(fcmatoptd,3);
    s1=size(fcmatd,3);
    
    if (s2>s1)
        sz=s1;
    else
        sz=s2;
    end

    i1=1;
    for i=1:size(fcmatoptd,2)
        if(isnan(fcmatoptd(2,i)) || isnan(fcmatopthd(2,i) || isnan(fcmatd(2,i))))
            i1=i1;
        else
            fcin1a(:,i1, 1:sz)=fcmatd(:,i, 1:sz);
            fcin2a(:,i1, 1:sz)=fcmatoptd(:,i, 1:sz);
            fcin3a(:,i1, 1:sz)=fcmatopthd(:,i, 1:sz);
            i1=i1+1;
        end
    end
    i1=1;
    for i=1:size(fcmatoptd,1)
        if(isnan(fcmatoptd(i,2)) || isnan(fcmatopthd(i,2) || isnan(fcmatd(i,2))))
            i1=i1;
        else
            fcin1(i1,:, 1:sz)=fcin1a(i,:, 1:sz);
            fcin2(i1,:, 1:sz)=fcin2a(i,:, 1:sz);
            fcin3(i1,:, 1:sz)=fcin3a(i,:, 1:sz);
            i1=i1+1;
        end
    end

    stc=comparefcmatrices(fcin1);
    meansimtc(n,1)=mean(stc);
    stdsimtc(n,1)=std(stc);
    stc=comparefcmatrices(fcin2);
    meansimtc(n,2)=mean(stc);
    stdsimtc(n,2)=std(stc);
    stc=comparefcmatrices(fcin3);
    meansimtc(n,3)=mean(stc);
    stdsimtc(n,3)=std(stc);
    
    for i=1:sz
        t1=reshape(fcin1(:,:,i),size(fcin1,1)*size(fcin1,2),1);
        t2=reshape(fcin2(:,:,i),size(fcin2,1)*size(fcin2,2),1);
        t3=reshape(fcin3(:,:,i),size(fcin3,1)*size(fcin3,2),1);
        tmp=corrcoef(t1,t2);
        simtc(i,1)=tmp(1,2);
        tmp=corrcoef(t1,t3);
        simtc(i,2)=tmp(1,2);
        tmp=corrcoef(t2,t3);
        simtc(i,3)=tmp(1,2);
    end
    meancrosstc(n,:)=mean(simtc,1);
    stdcrosstc(n,:)=std(simtc, 1);

    simtc1=simtc;
    for i=1:3
        for j=1:4
            [mx,ind]=max(simtc1(:,1));
            topind(i,j)=ind;
            topval(i,j)=mx;
            simtc1(ind)=0;
        end
    end
    simtc1=simtc;
    for i=1:3
        for j=1:4
            [mn,ind]=min(simtc1(:,1));
            lowind(i,j)=ind;
            lowval(i,j)=mn;
            simtc1(ind)=1;
        end
    end 
   highpatt1m=(fcin1(:,:,topind(1,1))+fcin1(:,:,topind(1,2)))+fcin1(:,:,topind(1,3))+fcin1(:,:,topind(1,4));
   highpatt1m=highpatt1m/4;
   highpatt1f=(fcin2(:,:,topind(1,1))+fcin2(:,:,topind(1,2)))+fcin2(:,:,topind(1,3))+fcin2(:,:,topind(1,4));
   highpatt1f=highpatt1f/4;
   lowpatt1m=(fcin1(:,:,lowind(1,1))+fcin1(:,:,lowind(1,2)))+fcin1(:,:,lowind(1,3))+fcin1(:,:,lowind(1,4));
   lowpatt1m=lowpatt1m/4;
   lowpatt1f=(fcin2(:,:,lowind(1,1))+fcin2(:,:,lowind(1,2)))+fcin2(:,:,lowind(1,3))+fcin2(:,:,lowind(1,4));
   lowpatt1f=lowpatt1f/4;
   amp=sum(sum(abs(fcin1),1),2);
   ampf=sum(sum(abs(fcin2),1),2);
   amph=sum(sum(abs(fcin3),1),2);
%    clear fcin1; clear fcin1a; clear fcin2; clear fcin2a; clear fcin3;  clear fcin3a;
end
%      save(fullfile(fn2,'simtcstats.mat'), 'meansimtc', 'stdsimtc', 'meancrosstc', 'stdcrosstc');



