# quicksilver
![https://img.shields.io/github/repo-size/aofarrel/quicksilver](https://img.shields.io/github/repo-size/aofarrel/quicksilver)  
A "good practices" template for workflows on [Dockstore](https://dockstore.org). Clone this repo as an example of a recommended structure for your repository.

quicksilver.wdl is a groundbreaking workflow sure to revolutionize syngeristic foo-and-bar relations and lorem your ipsum. It does absolutely nothing, for it is a template, and yet, it does it with elegance and efficiency. The design philosphy of quicksilver.wdl is simple:
* Provide a mostly-blank repository that can be cloned and easily modified by researchers hoping to attain silver compliance with their workflows
* Encourage researchers to fill out their own readmes with usage information in the interests of reproducibility
* Make you smile :)

## Usage
Clone this repository and fill it with your own code.

### README.md
This document should have information on how to use your workflow. Information about inputs, both optional and required, should be included. That being said the extact structure of your readme does not have to follow a rigid guideline. What matters is that the information -- basic information, usage, authorship, and references (if applicable). Remember, if no else can figure out how to use your code, it is not truly reproducible. A strong readme will also decrease the amount of time you may spend fielding questions from users.

### Dockerfile
Running on cloud platforms requires a Docker container. Of course, you may find your uses are served by an existing workflow, so there is no need to include a Dockerfile. But if you are using a custom Docker container for your workflow, you should also provide your own Dockerfile which generates the Docker image used by your workflow. The container itself should also be public -- we recommend any of the following platforms.
* DockerHub
* Quay.io
* Google Container Registry
* AWS ECR

For security reasons, your base image should be a well-maintained "official" base image, such as Google's official's golang containers, the official Ubuntu containers, the official Python image, etc. Additionally, everything added into your image should have a clear purporse. For instance, your Dockerfile may clone a public GitHub repository containing code necessary for your container to run, but be aware of any vulnerabilities of the code you are bringing in. If you need to clone/apt-get/pip install a package that is not immediately obvious what its purpose is, include a comment in your Dockerfile explaining it -- for instance:

```
# these are required by samtools to work with CRAM files
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

### quicksilver.json
Represents your test data inputs. These should be open-access data in the form of hyperlinks. If you are writing a WDL and want this JSON to be able to be plugged into Terra directly, we recommend you put the data in a public google bucket and call include links in gs:// format rather than https://google.storage format. However, Google buckets are not a hard requirement -- what matters is that the data is public and useful as a test. Your test data may be downsampled or artificial, but it should actually run, ie, not just be a blank file.

You may want to include multiple test JSONs for different compute platforms -- for instance, perhaps quicksilver_terra.json has gs:// URIs while quicksilver_https.json could be used for local users who do not have the requisite tools for pulling from gs:// URIs.

It should go without saying, but we will make note of it regardless: **Do not include controlled-access data here. Also do not include data derived from controlled-access data.** If you are looking for test files representative of real data, we recommend using 1000 Genomes, which is public.

### quicksilver.wdl
This represents your "main" workflow file, the one that does whatever analysis you have planned. WDL is the example we are using here, but the same logic applies for CWL or Nextflow. Unlike our template, your workflow should actually be tested and confirmed to work on one of our cloud compute platforms. Docker containers used by your workflow file(s) ought to be referenced by the sha256 digest of a container known to work, not just tag.

### checker.wdl
This represents your checker workflow. Checker workflows are recommended for all workflows and are a great way to provide an easy test for both you and your users. [You can read more about them here](https://docs.dockstore.org/en/develop/advanced-topics/checker-workflows.html).

### checker.json
As above, but with inputs for your checker workflow.

### checkertruth.txt
A truth file for your checker workflow with contains the expected outputs of your main workflow. This doens't need to be in your repo -- you can instead host it on a public bucket, website, etc. Just make sure that it is public, wherever it is, so people can run your checker workflow.

## Cost Estimate
Although not required, we also recommend including cost estimation information from one of our cloud platforms in your README. It could be as simple as "if running this on default settings on a single whole-genome BAM file, you can expect it to take about 4 hours and to cost about $12.00," or you could have a full breakdown of every task's estimated costs depending on whether or not you get lucky with preemptible VMs. There is no one-size-fits-all solution to cost estimation; include what you think will be helpful to your users.

## Author
[Ash O'Farrell](mailto:aofarrel@ucsc.edu) -- University of California, Santa Cruz, Baskin Engineering, Genomics Insitute, The Desk That Is Located Near The Windowsill Upon Which I Found A Stray Whiteboard Marker Which I Used To Write That All Workflows Ought To Include Authorship Information In Their README

## References
["Video: Kirill Petrenko conducts 4′33″ by John Cage".](https://www.berliner-philharmoniker.de/en/news/detail/video-kirill-petrenko-conducts-433-by-john-cage/) Berliner Philharmoniker. November 2, 2020. Retrieved March 12, 2021.
