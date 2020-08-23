<#
.SYNOPSIS
    Start-Metronome to help you keep beat while practicing music or any other rhythm based activity
.DESCRIPTION
    Starts the PS metronome to help you keep beat, plays a sound given the specified BPM
.EXAMPLE
    PS C:\> Start-Metronome -BPM 70
    Starts a Metronome with a BPM (Beats Per Min) of 70, press any key to stop
.PARAMETER BPM
    Specifies exact beats per min, defaults to 60. Limit is between 1 and 2000
.OUTPUTS
    N/A
.NOTES
    General notes
#>
function Start-Metronome {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter()]
        [ValidateRange(1,2000)]
        [Int32]
        $BPM = 60
    )
    
    process {
        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $count = 1
        Write-Output "Metronome started :: $BPM BPM"
        Write-Output "Press any key to stop."
        do {
            [double]$Milliseconds  = (60 / $BPM) * 1000
            if (($stopwatch.Elapsed.TotalMilliseconds / $count) -ge $Milliseconds){
            [console]::beep(500,200)
            $count++
            }
            # Implemented to break loop on any key press.
            if ([console]::KeyAvailable){
                break;
            }
        } while ($true )
    }
    
}