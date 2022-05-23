#!/bin/sh
#SBATCH -J SSM_SINGLE # Job name
#SBATCH --time=2-00:00:00
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
#SBATCH -p cas_v100_4 # GPU 선택
#SBATCH --comment pytorch
#SBATCH --nodes=1 # 노드 수
#SBATCH --ntasks-per-node=40 # 프로세스 수
#SBATCH --gres=gpu:4 # GPU 개수

module purge
module load gcc/8.3.0 cuda/10.2
conda activate notebook


date
python train.py --dataset_root ../adobe_240 --checkpoint_dir ./checkpoint
date
