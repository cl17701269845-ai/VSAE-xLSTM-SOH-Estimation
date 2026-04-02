# VSAE-xLSTM-SOH-Estimation
Code for the paper: "State of health estimation of lithium-ion batteries 
based on multi-stage feature engineering and deep learning fusion"

## Requirements
- Python 3.12.7
- PyTorch 2.7.0
- MATLAB R2024a
- CUDA 12.4

## Installation
pip install -r requirements.txt

## Dataset
- NASA PCoE: https://phm-datasets.s3.amazonaws.com/NASA/5.+Battery+Data+Set.zip
- Oxford: https://ora.ox.ac.uk/objects/uuid:03ba4b01-cfed-46d3-9b1a-7d4a7bdf6fac

## Usage
# Feature engineering
python feature_engineering.py

# Model training
python train.py --dataset NASA --battery B0005

# Evaluation
python evaluate.py
