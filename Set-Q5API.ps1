

$foo = @{ 
        URI     = 'https://q.daskeyboard.com/api/1.0/users/authorized_clients' 
        Headers = @{'Authorization' = 'Bearer {0}' -f $oauth.access_token}
} 


Invoke-RestMethod -URI $foo.uri -headers $foo.headers -ContentType application/json
# $bar = @{ 
#     URI     = 'https://q.daskeyboard.com/oauth/1.4/token' 
#     Headers = @{'accept' = 'application/json'}
#     Method  = 'Post'
#     Body    = @{
#         'client_id'     = $clientID
#         'client_secret' = $ClientSC
#         'grant_type'    = "client_credentials"
#     }
# }