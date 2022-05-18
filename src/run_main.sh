#!/bin/bash

myself=$(readlink -f $0)
SCRIPT_DIR=$(dirname ${myself})
BASEDIR=$(dirname ${SCRIPT_DIR})

SITENAME=askubuntu_unix_superuser

CQ_DATA_DIR=${BASEDIR}/data/$SITENAME
EMB_DIR=${BASEDIR}/data/embeddings/$SITENAME

PARAMS_DIR=${BASEDIR}/work/$SITENAME/MLE
if test ! -d ${PARAMS_DIR} ; then mkdir -p ${PARAMS_DIR} ; fi


python $SCRIPT_DIR/main.py    --train_context $CQ_DATA_DIR/train_context.txt \
                                    --train_question $CQ_DATA_DIR/train_question.txt \
                                    --train_answer $CQ_DATA_DIR/train_answer.txt \
                                    --train_ids $CQ_DATA_DIR/train_ids \
                                    --tune_context $CQ_DATA_DIR/tune_context.txt \
                                    --tune_question $CQ_DATA_DIR/tune_question.txt \
                                    --tune_answer $CQ_DATA_DIR/tune_answer.txt \
                                    --tune_ids $CQ_DATA_DIR/tune_ids \
                                    --test_context $CQ_DATA_DIR/test_context.txt \
                                    --test_question $CQ_DATA_DIR/test_question.txt \
                                    --test_answer $CQ_DATA_DIR/test_answer.txt \
                                    --test_ids $CQ_DATA_DIR/test_ids \
                                    --q_encoder_params $PARAMS_DIR/q_encoder_params \
                                    --q_decoder_params $PARAMS_DIR/q_decoder_params \
                                    --a_encoder_params $PARAMS_DIR/a_encoder_params \
                                    --a_decoder_params $PARAMS_DIR/a_decoder_params \
                                    --context_params $PARAMS_DIR/context_params \
                                    --question_params $PARAMS_DIR/question_params \
                                    --answer_params $PARAMS_DIR/answer_params \
                                    --utility_params $PARAMS_DIR/utility_params \
                                    --word_embeddings $EMB_DIR/word_embeddings.p \
                                    --vocab $EMB_DIR/vocab.p \
                                    --n_epochs 100 \
                                    --max_post_len 100 \
                                    --max_ques_len 20 \
                                    --max_ans_len 20 \
                                    --pretrain_ques True \

