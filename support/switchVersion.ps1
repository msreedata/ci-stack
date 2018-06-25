function Replace-VersionForCISource {
    <#
    .SYNOPSIS
    Update version number in file
    .DESCRIPTION
    Replace version for passed file, for CI demo
    #>
    [CmdletBinding()]
    param(
        # ModuleName
        [Parameter(Mandatory=$true)]
        [string]$file,
        [Parameter(Mandatory=$true)]
        [string]$startsWith,
        [Parameter(Mandatory=$true)]
        [string]$newLine,
        [Parameter(Mandatory=$true)]
        [string]$newVersion
    )

    $isReplaced = $false
    $contents = gc $file
    $data = [System.Collections.Generic.List[String]]::new()
    foreach($line in $contents){
        if($line.StartsWith($check)){
            Write-Verbose "Replacing version as $newVesion"
            $data.add($newline)
            $isReplaced = $true
        }else{
            $data.add($line)
        }
    }

    $data  | out-file -encoding ASCII $file

    if($isReplaced){
        Write-Verbose "Version replaced...."
    }else{
        Write-Warning "Failed to replace version in $file"
    }
}


function Update-ServerCs ($version)
{
    $param = @{
        file = "$PSScriptroot\..\rest-api-dotnet\Controllers\v2\FoodsController.cs"
        startsWith = "            return Ok("
        newLine = '            return Ok("VERSION");'.Replace('VERSION',$version)
        newVersion = $version
    }
    Replace-VersionForCISource @param
}
function Update-ServerStackYml ($version)
{
    $param = @{
        file = "$PSScriptroot\..\stacks\Stackfile-REST.yml"
        startsWith = '    image: linBox:5000/restdotnet:v'
        newLine = '    image: linBox:5000/restdotnet:vVERSION'.Replace('VERSION',$version)
        newVersion = $version
    }
    Replace-VersionForCISource @param
}

function Update-ServerBuildImage ($version)
{
    $param = @{
        file = "$PSScriptroot\..\stacks\buildImages.sh"
        startsWith = '    rest_api_version=v'
        newLine = '    rest_api_version=vVERSION'.Replace('VERSION',$version)
        newVersion = $version
    }
    Replace-VersionForCISource @param
}


function Update-ClientJson ($version)
{
    $param = @{
        file = "$PSScriptroot\..\rest-client-node\src\assets\config.json"
        startsWith = '  "name": "REST Client v'
        newLine = '  "name": "REST Client vVERSION",'.Replace('VERSION',$version)
        newVersion = $version
    }
    Replace-VersionForCISource @param
}
function Update-ClientStackYml ($version)
{
    $param = @{
        file = "$PSScriptroot\..\stacks\Stackfile-REST.yml"
        startsWith = '    image: linBox:5000/restnode:v'
        newLine = '    image: linBox:5000/restnode:vVERSION'.Replace('VERSION',$version)
        newVersion = $version
    }
    Replace-VersionForCISource @param
}
function Update-ClientBuildImage ($version)
{
    $param = @{
        file = "$PSScriptroot\..\stacks\buildImages.sh"
        startsWith = '    rest_client_version=v'
        newLine = '    rest_client_version=vVERSION'.Replace('VERSION',$version)
        newVersion = $version
    }
    Replace-VersionForCISource @param
}



$r = Read-Host -Prompt "Set Service version now? (y/n)"
$setService = $r -ne 'y'
if($setService){
    #prompt for manual entry
    $serviceVersion = Read-Host -Prompt "Enter the new version number for REST API Service (x.x.x)"
    if($serviceVersion -and ($serviceVersion.Length -gt 5)){
        #$file = "$PSScriptroot\..\rest-api-dotnet\Controllers\v2\FoodsController.cs".
        Update-ServerCs $serviceVersion
        Update-ServerStackYml $serviceVersion
        Update-ServerBuildImage $serviceVersion
    }else{
        Write-Warning -Message "invalid version number specified.skipping update"
    }
}