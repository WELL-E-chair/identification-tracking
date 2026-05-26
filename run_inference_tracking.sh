#!/bin/bash
#SBATCH --account=def-PIname
#SBATCH --gres=gpu:v100l:1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=20:50:00
#SBATCH --mail-user=youremail@address.com
#SBATCH --mail-type=ALL
#SBATCH --output=%x-%j.out

unset PYTHONPATH
export PYTHONNOUSERSITE=1

#module load python/3.11.5 cuda/12.2  
module restore my_enviroment

source ~/envs/my_env/bin/activate   

cd /path/to/main/dir

# 🚀 Runs inference script
python run_inference_tracking.py \
  --input-video /path/to/input/videos \
  --output-folder /path/to/output/video.mp4 \
  --yolo-model /path/to/model/best_yolov8_detection.pt \
  --num-classes 29 \
  --efficientnet-weights /path/to/model/best_model_efficientnet_b0.ckpt \
  --class-names-dir /path/to/input/videos
  
  
  
  
