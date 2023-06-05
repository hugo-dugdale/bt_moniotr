# Script that runs Kismet for Bluetooth packet capturing on the Ubertooth One. It creates a
# new output file everyday.

# Initialise variables
now=''
pid=''

# Start open ended loop and check for date change
while true; do
    # Check if date has changed
    new_now=$(date +'%m/%d/%Y')

    # Sleep if no date change
    if [ "$new_now" == "$now" ]; then
        sleep 60

    # Start capture again if new date
    else
        # Kill process 
        [ -z $pid ] || kill -9 $pid

        # Run kismet and capture new date and process id
        kismet -c ubertooth-0 --no-ncurses &> /dev/null &        
        pid=$!
        now=$(date +'%m/%d/%Y')    
    fi
done