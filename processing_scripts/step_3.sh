#!/bin/bash

cd ../data

#subjects=(sub-RC4111 sub-RC4119 sub-RC4210 sub-RC4217)
subjects=(sub-RC4111)

for subject in ${subjects[@]} ; 
do
	echo "Performing brain extraction on >>> ${subject} <<<"
    echo ""
    cmd="dwi2mask derivatives/${subject}/ses-1/dwi/dendg_dwi.nii.gz derivatives/${subject}/ses-1/dwi/dendg_dwi_mask.nii.gz -fslgrad ${subject}/ses-1/dwi/*bvec ${subject}/ses-1/dwi/*bval"
    echo $cmd
    eval $cmd

done

