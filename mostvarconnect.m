% sci adv version
% script to create group level dynfc matrices and calculate variability for
% each connection
% written by sk 2/1/26

close all; clear all;

fn1=["Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\150L\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1602L\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_0406\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_1214\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_0910\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1222R\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\137R_1112\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\137R_1314\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\161R_0507\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\156R_1516_117\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1682L\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\136B_1516\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\126R_0506\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\136B_2021\"];
fn2='Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s';
% 
% fn1=["Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\150L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\1602L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\120L_0406\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\120L_1213\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\120L_0910\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\1222R\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\137R_1112\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\137R_1314\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\161R_0507\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\156R_1516_117\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\1682L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\136B_1516\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\126R_0506\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s\136B_2021\"];
% fn2='Z:\Documents\research\connectome\dyngrpanalysis\infraslow30s';

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
    load(fullfile(fn1(n),"dynfc.mat"));
    if (n==1)
        dynfcmall=fcmatd;
        dynfcfall=fcmatoptd;
        dynfchall=fcmatopthd;
    else
        dynfcmall=cat(3, dynfcmall, fcmatd);
        dynfcfall=cat(3, dynfcfall, fcmatoptd);
        dynfchall=cat(3, dynfchall, fcmatopthd);
    end
end


varm=std(dynfcmall, [], 3);
varf=std(dynfcfall, [], 3);
varh=std(dynfchall, [], 3);

varmc=removenansall(varf,varm);
varhc=removenansall(varf, varh);
varfc=removenansall(varf, varf);

save(fullfile(fn2,'mostvarcon.mat'), 'varmc', 'varfc', 'varhc' );



