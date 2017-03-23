fuser -k 8888/tcp
tensorboard --logdir=/tmp/cifar10_train --port=8888 &
python cifar10_train.py
python cifar10_eval.py --run_once=True --eval_data=test > /tmp/cifar10_train/test_percision.txt
python cifar10_eval.py --run_once=True --eval_data=train_eval > /tmp/cifar10_train/train_percision.txt
cp -r /tmp/cifar10_train trains/newest
tail /tmp/cifar10_train/test_percision.txt /tmp/cifar10_train/train_percision.txt
echo "be sure to rename trains/newest"
