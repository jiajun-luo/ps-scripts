# Define function to list network swaps in the past day
function Get-NetworkSwaps {
    $pastHours = 24
    $startDate = (Get-Date).AddHours(-$pastHours)

    # Get events from the 'Microsoft-Windows-NetworkProfile/Operational' log
    $networkSwaps = Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-NetworkProfile/Operational'; StartTime=$startDate} |

    # Filter events with ID 10000 (network swaps)
    Where-Object { $_.Id -eq 10000 } |

    # Select relevant properties
    Select-Object TimeCreated, @{Name='Interface'; Expression={ $_.Properties[0].Value }}

    if ($networkSwaps) {
        # Display the results in a table
        $networkSwaps | Format-Table -AutoSize
    }
    else {
        Write-Output "No network swaps found in the past $pastHours hours."
    }
}

# Call function
Get-NetworkSwaps