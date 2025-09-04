Prompt:
    • When to use star vs mesh topology.
    • Key differences between switches and routers

Star vs Mesh
Star topology is used to create LAN based networks.  Smaller networks that connect to a switch to communicate with each other.  The advantage of a star-network is that each device connects to a central point and doesn’t have to connect to each other to communicate.

A mesh topology is used when either redundancy for fail-over or load balancing is needed and is mostly used in larger WAN networks.

Mesh topology is also used in wireless networks to increase coverage, with multiple Access Points working together.  Another example of devices using a mesh topology are IoT devices like Zigbee that use a wireless mesh in environmental/building sensor/actuator type automation networks.  

Advantages of using a mesh topology is that many devices communicate with each other and the network can self-heal also if part of it gets turned off.


Switches VS Routers
The broad stroke explanation is that a switch connects devices together creating a local network and a router connects these separate networks together forming a network of networks.

A switch is able to move data from one computer to another on a the local network using each devices MAC addresse.  MAC addresses are not routable, so if I need to talk to a computer on another network I need a router to assist me.  A router pays attention to the machines IP addresses.

There exists something called an OSI model.  This model has 7 layers and is complex and we will get to that later, but for now we are focusing on two layers.  Switches operate at what’s known as the second layer or the Data Link Layer.  It can bounce around data using MAC addresses.  Routers communicate on the layer above that, layer 3, known as the Network Layer.  Routers use IP addresses to move data around.  

There does exist Layer 3 switches which act as a switch and router.  This type of switch is best used in complex networks where inter-VLAN communication is needed.

It’s all way more complex than this but this is the main idea.
