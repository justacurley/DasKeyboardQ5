function New-LocalQ5Signal {
    [CmdletBinding()]
    param (
        #Local API port
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [validatenotnullorempty()]
        $port = '27301',
      
        #API function to call
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]        
        [alias('ID')]
        [string]
        $ProductID = 'DK5QPID'
    )
    #Selects -URI for invoke-webrequest
    $URISwitch = `
        switch ($APIFunction) {        
        AuthClients {'http://localhost:{0}/public-api/1.0/users/authorized_clients' -f $port}
        DeviceDefs {'http://localhost:{0}/public-api/1.0/device_definitions' -f $port}         
        Devices {'http://localhost:{0}/public-api/1.0/devices' -f $port}
        PreDefColors {'http://localhost:{0}/public-api/1.0/colors' -f $port}
        Zones {'http://localhost:{0}/public-api/1.0/DK5QPID/zones' -f $port} 
        Effects {'http://localhost:{0}/public-api/1.0/DK5QPID/effects' -f $port}
        GetSignal {'http://localhost:{0}/public-api/1.0/signals' -f $port}
        Default {} #no default, will break on $api validateset before getting here
    }    

    #Full set of parameters for invoke-webrequest
    $splat = @{
        URI = $URISwitch
        Headers = @{ Accept = 'application/json' }
    }
    
    #Returns json object
    return Invoke-RestMethod @splat
    
}


$uri = 'http://localhost:27301/api/1.0/signals'
$id = 'DK5QPID'
$x = 24
$y = 1
$zoneiD
$color = '#F00'
$effect = 'SET_COLOR'
$name = 'Color line'
$message = 'Setting color'
$shouldNotify


#get-nettcpconnection -State Listen -LocalAddress 127.0.0.1 | where localport -lt 49152 | foreach localport




 


