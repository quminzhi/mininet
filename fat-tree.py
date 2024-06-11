from mininet.net import Mininet
from mininet.node import Node, OVSSwitch, Controller
from mininet.topo import Topo
from mininet.cli import CLI
from mininet.link import TCLink

import time

class FatTreeTopo(Topo):
    def __init__(self, link_bw=12, link_delay='2ms', **opts):
        super(FatTreeTopo, self).__init__(**opts)
        
        core_switches = []
        aggregation_switches = []
        edge_switches = []
        hosts = []

        # Add core switches
        for i in range(4):
            switch = self.addSwitch('c{}'.format(i + 1))
            core_switches.append(switch)

        # Add aggregation and edge switches, and connect them
        for pod in range(4):
            pod_aggregation = []
            pod_edge = []

            # Add aggregation switches
            for i in range(2):
                switch = self.addSwitch('a{}_{}'.format(pod, i + 1))
                pod_aggregation.append(switch)
                aggregation_switches.append(switch)

            # Add edge switches
            for i in range(2):
                switch = self.addSwitch('e{}_{}'.format(pod, i + 1))
                pod_edge.append(switch)
                edge_switches.append(switch)

            # Connect aggregation switches to core switches
            for agg in pod_aggregation:
                for core in core_switches:
                    self.addLink(agg, core, bw=link_bw, delay=link_delay)

            # Connect edge switches to aggregation switches
            for edge in pod_edge:
                for agg in pod_aggregation:
                    self.addLink(edge, agg, bw=link_bw, delay=link_delay)

            # Add hosts and connect them to edge switches
            for i in range(2):
                for j in range(2):
                    host = self.addHost('h{}_{}'.format(pod, i * 2 + j + 1))
                    hosts.append(host)
                    self.addLink(host, pod_edge[i], bw=link_bw, delay=link_delay)

def run():
    # topo = { 'fattopo': ( lambda: FatTreeTopo() ) }
    topo = FatTreeTopo()
    net = Mininet(topo=topo, switch=OVSSwitch, link=TCLink, controller=None)
    net.start()
    # time.sleep(20) # wait for 20s routing to converge
    # net.pingAll()
    CLI(net)
    net.stop()

if __name__ == '__main__':
    run()

