function load($path)
{   
    cls
                    
    [xml] $conf = (gc $path)
    write-host "$path loaded. Choose site to remove from the file`n" 

    $sites = @()
    $cnt = 0

    foreach ($site in $conf."configuration"."system.applicationHost"."sites".ChildNodes)
    {
        if ($site.LocalName -eq "site")
        {
            write-host $cnt : $site.Name 
            $sites += $site
            $cnt++
        }
    }

    write-host "Q : Quit`n"

    $opt = (read-host "Choose option").ToLower()
    if ($opt -eq "q")
    {
        return $FALSE
    }
    else
    {
        trap
        {
            write-host "Error while modifying XML"
            exit 
        }
        $optInt = [Int32]::Parse($opt)
        $conf."configuration"."system.applicationHost"."sites".RemoveChild($sites[$optInt]) | Out-Null
        write-host "Deleted"
        start-sleep -s 1
        $conf.Save($path)
    }
    
    return $TRUE
}

$path = "$env:USERPROFILE\Documents\IISExpress\config\applicationhost.config"
cpi $path "$path.bak"
while(load -path "$path"){ }



