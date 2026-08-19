%sci adv version
% using BCT toolbox function to measure modularity on FC matrices
%designed for time-varying version but can also be used on static FC
%uncomment one section to chose data, time-varying fc, freq bands, average 
%fc per animal, group fc, or average freq fc
%modified from modularityofmatrix 1/8/26 to perform iterative assignment
%modified 1/21/26 to exclude nans rather than set them to zero

close all; clear all;

% %for time-varying fc , need to run one by one for now, some error with
% group
fn1=[%"Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\150L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1602L\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_0406\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_1214\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\120L_0910\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1222R\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\137R_1112\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\137R_1314\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\161R_0507\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\156R_1516_117\";
    "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\1682L\"];
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\136B_1516\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\126R_0506\";
%     "Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s\136B_2021\"];
fn2='Z:\Documents\research\connectome\dyngrpanalysis\infraslow15s';
fstr="dynfc.mat";


%for frequency bands
% fn1=["Z:\Documents\research\connectome\freqanalysis\150L\";
%     "Z:\Documents\research\connectome\freqanalysis\1602L\";
%     "Z:\Documents\research\connectome\freqanalysis\120L_0406\";
%     "Z:\Documents\research\connectome\freqanalysis\120L_1213\";
%     "Z:\Documents\research\connectome\freqanalysis\120L_0910\";
%     "Z:\Documents\research\connectome\freqanalysis\1222R\";
%     "Z:\Documents\research\connectome\freqanalysis\137R_1112\";
%     "Z:\Documents\research\connectome\freqanalysis\137R_1314\";
%     "Z:\Documents\research\connectome\freqanalysis\161R_0507\";
%     "Z:\Documents\research\connectome\freqanalysis\156R_1516_117\";
%     "Z:\Documents\research\connectome\freqanalysis\1682L\";
%     "Z:\Documents\research\connectome\freqanalysis\136B_1516\";
%     "Z:\Documents\research\connectome\freqanalysis\126R_0506\";
%     "Z:\Documents\research\connectome\freqanalysis\136B_2021\"];
% fn2='Z:\Documents\research\connectome\freqanalysis\';
% frqbnds=["infraslow"; "slow"; "delta"];

% %for average fc per animal
% fn1=["Z:\Documents\research\connectome\groupanalysis\150L\";
%     "Z:\Documents\research\connectome\groupanalysis\1602L\";
%     "Z:\Documents\research\connectome\groupanalysis\120L_0406\";
%     "Z:\Documents\research\connectome\groupanalysis\120L_1213\";
%     "Z:\Documents\research\connectome\groupanalysis\120L_0910\";
%     "Z:\Documents\research\connectome\groupanalysis\1222R\";
%     "Z:\Documents\research\connectome\groupanalysis\137R_1112\";
%     "Z:\Documents\research\connectome\groupanalysis\137R_1314\";
%     "Z:\Documents\research\connectome\groupanalysis\161R_0507\";
%     "Z:\Documents\research\connectome\groupanalysis\156R_1516_117\";
%     "Z:\Documents\research\connectome\groupanalysis\1682L\";
%     "Z:\Documents\research\connectome\groupanalysis\136B_1516\";
%     "Z:\Documents\research\connectome\groupanalysis\126R_0506\";
%     "Z:\Documents\research\connectome\groupanalysis\136B_2021\"];
%     fn2='Z:\Documents\research\connectome\groupanalysis\';
%     frqbnds=["infraslow"];
%     fstr="allfc.mat";

%     for group average fc
% fn1=["Z:\Documents\research\connectome\groupanalysis\all"];
% fn2=["Z:\Documents\research\connectome\groupanalysis\all"];
% fstr="grpfc.mat";
% 
% for average frequency fc
% fn1=["Z:\Documents\research\connectome\freqanalysis\infraslow"];
% fn2=["Z:\Documents\research\connectome\freqanalysis\infraslow"];
% fstr="grpfc.mat";


g=1; %gamma for modularity
qflall=zeros(size(fn1,1), 100); qhall=zeros(size(fn1,1), 100); qmriall=zeros(size(fn1,1), 100);qmriwall=zeros(size(fn1,1), 100);
cflall=zeros(size(fn1,1), 100,100); chall=zeros(size(fn1,1), 100,100); cmriall=zeros(size(fn1,1), 100,100); cmriwall=zeros(size(fn1,1), 100,100);
for n=1:size(fn1)
    load(fullfile(fn1(n),fstr));
      if(fstr=="dynfc.mat")
       fcfluor=fcmatoptd;fchemo=fcmatopthd; fcmriw=fcmatwd; fcmri=fcmatd;
      elseif (fstr=="allfc.mat")
         fcmri=fcmat;fcfluor=fcmatopt;fchemo=fcmatopth; fcmriw=fcmatw;
      elseif (fstr=="grpfc.mat")
         fcmri=reshape(mean(fcmatall,1), 60,60,1);fcfluor=reshape(mean(fcmatoptall,1),60,60,1);
         fchemo=reshape(mean(fcmatopthall,1),60,60,1); fcmriw=reshape(mean(fcmatwall,1),110,110,1);
      end
% 
% % % can add back later if we need to threshold
% % %     tmp=find(fcmatd<0);
% % %     fcmatoptd(tmp)=0;
% 
% %% make sure diagonal is zero
    for i=1:size(fcmri,1) 
        fcmri(i,i,:)=0;
        fcfluor(i,i,:)=0;
        fchemo(i,i,:)=0;
    end
    for i=1:size(fcmriw,1)
        fcmriw(i,i,:)=0;
    end

    %get rid of nans using subroutine
    if(fstr=="dynfc.mat")
        fcmric=removenansdynamic(fcmri);
        fcfluorc=removenansdynamic(fcfluor);
        fchemoc=removenansdynamic(fchemo);
        fcmriwc=removenansdynamic(fcmriw);
    else
        fcmric=removenans(fcmri);
        fcfluorc=removenans(fcfluor);
        fchemoc=removenans(fchemo);
        fcmriwc=removenans(fcmriw);
    end

    for i=1:size(fcmric, 3)
        ci=1:size(fcmric,1); 
        q0=-1; q1=0;
        while ((q1-q0)>1e-5)
            q0=q1;
            [ci,q1]=community_louvain(squeeze(fcmric(:,:,i)),g,ci,'negative_sym');
        end
        cmri(i,:)=ci;
        qmri(i)=q1;
        ci=1:size(fcmriwc,1); 
        q0=-1; q1=0;
        while ((q1-q0)>1e-5)
            q0=q1;
            [ci,q1]=community_louvain(squeeze(fcmriwc(:,:,i)),g,ci,'negative_sym');
        end
        cmriw(i,:)=ci;
        qmriw(i)=q1;
    end
    for i=1:size(fcfluorc, 3)
        ci=1:size(fcfluorc,1); 
        q0=-1; q1=0;
        while ((q1-q0)>1e-5)
            q0=q1;
            [ci,q1]=community_louvain(squeeze(fcfluorc(:,:,i)),g,ci,'negative_sym');
        end
        cfluor(i,:)=ci;
        qfluor(i)=q1;
        ci=1:size(fchemoc,1); 
        q0=-1; q1=0;
        while ((q1-q0)>1e-5)
            q0=q1;
            [ci,q1]=community_louvain(squeeze(fchemoc(:,:,i)),g,ci,'negative_sym');
        end
        chemo(i,:)=ci;
        qhemo(i)=q1;
    end
    if (fstr=="grpfc.mat")
        save(fullfile(fn2,'modlouvain.mat'), 'cmri', 'qmri', 'cmriw', 'qmriw', 'cfluor', 'qfluor', 'chemo', 'qhemo');
    else
        save(fullfile(fn1(n),'modlouvain.mat'), 'cmri', 'qmri', 'cmriw', 'qmriw', 'cfluor', 'qfluor', 'chemo', 'qhemo');
%             save(fullfile(fn1(n),'modlouvain.mat'),  'cfluor', 'qfluor', 'chemo', 'qhemo');
    end
%     qflall(n,1:(size(qfluor,2)))=qfluor;
%     qhall(n,1:(size(qhemo,2)))=qhemo;
%     qmriall(n,1:(size(qmri,2)))=qmri;
%     qmriwall(n,1:size(qmriw,2))=qmriw;
%     cflall(n,:,1:size(cfluor,2))=cfluor;
%     chall(n,:,1:size(chemo,2))=chemo;
%     cmriall(n,:,1:size(cmri,2))=cmri;
%     cmriwall(n,:,1:size(cmriwall,2))=cmriw;
%     save(fullfile(fn2,'allq.mat'), 'qflall', 'qhall','qmriall', 'qmriwall', 'cflall', 'chall', 'cmriwall', 'cmriall');
% %     save(fullfile(fn2,'allq.mat'), 'qflall', 'qhall');
% clear qfluor; clear qhemo; clear qmri; clear qmriw; clear cfluor; clear chemo; clear cmri; clear cmriw;
    
end
