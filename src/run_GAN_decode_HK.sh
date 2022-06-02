#!/bin/bash

myself=$(readlink -f $0)
SCRIPT_DIR=$(dirname ${myself})
BASEDIR=$(dirname ${SCRIPT_DIR})

SITENAME=Home_and_Kitchen

CQ_DATA_DIR=${BASEDIR}/data/$SITENAME
EMB_DIR=${BASEDIR}/data/embeddings/$SITENAME

PARAMS_DIR=${BASEDIR}/work/$SITENAME
if test ! -d ${PARAMS_DIR} ; then mkdir -p ${PARAMS_DIR} ; fi

python $SCRIPT_DIR/decode.py        --test_context $CQ_DATA_DIR/test_context.txt \
                                    --test_ques $CQ_DATA_DIR/test_ques.txt \
                                    --test_ans $CQ_DATA_DIR/test_ans.txt \
                                    --test_ids $CQ_DATA_DIR/test_asin.txt \
                                    --test_pred_ques $CQ_DATA_DIR/blind_test_pred_ques.txt \
                                    --q_encoder_params $PARAMS_DIR/q_encoder_params.epoch100.GAN_selfcritic_pred_ans.epoch12 \
                                    --q_decoder_params $PARAMS_DIR/q_decoder_params.epoch100.GAN_selfcritic_pred_ans.epoch12 \
                                    --word_embeddings $EMB_DIR/word_embeddings.p \
                                    --vocab $EMB_DIR/vocab.p \
                                    --model GAN_selfcritic_pred_ans.epoch12 \
                                    --max_post_len 100 \
                                    --max_ques_len 20 \
                                    --max_ans_len 20 \
                                    --batch_size 128 \
                                    --beam True

