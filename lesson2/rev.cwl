cwlVersion: v1.0
class: CommandLineTool
inputs:
  message: File
arguments: [rev, $(inputs.message)]
stdout: reversed.txt
outputs:
  reversed: stdout
