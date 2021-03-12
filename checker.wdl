version 1.0

import "https://raw.githubusercontent.com/aofarrel/quicksilver/main/quicksilver.wdl" as quick

task check_quicksilver {
  input {
    File report
    File truth
  }

  command <<<

  # Some cloud platforms scatter files at random
  # Sort to get some semblance of consistency

  sort ~{report} > newreport.txt
  sort ~{truth} > newtruth.txt

  
  md5sum newreport.txt > sum.txt

  cat ~{truth} | md5sum --check sum.txt
  # if pass pipeline records success
  # if fail pipeline records error

  >>>

  runtime {
    docker: "don't_forget_the_digest@sha256:AAAAAAAAAAAAAAAAAAA!"
    preemptible: 42
  }

}

workflow checker {
  input {
    File truth
    String teststring
  }

  call quicksilver.solong {
    input:
      obligatory_reference = teststring
  }

  meta {
    author: "Boaty McBoatface"
    email: "dont@me.twitter.com"
    description: "Make sure to include a desciption, as this will help discoverability on Dockstore."
    }
}
