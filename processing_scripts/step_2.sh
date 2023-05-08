#!/bin/bash

cd ../data

subjects=(sub-RC4111 sub-RC4119 sub-RC4210 sub-RC4217)

for subject in ${subjects[@]} ; 
do
	echo "Removing Gibbs ringing artifacts from >>> ${subject} <<<"
    echo ""
    cmd="mrdegibbs ${subject}/ses-1/dwi/${subject}*denoised*.nii.gz derivatives/${subject}/ses-1/dwi/dendg_dwi.nii.gz -force"
    echo ""
    echo $cmd
    eval $cmd
done

