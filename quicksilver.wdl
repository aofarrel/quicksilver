version 1.0

task solong {
  input {
    String obligatory_reference
  }
  command {
    echo "~{obligatory_reference} > douglas.txt
  }
  runtime {
    docker: please_include_the_digest@sha256:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
  }
  output {
    File "douglas.txt"
  }
}

workflow quicksilver {
  input {
    String obligatory_reference = "and thanks for all the fish"
  }
  call solong {
    input:
      String thankful
  }
  meta {
    author: "Boaty McBoatface"
    email: "dont@me.twitter.com"
    description: "Make sure to include a desciption, as this will help discoverability on Dockstore."
  }
}
