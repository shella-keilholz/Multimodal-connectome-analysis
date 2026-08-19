# Multimodal-connectome-analysis
Code and data for Science Advances submission on functional connectivity in rs-fMRI and wide-field optical imaging

Data consists of functional connectivity matrices for rs-fMRI, WOI of calcium, and WOI of HBT for 14 scans. Processed time courses for each atlas parcel in each modality are included. The cortical atlas has 60 parcels and most scans consist of 60000 timepoints for WOI, 1210 for rs-fMRI.  Some were trimmed during preprocessing.

Summary of data

-Timeaveragedfc folder

    -grpfc.mat
    
        Group level FC matrices for rs-fMRI (cortical, fcmatall; whole brain, fcmatwall), calcium (fcmatoptall), and HBT (fcmatopthall)
        Correlation coefficients for FC matrices from different modalities for the same scan (e.g., ccmrifluor is for calcium vs rs-fMRI)
        
    -individual scan folders
    
        The first part of the folder name (e.g., 120L) is the animal identifier. For some animals, an additional scan identifier is given. For             example, 120L_0406 is scan session 04/06 from mouse 120L. 
        Each folder contains allfc.mat, which contains FC matrices for each scan and time courses for each atlas parcel for each modality                 (parcels_all for cortical rs-fMRI, parcels_allw for whole brain rs-fMRI, parcall for calcium, and parchall for HBT).
    
-Freqanalysis folder

    -delta, infraslow, and slow folders each contain grpfc.mat, with the same variables as in the time-averaged folder but calculated for each         separate frequency band for the WOI data.  All rs-fMRI data is infraslow. 

    -separate folders for each scan that contain allfc.mat for each frequency band

-Windowedanalysis folder

    -includes folders for delta band and infraslow activity examined with different window lengths. For example, delta30s is delta band with 30 s       windows. For each frequency and window, there is a folder for each scan that contains dynfc.mat that contains a time series of matrices with       the same format at allfc.mat. For delta band, only calcium and HBT are calculated. 

Summary of code

    For all code, the paths at the top of the script will need to be changed to match your file structure.

    Modularityofmatrixfinetuned is used to calculate the modularity based on the FC matrix and can be used on single group level matrices,             individual time-averaged matrices, or windowed matrices. It uses the Brain Connectivity Toolbox from https://sites.google.com/site/bctnet and      calls on small scripts to remove NaNs in the matrices. NaNs show up in cortical areas that are not captured by WOI. 

    

    
