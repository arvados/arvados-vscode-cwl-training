cwlVersion: v1.0
class: CommandLineTool
inputs:
  message: string
outputs: []
arguments: [echo, $(inputs.message)]
