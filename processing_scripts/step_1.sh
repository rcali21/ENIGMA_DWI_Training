#!/bin/bash

cd ../data

#subjects=(sub-RC4111 sub-RC4119 sub-RC4210 sub-RC4217)
subjects=(sub-RC4111)

for subject in ${subjects[@]} ; 
do
	echo "Denoising >>> ${subject} <<<"
    echo ""
    # Denoise image
    cmd="dwidenoise ${subject}/ses-1/dwi/${subject}*dwi*.nii.gz derivatives/${subject}/ses-1/dwi/denoised_dwi.nii.gz -noise derivatives/${subject}/ses-1/dwi/${subject}_noise.nii.gz -force"
    echo ""
    echo $cmd
    eval $cmd

    # Generate residuals (This allows us to view what denoising did to our data)
    cmd1="mrcalc ${subject}/ses-1/dwi/${subject}_ses-1_dwi.nii.gz derivatives/${subject}/ses-1/dwi/denoised_dwi.nii.gz -subtract derivatives/${subject}/ses-1/dwi/denoised_residuals.nii.gz"
    echo ""
    echo $cmd1
    eval $cmd1

done

