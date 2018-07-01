
function Get-Q5oAuth { 
        [CmdletBinding()]
        param (
            #Amount purchased
            [Parameter(Mandatory = $true,
                ValueFromPipelineByPropertyName = $true)]
            [validatenotnullorempty()]        
            [alias('ID')]
            [string]
            $ClientID,

            [Parameter(Mandatory = $true,
                ValueFromPipelineByPropertyName = $true)]
            [validatenotnullorempty()]        
            [alias('SEC')]
            [string]
            $ClientSEC
        )

        #Full set of parameters for invoke-webrequest
        $splat = @{ 
            URI     = 'https://q.daskeyboard.com/oauth/1.4/token' 
            Headers = @{'accept' = 'application/json'}
            Method  = 'Post'
            Body    = @{
                'client_id'     = $clientID
                'client_secret' = $ClientSC
                'grant_type'    = "client_credentials"
            }
        } 

        #Returns json object
        return Invoke-RestMethod @splat
       
}

#Get-Q5oAuth -ID $clientID -SEC $clientSC -outvariable bar