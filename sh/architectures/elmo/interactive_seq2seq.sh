FAIRSEQ_PATH=/home/pafakanov/fairseq
DATA_PATH=/data/pafakanov/short_ria/data-bin
CHECKPOINT_PATH=/data/pafakanov/checkpoints/short_ria_seq2seq

python3 preprocess_article.py --data_path data.txt --save_path data_new.txt \

python $FAIRSEQ_PATH/interactive.py ${DATA_PATH} --path ${CHECKPOINT_PATH}/checkpoint_best.pt --remove-bpe --gen-subset test \
	                   --min-len 1 --beam 5 --no-repeat-ngram 3 --nbest 1 --input data_new.txt

