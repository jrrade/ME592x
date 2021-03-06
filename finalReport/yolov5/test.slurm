#!/bin/bash

# Copy/paste this job script into a text file and submit with the command:
#    sbatch thefilename
# job standard output will go to the file slurm-%j.out (where %j is the job ID)

#SBATCH --time=03:00:00   # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=1   # 1 processor core(s) per node 
#SBATCH --gres=gpu:1
#SBATCH --partition=gpu    # gpu node(s)
#SBATCH --job-name="yolo"
#SBATCH --mail-user=jrrade@iastate.edu   # email address
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HEREmodule load miniconda3
module load miniconda3
source activate yolov3

python test.py --data projectdata.yaml  --img-size 416 --batch-size 16 --conf-thres 0.1 --iou-thres 0.45 --task val --single-cls --save-txt --save-hybrid --save-conf --device 0 --weights ./runs/train/yolov5s_is_416_bs_16_e_200/weights/best.pt  --name yolov5s_is_416_bs_16_e_200_conf_0.1

python test.py --data projectdata.yaml  --img-size 416 --batch-size 16 --conf-thres 0.1 --iou-thres 0.45 --task val --single-cls --save-txt --save-hybrid --save-conf --device 0 --weights ./runs/train/yolov5m_is_416_bs_16_e_200/weights/best.pt  --name yolov5m_is_416_bs_16_e_200_conf_0.1

python test.py --data projectdata.yaml  --img-size 416 --batch-size 16 --conf-thres 0.1 --iou-thres 0.45 --task val --single-cls --save-txt --save-hybrid --save-conf --device 0 --weights ./runs/train/yolov5l_is_416_bs_16_e_200/weights/best.pt  --name yolov5l_is_416_bs_16_e_200_conf_0.1

python test.py --data projectdata.yaml  --img-size 416 --batch-size 16 --conf-thres 0.1 --iou-thres 0.45 --task val --single-cls --save-txt --save-hybrid --save-conf --device 0 --weights ./runs/train/yolov5x_is_416_bs_16_e_200/weights/best.pt  --name yolov5x_is_416_bs_16_e_200_conf_0.1
