param($CloneDir, $TargetDir, $FromDate, $ToDate)
#Print Input Param Values to command line
Write-Host "Clone Directory = $CloneDir"
Write-Host "Target Directory = $TargetDir"
Write-Host "FromDate Directory = $FromDate"
Write-Host "ToDate Directory = $ToDate"

$commitHashList = New-Object Collections.Generic.List[String]
$scriptDirectory = Get-Location
$CurrentTargDir = ""

git config --system core.longpaths true

#Change to Clone Directory#
Write-Host ""
Write-Host "Filtering commits within the time frame $FromDate, $ToDate..."
cd $CloneDir

#Get Commit list within time frame
git log --reverse --since=$FromDate --until=$ToDate --pretty=format:"%h"
$commits = git log --reverse --since=$FromDate --until=$ToDate --pretty=format:"%h"

Write-Host "Downloading commits as Archives..."
$count = 1
ForEach($commit in $commits){
    ECHO "Downloading archives for commit:$commit ..."
    try
    {
        $commitHashList.Add($commit)
        $diff = git diff --diff-filter=AMT --name-only $commit^..$commit
		git archive -o "$TargetDir$commit.zip" $commit $diff
        Expand-Archive -Path "$TargetDir$commit.zip" -DestinationPath "$TargetDir$commit" -Force            
    }
    catch [System.Exception]
    {
        #Write-Warning -Message $Error[0].Exception.Message
        Write-Warning -Message "Archiving failed because of too many file. Taking alternate route.."
        $diff = git diff --diff-filter=AMT --name-only $commit^..$commit
        ForEach($file in $diff)
        {
            git archive -o "$TargetDir$commit.zip" $commit $file
            Expand-Archive -Path "$TargetDir$commit.zip" -DestinationPath "$TargetDir$commit" -Force 
            #C:\temp\7-Zip\7z.exe a $TargetDir$commit.Zip $file
        }
    }
   $count = $count + 1
}

Remove-Item -path "$TargetDir*.zip"


Write-Host "Consolidating objects..."
for($i = $commitHashList.Count-1;$i -gt 0 ; $i=$i-1)
{
    try
    {
        $previousCommit = $commitHashList[ $i - 1]
        $currentCommit = $commitHashList[ $i ]
        $CurrentTargDir = "$TargetDir$currentCommit"
        $PreviousTargDir = "$TargetDir$previousCommit"
        Write-Host "copying $CurrentTargDir\* to $PreviousTargDir\ ..."#
        Copy-Item -Path "$CurrentTargDir\*" -Destination "$PreviousTargDir\" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-Item -Path "$CurrentTargDir" -Recurse
    }
    catch
    {
    
    }
}

Write-Host "Delivered to $PreviousTargDir"
Write-Host ""


#Change back to script Directory#
cd $scriptDirectory