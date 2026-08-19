
% for each optical area, give the corresponding 3D areas (which are
% smaller)
% each row is optical region
% commented out small areas outside FOV

optmriconversion= {[7,8,9,10,11,12];  %FRP
                    [240:1:245]; %PL
                    [228:1:232]; %ACAd
                    [26,27,28,29,30]; %MOs
                    [20,20,21,22,23,24];   %MOp
                    [74:1:79]; %SSp-m
                    [81:1:86]; %SSp-ul
                    [67:1:72]; %SSp-ll
                    [46:1:51];     %SSp-n
                    [95:1:100]; %SSp-un
                    [102:1:107]; %SSs
                    [53:1:58];  %SSp-bfd
                    [88:1:93]; %SSp-tr
                    [124:1:129]; %AUDd
                   []; %[138:1:143]; %AUDp
                   []; %[145:1:150]; %AUDpo
                   []; %[362:1:367] %TEa
                    [166:1:171]; %VISal
                    [355:1:360]; %VISrl
                    [348:1:353]; %VISa
                    [173:1:178]; %VISam
                    [201:1:206]; %VISpm
                    [187:1:192]; %VISp
                   []; %[180:1:185]; %VISl
                   []; %[208:1:213]; %VISli
                   []; %[215:1:220]; %VISpor
                   []; %[194:1:199]; %VISpl
                    [300:1:304]; %RSPagl
                    [327:1:332]; %RSPd
                    [334:1:339]}; %RSPv
                    
                   

save('optmriconversion.mat', 'optmriconversion');


%                    
%                     
%                    
%                    
%                    
