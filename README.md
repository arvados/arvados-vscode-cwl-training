These lessons give step by step instructions for using Visual Studio
Code to develop CWL workflows on Arvados.

1. Install & set up ssh client on Windows
1. Install vscode and relevant extensions
1. Use vscode to connect to an arvados shell node for development
1. Create an simple command line tool, run it, and view the log
1. Upload input, create a command line tool to process it, and view the output

# Windows SSH Setup

Linux and MacOS users can skip this step.

1. Install git for windows https://git-scm.com/download/win
1. Open git bash
1. Run “ssh-keygen”
1. Look for “Your public key has been saved in /c/Users/MyUsername/.ssh/id_rsa.pub”
1. Run “cat /c/Users/MyUsername/.ssh/id_rsa.pub”
1. Copy the lines starting with “ssh-rsa …”
1. Open Arvados workbench
1. Go to “SSH keys” in the user menu
1. Click + Add new ssh key
1. Paste the key into “Public key” and enter something for “name”
1. At the git bash command line, run “ssh shell…” and say “yes” if it asks “do you want to continue connecting”
1. You should be logged into the Arvados shell node.
1. Log out by typing “exit”

# VSCode setup

1. Install vscode https://code.visualstudio.com/ and start it up
1. Vscode: go to “Extensions”
   1. search for “remote development” and install the Remote Development extension pack from Microsoft
1. Vscode: On the left side bar, choose “Remote explorer”
   1. In the drop down, choose “SSH targets”
   1. Click “Add new”
   1. Enter the “ssh shell…” command line you used in step 1(j)
   1. Right click the ssh target in the list and select “connect to host in current window”
1. Vscode: go to “Extensions”
   1. Search for “benten” and install “CWL (Rabix/Benten)”
   1. Choose “Install extension on the remote ssh host”
1. Vscode: On the left side bar, choose “Explorer”
   1. Select “Clone Repository” and then enter “https://github.com/tetron/vscode-cwl-testing.git”
   1. Choose “Open”
1. Go to Arvados Workbench
   1. Workbench: In the user menu, select “Current token”
   1. Vscode: Click on the “Terminal” menu
   1. Vscode: Click “Run Task…”
   1. Vscode: Select “Configure Arvados”
   1. Workbench: Copy the string following “ARVADOS_API_HOST=”
   1. Vscode: Paste the string at the “Value for ARVADOS_API_HOST” prompt
   1. Workbench: Copy the string following “ARVADOS_API_TOKEN=”
   1. Vscode: Paste the string at the “Value for ARVADOS_API_TOKEN” prompt

# Register & run a workflow

1. Vscode: Click on the “lesson1/main.cwl” file
   1. Click on the “Terminal” menu
   1. Click “Run Task…”
   1. Select “Register or update CWL workflow on Arvados Workbench”
1. Workbench: Go to “+NEW” and select “New project”
   1. Enter a name for the project like “Lesson 1”
   1. You should arrive at the panel for the new project
1. Workbench: With “Lesson 1” selected
   1. Click on “+NEW” and select “Run a process”
   1. Select “CWL training lesson 1” from the list and click “Next”
   1. Enter a name for this run like “First training run”
   1. Enter a message (under “#main/message”) like “Hello world”
   1. Click “Run process”
   1. This should take you to a panel showing the workflow run status
1. Workbench: workflow run status panel
   1. Click on the three vertical dots in the top-right corner
   1. Choose “Log”
   1. Under “event type” choose “stdout”
   1. You should see your message

# Working with input and output files

1. Vscode: Click on the “lesson2/main.cwl” file
   1. Click on the “Terminal” menu
   1. Click “Run Task…”
   1. Select “Register or update CWL workflow on Arvados Workbench”
1. Go to your desktop
   1. Using a text editor such as notepad, create a file “message.txt”
   1. Enter a message like “Hello world” and save
1. Workbench: Go to “+NEW” and select “New project”
   1. Enter a name for the project like “Lesson 2”
   1. You should arrive at the panel for the new project
1. Arvados workbench: With “Lesson 2” project selected
   1. Click on +NEW and select “New collection”
   1. Call the collection “my message”
   1. Drag and drop “message.txt” into the browser
   1. Click “Create a collection”
   1. The file should be uploaded and then you will be on the collection page
1. Workbench: Select the “Lesson 2” project
   1. Click on “+NEW” and select “Run a process”
   1. Select “CWL training lesson 2” from the list and click “Next”
   1. Enter a name for this run like “Second training run”
   1. Click on “#main/message”
   1. A selection dialog box will appear
   1. Navigate to the collection you created in step (13) and choose “message.txt”
   1. Click “Run process”
   1. This should take you to a panel showing the workflow run status
1. Workbench: workflow run status panel
   1. Wait for the process to complete
   1. Click on the dot menu
   1. Choose “Outputs”
   1. Right click on “reverse.txt”
   1. Click on “Download”
   1. Open the downloaded file.  It should have your results.

# Register a workflow with default inputs

The default value for the “message” parameter will taken from the “lesson3/defaults.yaml” file

1. Workbench: Go to “+NEW” and select “New project”
   1. Enter a name for the project like “Lesson 3”
   1. You should arrive at the panel for the new project
1. Workbench: With “Lesson 3” selected
   1. Click on “+NEW” and select “Run a process”
   1. Select “CWL training lesson 3” from the list and click “Next”
   1. Enter a name for this run like “Third training run”
   1. The “#main/message” parameter will be pre-filled with your default value.  You can choose to change it or use the default.
   1. Click “Run process”
   1. This should take you to the status page for this workflow

# Run a workflow without registering it

The “message” parameter will be taken from the file “lesson4/main-input.yaml”.  This is useful during development.

1. Workbench: Go to “+NEW” and select “New project”
   1. Enter a name for the project like “Lesson 4”
   1. You should arrive at the panel for the new project
   1. Click on “Additional info” in the upper right to expand the “info” panel
   1. Under “Project UUID” click the “Copy to clipboard” button
1. Vscode: Select the file “lesson4/main.cwl”
   1. Click on the “Terminal” menu
   1. Click “Run Task…”
   1. Select “Set Arvados project UUID”
   1. Paste the project UUID from workbench at the prompt
1. Vscode: Select the file “lesson4/main.cwl”
   1. Click on the “Terminal” menu
   1. Click “Run Task…”
   1. Select “Run CWL workflow on Arvados”
1. Vscode: In the bottom panel select the “Terminal” tab
   1. In the upper right corner of the Terminal tab select “Task - Run CWL Workflow” from the drop-down
   1. Look for logging text like “submitted container_request zzzzz-xvhdp-0123456789abcde”
   1. Highlight and copy the workflow identifier (this the string containing -xvhdp- in the middle)
   1. The results of this run will appear in the terminal when the run completes.
1. Workbench: Paste the workflow identifier into the search box
   1. This will take you to the status page for this workflow
