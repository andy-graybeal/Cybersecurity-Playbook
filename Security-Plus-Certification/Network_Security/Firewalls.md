# Firewall - Shades of Grey

## Overview
In medieval times a firewall would sit at the entrance to a network, protecting it from malicious activity.   To address modern technologies, firewalls now come in a rainbow of different colors with added functionality, have become useful in different places and we keep adding functionality to them that they might even be named a different appliance all together.  
In it's basic sense, it's a packet filter.

# Rule and Policy Based firewalls

  - Rule Based firewalls use a list of rules that can allow or deny traffic, used in an IF-THEN-ELSE way
     - Parameters include:
	   - Source address
	   - Destination address
	   - Source Port
	   - Destination Port
	   - Protocol
	   - Direction
	   - Priority
	   - Time
	   - Context
	   - Action
  - Policy Based firewalls are considered more flexible.  Allowing for generic statements to be used insetad of specific rules.  These can also apply content/URL filtering.

# Hardware or Software
  - Hardware firewalls have more features, are more expensive and can require more effort to configure and manage.  It's operating system is specialized  and has less of a footprint and it's less likely to have something malicious happen to it.
  - Software firewall runs as a program on top of a computer.
  
# Host or Appliance or Virtual
  - Host-based firewall is a software firewall that runs on an endpoint
  - An Appliance firewall is the firewall that protects the entrance to a network
  - A virtual firewall is used in the cloud

# Open Source or Proprietary
  - Open-source firewalls - like pfSense run on FreeBSD, open and one of the most secure operating systems available
  - Proprietary firewalls - well you don't know what they run on, they are closed and it's a big secret.  Security by Obscurity is not security.

# Stateful vs Stateless
  - Steteless packet filtering operates at OSI layer 3.  Makes decisions just on it's rules
  - Stateful packet filtering operates at OSI layer 4.  Can make decsions based on sessions
  
# Dedicated vs Network Access Control List
  - Other devices such as routers or switches can incorporate firewall's network ACL's and act like firewalls 

# Specialized firewalls
  - Web Application Firewall (WAF) - Monitors applications using HTTP.  It can block websites or attacks that attempt to exploit vunerabilities in client apps, XSS and SQL injections.
  - Next-generation Firewall (NGFW) - Can filter packets based on applications. Using "deep packet inspection" to determine if something malicious is included. Perform URL Filtering and Intrusion prevention services.
  - Unified Threat Management (UTM) - Swiss army knife style - combines packet filtering, antispam, antiphishing, antispyware, encryption, instrusion protection and web filtering
  - Layer 7 Firewall - Advenced traffic filtering and can determine if packets contain mailicous content
  - Network Address Translation gateway (NAT) - a technology that allows private IP's to look like public IP's and can reverse NAT so the otherway around works to a public IP can be routed to a private IP

