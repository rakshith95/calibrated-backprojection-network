#!/bin/bash

export CUDA_VISIBLE_DEVICES=0

python src/run_kbnet.py \
--image_path testing/void/void_test_image_1500.txt \
--sparse_depth_path testing/void/void_test_sparse_depth_1500.txt \
--intrinsics_path testing/void/void_test_intrinsics_1500.txt \
--ground_truth_path testing/void/void_test_ground_truth_1500.txt \
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
--depth_model_restore_path traine_with_poses.pth \
--output_path \
evaluation_results/void1500_poses \
--device gpu