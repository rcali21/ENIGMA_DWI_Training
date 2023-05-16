#!/bin/bash

cd ../data

#subjects=(sub-RC4111 sub-RC4119 sub-RC4210 sub-RC4217)
subjects=(sub-RC4111)

for subject in ${subjects[@]} ; 
do
	echo "Fitting tensor model to >>> ${subject} <<<"

    cmd="dtifit -k derivatives/${subject}/ses-1/dwi/preproc_dwi.nii.gz -o derivatives/${subject}/ses-1/dwi/${subject}_dtifit -m derivatives/${subject}/ses-1/dwi/preproc_dwi_mask.nii.gz -r derivatives/${subject}/ses-1/dwi/eddy_bvecs -b derivatives/${subject}/ses-1/dwi/eddy_bvals -V"
    echo $cmd
    eval $cmd

    # move all files with *dtifit* to new dtifit folder
    mkdir -p derivatives/${subject}/ses-1/dwi/dtifit && mv derivatives/${subject}/ses-1/dwi/${subject}_dtifit* derivatives/${subject}/ses-1/dwi/dtifit

done




