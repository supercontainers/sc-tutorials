# Getting Started with Containers on HPC

View this on the [Tutorial Homepage](https://supercontainers.github.io/sc-tutorials/).


## ECP Supercontainers Tutorial Session

<img src="fig/ecp.jpg" width="200"><img src="fig/pawsey.png" width="200"><img src="fig/redhat.png" width="200">


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

WORK IN PROGRESS  

8:00 - 8:20 Introduction and Update on Linux containers - SLIDES (Shane)  
Including logging into VM, and defining jargon  

8:20 - 8:50 Running containers (Shane)  
Using Docker and Podman to run containers  

8:50 - 9:30 Building and sharing container image (Eduardo?)  
Might also include creating Dockerfiles with Spack, and Buildah?  

9:30 - 10:00 Container images best practices (Shane)  

10:00 - 10:30 MORNING BREAK

10:30 - 10:50 HPC and Containers - SLIDES (Shane)  
Intro to the need for HPC Runtimes and Use Cases  

10:50 - 11:10 Installing a container engine (who?)  
Install Singularity and Charliecloud.  

11:10 - 11:40 Running HPC jobs with containers (Marco)  
Using Singularity and Shifter to run containers on HPC  
Might also include deploying Containers as Modules:
- with Singularity Registry HPC, SHPC (Marco)
- with compatibility layer in Shifter? (Shane)
- in this case, possibly take 10 extra minutes from the next slot

11:40 - 12:00 Interactive Q & A  
Using Slurm to submit container jobs  

12:00 - 13:00 LUNCH BREAK

13:00 - 13:30 Optional Q & A Session

13:30 - 14:20 Advanced use cases (Marco)  
Might include:
- MPI (including Sameers' MPI swap)
- Gromacs on Nvidia GPUs
- Intensive I/O using OverlayFS, TrinityRNAseq
- Nextflow bioinformatics workflows

14:20 - 15:00 Deploying Services with Containers (multiple presenters?)  
Might include:
- A brief overview of deploying services using Rancher (Shane)
- RStudio on a cloud VM with Docker (Marco)
- Kubernetes deployments? (Eduardo)

15:00 - 15:30 AFTERNOON BREAK

15:30 - 16:20 Containers with E4S (Sameer)  
Use xSDK/E4S containers  

16:20 - 16:40 Success Stories and Use Cases (Shane)
Examples of Containers used in a variety of uses and scales  

16:40 - 17:00 Interactive Q & A  
Including closing remarks, survey and feedback  


