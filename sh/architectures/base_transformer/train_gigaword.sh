FAIRSEQ_PATH=/home/phramer/fairseq/
DATA_PATH=/home/phramer/data/gigaword_3e5/data-bin
LM_CHECKPOINT_PATH=/home/whiteRa2bit/checkpoints/gigaword


python $FAIRSEQ_PATH/train.py $DATA_PATH --clip-norm 0.1 \
  --fp16  --optimizer adam --adam-betas '(0.9, 0.98)' --skip-invalid-size-inputs-valid-test \
  --lr-scheduler inverse_sqrt --warmup-init-lr 1e-07 --warmup-updates 4000 --lr 0.0005 \
  --min-lr 1e-09 --clip-norm 0.0 --dropout 0.3 --weight-decay 0.0 \
  --max-tokens 3000 --criterion label_smoothed_cross_entropy --label-smoothing 0.1 \
  --max-epoch 200 --arch  transformer --save-dir $LM_CHECKPOINT_PATH --bpe bert \
  --source-lang articles --target-lang summaries --dataset-impl lazy  --num-workers 70 \
  --memory-efficient-fp16
