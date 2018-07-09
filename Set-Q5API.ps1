function Set-Q5API {
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
            [validateSet('RevokeClient', 'NewSignal', 'UpdateSignal', 'DeleteSignal', 'Zones', 'Effects', 'GetSignal')]
            [alias('API')]
            [string]
            $APIFunction
        )
}
