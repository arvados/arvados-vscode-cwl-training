cwlVersion: v1.0
label:  CWL training lesson 2
class: Workflow
inputs:
  message: File
outputs:
  reversed:
    type: File
    outputSource: rev/reversed
steps:
  rev:
    in:
      message: message
    out: [reversed]
    run: rev.cwl
