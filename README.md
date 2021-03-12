# quicksilver
A template for silver workflows. Clone this repo as an example of a recommended structure for silver workflows.

quicksilver.wdl is a groundbreaking workflow sure to revolutionize syngeristic foo-and-bar relations and lorem your ipsum. It does absolutely nothing, for it is a template, and yet, it does it with elegance and efficiency. The design philosphy of quicksilver.wdl is simple:
* Provide a mostly-blank repository that can be cloned and easily modified by researchers hoping to attain silver compliance with their workflows
* [Include a full checklist of every aspect needed for silver compliance](github.com/aofarrel/quicksilver/checklist.md) 
* Encourage researchers to fill out their own readmes with usage information in the interests of reproducibility
* Make you smile :)

## Usage
Clone this repository and fill it with your own code.

### README.md
This document should have information on how to use your workflow. Information about inputs, both optional and required, should be included. That being said the extact structure of your readme does not have to follow a rigid guideline. What matters is that the information -- basic information, usage, authorship, and references (if applicable). Remember, if no else can figure out how to use your code, it is not truly reproducible. A strong readme will also decrease the amount of time you may spend fielding questions from users.

### Dockerfile
Running on cloud platforms requires a Docker container. For Bronze workflows, you can simply use someone else's container provided it comes from a trusted source. But for silver workflows, you should provide your own Dockerfile which generates the Docker image used by your workflow. This Dockerfile needs to be publicly available so that people know what's in it. The container itself must also be public -- it may be registered on any of these platforms:
* DockerHub
* Quay.io
* Google Container Registry
* AWS ECR

For security reasons, your base image must be a well-maintained "official" base image, such as Google's official's golang containers, the official Ubuntu containers, etc. Additionally, everything added into your image should be very clear. For instance, your Dockerfile may clone a public GitHub repository containing code necessary for your container to run, but be aware of any vulnerabilities of the code you are bringing in. If you need to clone/apt-get/pip install a package that is not immediately obvious what its purpose is, include a comment in your Dockerfile explaining it -- for instance:

```
# these are required by samtools to work with CRAM files
RUN apt-get update
RUN apt-get install bzip2
RUN apt-get install zlib1g-dev
RUN apt-get install libbz2-dev -y
RUN apt-get install liblzma-dev -y

# install samtools
RUN wget https://github.com/samtools/samtools/releases/download/1.11/samtools-1.11.tar.bz2
RUN tar -vxjf samtools-1.11.tar.bz2
RUN cd samtools-1.11 && ./configure --without-curses && make && make install
```

It may also be worth scanning your container with vulnerability-checking software to see if it has any major vulnerabilities. 

### quicksilver.wdl
This represents your "main" workflow file, the one that does whatever analysis you have planned. WDL is the example we are using here, but the same logic applies for CWL. Your workflow may be in CWL or WDL; you do not need to include both. Unlike our template, yours should be tested and confirmed to work on one of our cloud compute platforms. Docker containers in here must be referenced by sha256 digest, not just tag.

### checker.wdl
This represents your checker workflow. Checker workflows are required for silver authorization, and must be run on the same test data that your workflow accepts. [You can read more about them here](https://docs.dockstore.org/en/develop/advanced-topics/checker-workflows.html).

### quicksilver.json
Represents your test data inputs. These should be open-access data in the form of hyperlinks. If you are writing a WDL and want this JSON to be able to be plugged into Terra directly, we recommend you put the data in a public google bucket and call them them in gs:// format rather than https://google.storage format. However, this is not a hard requirement -- what matters is that the data is public and useful as a test. It may be downsampled or artificial, but it should actually run, ie, not just be a blank file. **Do not include controlled-access data here.**

### checker.json
As above, but with inputs for your checker workflow.

## Cost Estimate
Although not required, we also recommend including cost estimation information from one of our cloud platforms in your README. It could be as simple as "if running this on default settings on a single whole-genome BAM file, you can expect it to take about 4 hours and to cost about $12.00," or you could have a full breakdown of every task's estimated costs depending on whether or not you get lucky with preemptible VMs. There is no one-size-fits-all solution to cost estimation; include what you think will be helpful to your users.

## Author
[Ash O'Farrell](mailto:aofarrel@ucsc.edu) -- University of California, Santa Cruz, Baskin Engineering, Genomics Insitute, The Desk That Is Located Near The Windowsill Upon Which I Found A Stray Whiteboard Marker Which I Used To Write That All Silver-Certified Workflows Should Include Authorship Information In Their README

## References
["Video: Kirill Petrenko conducts 4′33″ by John Cage".](https://www.berliner-philharmoniker.de/en/news/detail/video-kirill-petrenko-conducts-433-by-john-cage/) Berliner Philharmoniker. November 2, 2020. Retrieved March 12, 2021.
