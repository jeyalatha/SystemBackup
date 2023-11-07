 1) Get the following objects from Git Repo : <<>>
	- DependencyParser_1.zip
	- DependencyParser_2.zip
	- DependencyParser_3.zip
	- DependencyParser_4.zip
	- PLFGateWay.zip
	- PreRequisites.zip
	
 2) Connect to Platform Model Web Server
 
 3) Create a folder named "PreRequisites" under <<VirtualWorks>>
 
 4) Extract PreRequisites.zip content to the <<VirtualWorks\PreRequisites>> folder
 
 5) Create a folder named "DependencyParser" under <<VirtualWorks\IIS>>
 
 6) Extract the following zip folders content to the "DependencyParser"
	folder:
	- DependencyParser_1.zip
	- DependencyParser_2.zip
	- DependencyParser_3.zip
	- DependencyParser_4.zip
	
 7) Create a folder named "PLFGateway" under <<VirtualWorks\IIS>>
 
 8) Extract the following zip folders content to the "PLFGateway" folder
	- PLFGateWay.zip

 9) Open command prompt, Type "node -v" and press "Enter"
 
10) Check Node version is "v18" or above

11) If not, run the installer "node-v18.16.0-x64.msi" from 
	"PreRequisites" folder and install

12) Open InetMgr (IIS Manager)

13) Create the following "Application Pools" with default settings
	- DependencyParser
	- PLFGateWay

14) Create a new application "DependencyParser" under 
	"Default Web Site" and map respective AppPool 
	
15) Select the newly created application

16) Check "URL Rewrite" option available under "IIS" group from the 
	right pane

17) If not, run the following installers one by one from 
	"PreRequisites" folder and install
	- rewrite_amd64_en-US.msi
	- requestRouter_amd64.msi

18) After install, Select "DependencyParser" application in IIS Manager

19) Open "URL Rewrite" option

20) Click on "Add Rules" from top right corner

21) Open "Reverse Proxy" option from the dialog box

22) In the "Server Name" edit box, provide the hard-coded value:
	"localhost:3000" and click "OK" button

23) Create a new application "PLFGateway" under 
	"Default Web Site" and map respective AppPool
	
24) Select the newly created application

25) Open "URL Rewrite" option

26) Click on "Add Rules" from top right corner

27) Open "Reverse Proxy" option from the dialog box

28) In the "Server Name" edit box, provide the hard-coded value:
	"localhost:3003" and click "OK" button

29) Open <<VirtualWorks\IIS\DependencyParser\.next\server\pages\index.html>>

30) Find "apiEndPointDep" and provide "Platform Model" Endpoint
	[Eg: http://<<SERVER_NAME>>/plfgateway/depparser]

31) Find "apiEndPointDepRev" and provide the following Endpoint
	[Eg: http://<<SERVER_NAME>/plfgateway/depparserrev]

32) Before providing configurations, test the API executions from Postman,
	inside the Platform Model Web Server and not from any client

33) Post man can be installed from "PreRequisites" folder "Postman-win64-7.2.2-Setup.exe"

34) Open command window in Administrator mode

35) Change folder to <<VirtualWorks\IIS\DependencyParser>>

36) Execute command "npm start" and check for successful running

37) Open <<VirtualWorks\IIS\PlfGateway\dist\Public\AppSettings.json>> file in nodepad

38) Provide "Referenced Entity" Platform Model API details in "DP_MODEL" section

39) Provide "Referenced Entity" Application API details in "DP_APPLICATION" section

40) Provide "Referencing Entity" Platform Model API details in "DP_REV_MODEL" section

41) Provide "Referencing Entity" Application API details in "DP_REV_APPLICATION" section

42) Open command window in Administrator mode

43) Change folder to <<VirtualWorks\IIS\PlfGateway>>

44) Execute command "npm start" and check for successful running

45) Let both the command window run and do not close

46) Open "C:\inetpub\wwwroot" folder (_next,assets)

47) Copy the following folders from the path <<VirtualWorks\IIS\DependencyParser\out>>
	 and paste it here
	