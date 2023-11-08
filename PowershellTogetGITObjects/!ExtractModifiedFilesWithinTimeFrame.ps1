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
        $diff = git diff --diff-filter=AMT --name-only $commit^..$commit
		git archive -o "$TargetDir$commit.zip" $commit $diff
        Expand-Archive -Path "$TargetDir$commit.zip" -DestinationPath "$TargetDir$commit" -Force    
        $commitHashList.Add($commit)
    }
    catch [System.Exception]
    {
        #Write-Warning -Message $Error[0].Exception.GetType().FullName#
    }
   $count = $count + 1
}

Remove-Item -path "$TargetDir*.zip"


Write-Host "Consolidating objects..."
$count = 0
ForEach($commit in $commitHashList)
{
    if($count -gt 0)
    {    
        try
        {
            $previousCommit = $commitHashList[ $count - 1]
            $CurrentTargDir = "$TargetDir$commit\"
            #Write-Host "copying $TargetDir$previousCommit\* to $CurrentTargDir ..."#
            Copy-Item -Path "$TargetDir$previousCommit\*" -Destination "$CurrentTargDir\" -Recurse -Force -ErrorAction SilentlyContinue
            Remove-Item -Path "$TargetDir$previousCommit" -Recurse
        }
        catch
        {
        
        }
    }
    $count = $count + 1
}

Write-Host "Delivered to $CurrentTargDir"
Write-Host ""


#Change back to script Directory#
cd $scriptDirectory