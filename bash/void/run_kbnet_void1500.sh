#!/bin/bash

export CUDA_VISIBLE_DEVICES=0

python src/run_kbnet.py \
--image_path /home/rakshith/CTU/Sem_3/Project/Depth\ Completion/repos/Awong/calibrated-backprojection-network/test_data/img.txt \
--sparse_depth_path /home/rakshith/CTU/Sem_3/Project/Depth\ Completion/repos/Awong/calibrated-backprojection-network/test_data/sparse.txt \
--intrinsics_path /home/rakshith/CTU/Sem_3/Project/Depth\ Completion/repos/Awong/calibrated-backprojection-network/test_data/K.txt \
--ground_truth_path /home/rakshith/CTU/Sem_3/Project/Depth\ Completion/repos/Awong/calibrated-backprojection-network/test_data/gt.txt \
--input_channels_image 3 \
--input_channels_depth 2 \
--normalized_image_range 0 1 \
--outlier_removal_kernel_size 7 \
--outlier_removal_threshold 1.5 \
--min_pool_sizes_sparse_to_dense_pool 15 17 \
--max_pool_sizes_sparse_to_dense_pool 23 27 29 \
--n_convolution_sparse_to_dense_pool 3 \
--n_filter_sparse_to_dense_pool 8 \
--n_filters_encoder_image 48 96 192 384 384 \
--n_filters_encoder_depth 16 32 64 128 128 \
--resolutions_backprojection 0 1 2 3 \
--n_filters_decoder 256 128 128 64 12 \
--deconv_type up \
--weight_initializer xavier_normal \
--activation_func leaky_relu \
--min_predict_depth 0.1 \
--max_predict_depth 8.0 \
--min_evaluate_depth 0.2 \
--max_evaluate_depth 5.0 \
--save_outputs \
--depth_model_restore_path \
pretrained/pretrained_models/void/kbnet-void1500.pth \
--output_path \
pretrained_models/void/evaluation_results/void1500 \
--device gpu