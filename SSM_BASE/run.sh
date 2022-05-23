#!/bin/sh
#SBATCH -J SSM_BASE # Job name
#SBATCH --time=2-00:00:00
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
#SBATCH -p cas_v100_4 # GPU 선택
#SBATCH --comment pytorch
#SBATCH --nodes=1 # 노드 수
#SBATCH --ntasks-per-node=4 # 노드 당 프로세스
#SBATCH --cpus-per-task=10 # 프로세스 당 CPU core
#SBATCH --gres=gpu:4 # 노드 당 GPU

module purge
module load gcc/8.3.0 cuda/10.2
conda activate notebook


date
python train.py --dataset_root ../adobe_240 --checkpoint_dir ./checkpoint
date
