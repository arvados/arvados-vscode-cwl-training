cwlVersion: v1.0
label: CWL training lesson 4
class: Workflow
inputs:
  message: string
outputs: []
steps:
  echo:
    in:
      message: message
    out: []
    run: echo.cwl
