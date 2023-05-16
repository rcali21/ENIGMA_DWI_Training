#!/bin/bash

cd ../data

#subjects=(sub-RC4111 sub-RC4119 sub-RC4210 sub-RC4217)
subjects=(sub-RC4111)
for subject in ${subjects[@]} ; 
do
	echo "Running Eddy current and motion correction on >>> ${subject} <<<"

    cmd6="dwifslpreproc derivatives/${subject}/ses-1/dwi/dendg_dwi.nii.gz derivatives/${subject}/ses-1/dwi/preproc_dwi.nii.gz -fslgrad ${subject}/ses-1/dwi/*bvec ${subject}/ses-1/dwi/*bval -rpe_none -pe_dir AP -json_import ${subject}/ses-1/dwi/*.json -readout_time 0.045 -export_grad_fsl derivatives/${subject}/ses-1/dwi/eddy_bvecs derivatives/${subject}/ses-1/dwi/eddy_bvals -force"

    echo $cmd6
    eval $cmd6

done

