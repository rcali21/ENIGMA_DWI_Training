#!/bin/bash

cd ../data

subjects=(sub-RC4111 sub-RC4119 sub-RC4210 sub-RC4217)

for subject in ${subjects[@]} ; 
do
	echo "Processing >>> ${subject} <<<"
    cmd="dwidenoise ${subject}/ses-1/dwi/${subject}*dwi*.nii.gz derivatives/${subject}/ses-1/dwi/denoised_dwi.nii.gz -noise derivatives/${subject}/ses-1/dwi/${subject}_noise.nii.gz -force"
    echo $cmd
    eval $cmd
done

