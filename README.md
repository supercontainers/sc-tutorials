# Getting Started with Containers on HPC

View this on the [Tutorial Homepage](https://supercontainers.github.io/sc-tutorials/).


## ECP Supercontainers Tutorial Session

<img src="fig/ecp.jpg" width="250"><img src="fig/pawsey.png" width="250"><img src="fig/redhat.png" width="250">


## Details

Full-day Tutorial Session

Venue: Supercomputing Conference (SC 21)

Date: Monday, 15 November 2021 8am - 5pm Central Standard Time (GMT -6)

Location: Virtual, St. Louis MO, USA

Link: [SC 2021 Tutorial Details](https://sc21.supercomputing.org/presentation/?id=tut114&sess=sess185)

Keywords: Containerized HPC, System Software and Runtime Systems, Scientific Software Development, DevOps


## EC2 Login

These will be provided the day of the tutorial.


## Abstract

Within just the past few years, the use of containers has revolutionized the way in which industries and enterprises have developed and deployed computational software and distributed systems. The containerization model has gained traction within the HPC community as well with the promise of improved reliability, reproducibility, portability, and levels of customization that were previously not possible on supercomputers. This adoption has been enabled by a number of HPC Container runtimes that have emerged including Singularity, Shifter, Enroot, Charliecloud and others.

This hands-on tutorial looks to train users on the usability of containers on HPC resources. We will provide a detailed background on Linux containers, along with introductory hands-on experience building a container image, sharing the container and running it on a HPC cluster. Furthermore, the tutorial will provide more advanced information on how to run MPI-based and GPU-enabled HPC applications, how to optimize I/O intensive workflows, and how to setup GUI enabled interactive sessions. Cutting-edge examples will include machine learning and bioinformatics. Users will leave the tutorial with a solid foundational understanding of how to utilize containers with HPC resources through Shifter and Singularity, as well as an in-depth knowledge to deploy custom containers on their own resources.


## Prerequisites

This is a hands-on tutorial.  Participants should bring a laptop and load or pre-install a terminal and/or ssh client in advance to make best use of time during the tutorial.  We will be providing training user accounts to both pre-configured EC2 instances.

<div style="text-align:center"><img src="fig/AWS_logo.png" width="250"></div>

This tutorial is supported by the Amazon AWS Machine Learning Research Awards.  EC2 images and temporary login credentials will be distributed onsite at the tutorial.

After the tutorial, you can boot our tutorial image yourself on Amazon EC2 to run through the tutorial again. We recommend you use your own EC2 key and change the password.

US-West-Oregon: ami-0fe12765123c6a840 


### Optional Prerequisites

Users can also install Docker and Singularity prior to attending the tutorial session.  Here, it may be beneficial to create Docker and Sylabs (Singularity) accounts in advance at https://cloud.docker.com/ and https://cloud.sylabs.io/.  These accounts will be needed to create images on Docker Cloud/Dockerhub and Sylabs Cloud.

[Install Singularity on Linux](https://sylabs.io/guides/3.7/user-guide/)

[Install Singularity on Mac](https://repo.sylabs.io/desktop/) (Alpha)

[Install Docker for Desktop](https://www.docker.com/products/docker-desktop)


## Questions

You can ask questions verbally or with this [Google Doc](https://docs.google.com/document/d/11gMZ-T7iA5XiRWPLYIqX7Gqv7RMb-NF9kzGYHrnOi04/edit?usp=sharing).
Please append your question below the others in the document.

We have also created a Slack Team for this.  The invitation link is [here](https://join.slack.com/t/hpc-containers/shared_invite/enQtODI3NzY1NDU4OTk5LTUxOTgyOWJmYjIwOWI5YWU2MzBhZDI3Zjc1YmZmMjAxZjgzYzk4ZWEwNmFlNzlkOWI0MGNlZDNlMTBhYTBlOWY).


## Schedule

WORK IN PROGRESS - ORDER OF TOPICS TO BE DISCUSSED

8:30 - 8:45 Introduction to containers in HPC (Shane)  
Including defining jargon (containers, images, registries/repos,..)  

8:45 - 9:25 Build and run your first container with Podman (Shane)  
Including also minimal pull and run examples, to define these concepts  

9:25 - 10:00 Deploy containers on a supercomputer (Marco)  

10:00 - 10:30 MORNING BREAK

10:30 - 11:00 High-performance containers (Marco)  

11:00 - 11:30 Best practices (Shane)  

11:30 - 12:00 E4S containers initiative (Sameer)  

12:00 - 13:30 LUNCH BREAK (WE CAN CHOOSE BETWEEN RESTART AT 13 OR 13:30, HAVE TO TELL ORGANISERS)

13:30 - 13:50 Advanced container builds (Eduardo)  

13:50 - 15:00 TO BE DECIDED

15:00 - 15:30 AFTERNOON BREAK

15:30 - 16:55 TO BE DECIDED

16:55 - 17:00 Wrap-up and final Q&A  


## WORK IN PROGRESS

Topics that we could add:
- HPC containers: more detailed MPI discussion with MPI swap (Sameer's examples)
- Interactive RStudio
  - NERSC Spin (Shane)
  - RStudio on a cloud VM with Docker (Marco)
- User cases
  - Gromacs on Nvidia GPUs (Marco)
  - Nextflow bioinformatics workflows (Marco)
- Deployment as Container Modules
  - with Singularity Registry HPC, SHPC (Marco)
  - ? compatibility layer in Shifter (Shane)
- ? Kubernetes deployments (Eduardo)
- ? Creating Dockerfiles with Spack (Eduardo)
