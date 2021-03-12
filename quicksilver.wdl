version 1.0

task solong {
  input {
    String obligatory_reference
  }
  command {
    echo "~{obligatory_reference}
  }
  runtime {
    docker: please_include_the_digest@sha256:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
}

workflow quicksilver {
  input {
    String obligatory_reference = "and thanks for all the fish"
  }
  call solong {
    input:
      String thankful
  }
}
