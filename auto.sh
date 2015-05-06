#!/bin/bash
echo "Hellow World"
scp -o StrictHostKeyChecking=no $1 root@10.0.40.127:/home/root/trik  # 'cd trik; echo "Hellow"; vi me.xml; :wq; sleep 3s' 




