#!/bin/bash
clear

# Exit early if any of the commands fails
set -e

echo "============================================"
echo "Check tensorflow:                           "
echo "============================================"

/opt/tensorflow/bazel-bin/tensorflow/cc/tutorials_example_trainer --use_gpu


echo "============================================"
echo "Check python tensorflow:                    "
echo "============================================"

python -c "import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
sess.run(hello)
a = tf.constant(10)
b = tf.constant(32)
print(sess.run(a+b))
"
# should return 42
