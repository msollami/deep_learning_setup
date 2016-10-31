
echo "============================================"
echo "manual configuration of Torch demo"
echo "Andrej Karpathy's code from The Unreasonable Effectiveness of Recurrent Neural Networks available at https://github.com/karpathy/char-rnn"
echo "http://karpathy.github.io/2015/05/21/rnn-effectiveness/" 
echo "============================================"
echo "To setup torch example, run"
echo "============================================"
cd ~
luarocks install nngraph; luarocks install optim; luarocks install nn; luarocks install cutorch; luarocks install cunn
git clone https://github.com/karpathy/char-rnn 
cd char-rnn

echo "============================================"
echo "Done with setting up the example" 
echo "============================================"
echo "here is how to start to execute 6330 batches of training"
th train.lua -gpuid -0

echo "============================================"
echo "automatically  saves checkpoints like for example; "
echo "1000/21150 |  saving checkpoint to cv/lm_lstm_epoch2.36_1.7848.t7"
echo "============================================"
echo "Based on a earlier certain checkpoint file we can now generate new text"  

th sample.lua cv/lm_lstm_epoch2.36_1.7848.t7

echo "============================================"