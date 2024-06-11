#!/usr/bin/env /usr/bin/bash

# Add orange and blue links
# e0_1
sudo ovs-ofctl add-flow e0_1 priority=500,in_port=3,actions=output:1
sudo ovs-ofctl add-flow e0_1 priority=500,in_port=4,actions=output:1
sudo ovs-ofctl add-flow e0_1 priority=500,in_port=1,actions=output:3,4
# e0_2
sudo ovs-ofctl add-flow e0_2 priority=500,in_port=3,actions=output:1
sudo ovs-ofctl add-flow e0_2 priority=500,in_port=1,actions=output:3
# a0_1
sudo ovs-ofctl add-flow a0_1 priority=500,in_port=5,actions=output:6
sudo ovs-ofctl add-flow a0_1 priority=500,in_port=6,actions=output:5

# Add green and red links
# e1_1
sudo ovs-ofctl add-flow e1_1 priority=500,in_port=3,actions=output:1
sudo ovs-ofctl add-flow e1_1 priority=500,in_port=4,actions=output:1
sudo ovs-ofctl add-flow e1_1 priority=500,in_port=1,actions=output:3,4
# e1_2
sudo ovs-ofctl add-flow e1_2 priority=500,in_port=3,actions=output:1
sudo ovs-ofctl add-flow e1_2 priority=500,in_port=1,actions=output:3
# a1_1
sudo ovs-ofctl add-flow a1_1 priority=500,in_port=5,actions=output:2,6
sudo ovs-ofctl add-flow a1_1 priority=500,in_port=2,actions=output:5
sudo ovs-ofctl add-flow a1_1 priority=500,in_port=6,actions=output:5
# c2
sudo ovs-ofctl add-flow c2 priority=500,in_port=3,actions=output:5
sudo ovs-ofctl add-flow c2 priority=500,in_port=5,actions=output:3
# a2_1
sudo ovs-ofctl add-flow a2_1 priority=500,in_port=2,actions=output:5
sudo ovs-ofctl add-flow a2_1 priority=500,in_port=5,actions=output:2
# e2_1
sudo ovs-ofctl add-flow e2_1 priority=500,in_port=4,actions=output:1
sudo ovs-ofctl add-flow e2_1 priority=500,in_port=1,actions=output:4

# Add pink and purple links
# e3_1
sudo ovs-ofctl add-flow e3_1 priority=500,in_port=3,actions=output:4
sudo ovs-ofctl add-flow e3_1 priority=500,in_port=4,actions=output:2,3
sudo ovs-ofctl add-flow e3_1 priority=500,in_port=2,actions=output:4
# e3_2
sudo ovs-ofctl add-flow e3_2 priority=500,in_port=3,actions=output:2
sudo ovs-ofctl add-flow e3_2 priority=500,in_port=2,actions=output:3
# a3_2
sudo ovs-ofctl add-flow a3_2 priority=500,in_port=5,actions=output:6
sudo ovs-ofctl add-flow a3_2 priority=500,in_port=6,actions=output:5

