function Get-Q5API {
    [CmdletBinding()]
    param (
        #Full oAuth object returned by Get-Q5oAuth.ps1
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [validatenotnullorempty()]
        $oAuth,
      
        #API function to call
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [validateSet('AuthClients', 'DeviceDefs', 'Devices', 'PreDefColors', 'Zones', 'Effects', 'GetSignal')]
        [alias('API')]
        [string]
        $APIFunction
    )
    #Selects -URI for invoke-webrequest
    $URISwitch = `
        switch ($APIFunction) {        
        AuthClients {'https://q.daskeyboard.com/api/1.0/users/authorized_clients'}
        DeviceDefs {'https://q.daskeyboard.com/api/1.0/device_definitions'}         
        Devices {'https://q.daskeyboard.com/api/1.0/devices'}
        PreDefColors {'https://q.daskeyboard.com/api/1.0/colors'}
        Zones {'https://q.daskeyboard.com/api/1.0/DK5QPID/zones'} 
        Effects {'https://q.daskeyboard.com/api/1.0/DK5QPID/effects'}
        GetSignal {'https://q.daskeyboard.com/api/1.0/signals'}
        Default {} #no default, will break on $api validateset before getting here
    }    

    #Full set of parameters for invoke-webrequest
    $splat = @{
        URI = $URISwitch
        Headers = @{
            Authorization = 'Bearer {0}' -f $oauth.access_token
            Accept = 'application/json'
        }
    }
    
    #Returns json object
    return Invoke-RestMethod @splat
    
}

#Get-Q5API -oauth $oauth -API AuthClients -OutVariable foo 


 


