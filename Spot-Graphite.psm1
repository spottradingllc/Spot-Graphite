Function Connect-ToGraphite {
	
	param (
	
		[Parameter( Mandatory = $true )]
        [string]
        $GraphiteServer
	
	)
		
	$ErrorActionPreference = "Stop"

	#Error handling
	trap {
		
		If ($_.Exception.Message -match "target machine actively refused") {
		
			Write-Host "Reconnecting to $GraphiteServer ..."
			
			Start-Sleep 10
			
			Connect-ToGraphite
			
		}
		
		Else { $_.Exception.Message }
			
		continue		
	}

	#Socket to send results to Graphite server
	$global:socket = new-object System.Net.Sockets.TcpClient($GraphiteServer, 2003)
	$global:stream = $socket.GetStream()
	$global:writer = new-object System.IO.StreamWriter $stream

	Write-Output "Connected to $GraphiteServer"
	
}
	
Function Send-ToGraphite {

    param (

        [Parameter( Mandatory = $true )]
        [datetime]
        $Time,

        [Parameter( Mandatory = $true )]
        [string]
        $CustomPath,

        [Parameter( Mandatory = $true )]
        [int]
        $Value,

        [Parameter( Mandatory = $true )]
        [string]
        $GraphiteServer

    )
	
    Connect-ToGraphite -GraphiteServer $GraphiteServer
	
	#Sending snapshot start time to Graphite
	$TimeUTC = (Get-Date $Time).ToUniversalTime()
			
	#Get Timestamp of stats and convert to UNIX timestamp
	$DateEpoch = [int][double]::Parse((Get-Date -Date $TimeUTC -UFormat %s))
			
	$GraphiteData = "$CustomPath $Value $DateEpoch"

 	Write-Output "Sending $GraphiteData to $GraphiteServer"
	
	$writer.WriteLine( $GraphiteData )
	$writer.Flush()
	
	$writer.Close()
	$stream.Close()
	$socket.Close()

 }
