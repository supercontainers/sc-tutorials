---
layout: page
title: Setup
root: .
---


### Key requirement

The main requirement for this workshop is a personal computer with a web browser and a command line shell program.  

*Windows* users: [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html) is the *preferred option*.  The *Portable Edition* is best, as it does not require administrative privileges.  
<!--Other acceptable options would be [Visual Studio Code](https://code.visualstudio.com/) or PuTTY, but you will also need to install [Cygwin/X](https://x.cygwin.com) to run the example on X11 applications.  -->
In this way you will be able to follow the online materials and to login to a facility with the required software stack.


### Training accounts

We will be providing training user accounts to both pre-configured EC2 instances.

<div style="text-align:center"><img src="fig/AWS_logo.png" width="250"></div>

This tutorial is supported by the Amazon AWS Machine Learning Research Awards. EC2 images and temporary login credentials will be distributed onsite at the tutorial. Here are <A HREF="https://drive.google.com/file/d/14l6LEfuXyH-E4rx2enMAaXrdRSZ-R1Fr/view?usp=share_link">setup slides</A>. 

After the tutorial, you can boot our tutorial image yourself on Amazon EC2 to run through the tutorial again. We recommend you use your own EC2 key and change the password.

US-West-Oregon: ami-0fe12765123c6a840


### NERSC Training Accounts (optional)

In addition to the AWS instances, you can also try running some of the Shifter-based excercises on NERSC's Cori system, a Cray XC40 system.  To sign-up for a NERSC tutorial account, visit
[https://iris.nersc.gov/train](https://iris.nersc.gov/train) and fill out the form.  The training code will be provided during the tutorial.  Please note that, due to security
restrictions, access may be limited but all of the excercises can be done on the AWS instances.


### Materials repository

To run the examples yourself, you can download the materials with:

```bash
cd ~
git clone https://github.com/supercontainers/sc-tutorials.git
cd sc-tutorials/exercies
```


> ## Prerequisites for self-paced tutorials
> 
> Users can also install Docker and Singularity prior to attending the tutorial session.  MPICH is required for running the MPI examples, too.  
> Here, it may be beneficial to create a Docker and Sylabs (Singularity) account in advance at [https://cloud.docker.com](https://cloud.docker.com) and [https://cloud.sylabs.io](https://cloud.sylabs.io).  These accounts will be needed to create images on Docker Cloud/DockerHub and Sylabs Cloud.
> 
> [Install Singularity on Linux]({{ page.root }}/files/install-singularity.sh) \| [docs](https://singularity.hpcng.org/user-docs/3.5/quick_start.html)
> 
> [Install Docker on Linux]({{ page.root }}/files/install-docker.sh) \| [docs (unofficial)](https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-docker-on-ubuntu-18-04-lts-bionic-beaver.html)
> 
> [Install Charliecloud on Linux]({{ page.root }}/files/install-charliecloud.sh) (uses Spack) \| [docs](https://hpc.github.io/charliecloud)
> 
> [Install Environment Modules on Linux]({{ page.root }}/files/install-modules.sh) \| [docs](http://modules.sourceforge.net)
> 
> [Install SHPC on Linux]({{ page.root }}/files/install-shpc.sh) \| [docs](https://singularity-hpc.readthedocs.io)
> 
> [Install MPICH on Linux]({{ page.root }}/files/install-mpich.sh) \| [docs](https://www.mpich.org/documentation/guides/)
> 
> [Install Nextflow on Linux]({{ page.root }}/files/install-nextflow.sh) \| [docs](https://www.nextflow.io/docs/latest/getstarted.html)
> 
> [Install Docker Compose on Linux]({{ page.root }}/files/install-dockercompose.sh) \| [docs](https://docs.docker.com/compose/)
> 
> **Note:** install scripts have been tested on a Ubuntu machine through a user that can run *sudo* commands without password prompts. There's no warranty they will work in your Linux box, you should consider them as templates.
> 
> ### macOS or Windows machine
> 
> For *Singularity*, you will need to setup a Linux virtual machine, and then follow the same instructions as above.  
> It's not as bad as it sounds... the main two options are:
>   - Vagrant: follow these instructions by Sylabs on [Setting up Singularity with Vagrant](https://singularity.hpcng.org/admin-docs/3.5/installation.html#installation-on-windows-or-mac) (*macOS* users: DO NOT use the proposed *Singularity Desktop*, use Vagrant instead);
>   - Multipass: follow instructions from the [Multipass Homepage](https://multipass.run).
> 
> For *Docker*, you can download and run installers for [macOS](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) and [Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows/).
{: .solution}
